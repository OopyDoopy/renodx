[CmdletBinding()]
param(
    [string]$Folder = '',
    [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Folder)) {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $Folder = Join-Path $scriptDir '..'
}

if (-not (Test-Path -LiteralPath $Folder)) {
    throw "Folder not found: $Folder"
}

$folderPath = (Resolve-Path -LiteralPath $Folder).Path
$files = @(Get-ChildItem -LiteralPath $folderPath -File -Filter '*.hlsl' |
    Where-Object {
        $_.Name -match '^(RenderPostProcessPS|postprocessing_final|postprocessing_final_fsr)_0x[0-9A-Fa-f]+\.ps_6_6\.hlsl$'
    })
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$updatedFiles = New-Object System.Collections.Generic.List[string]
$missingPattern = New-Object System.Collections.Generic.List[string]

function Find-BlockEnd {
    param(
        [Parameter(Mandatory)] [string]$Text,
        [Parameter(Mandatory)] [int]$OpenBraceIndex
    )

    $depth = 1
    $index = $OpenBraceIndex + 1
    while ($index -lt $Text.Length -and $depth -gt 0) {
        $char = $Text[$index]
        if ($char -eq '{') {
            $depth++
        } elseif ($char -eq '}') {
            $depth--
        }
        $index++
    }

    if ($depth -ne 0) {
        return -1
    }

    return $index
}

function Find-IfElseEnd {
    param(
        [Parameter(Mandatory)] [string]$Text,
        [Parameter(Mandatory)] [System.Text.RegularExpressions.Match]$IfMatch
    )

    $ifOpenBrace = $Text.IndexOf('{', $IfMatch.Index)
    if ($ifOpenBrace -lt 0) { return -1 }

    $ifEnd = Find-BlockEnd -Text $Text -OpenBraceIndex $ifOpenBrace
    if ($ifEnd -lt 0) { return -1 }

    $cursor = $ifEnd
    while ($cursor -lt $Text.Length -and [char]::IsWhiteSpace($Text[$cursor])) { $cursor++ }
    if ($cursor + 4 -gt $Text.Length -or $Text.Substring($cursor, 4) -ne 'else') {
        return $ifEnd
    }

    $cursor += 4
    while ($cursor -lt $Text.Length -and [char]::IsWhiteSpace($Text[$cursor])) { $cursor++ }
    if ($cursor -ge $Text.Length -or $Text[$cursor] -ne '{') {
        return $ifEnd
    }

    return (Find-BlockEnd -Text $Text -OpenBraceIndex $cursor)
}

function Find-LineStart {
    param([string]$Text, [int]$Index, [string]$Newline)
    $lineStart = $Text.LastIndexOf($Newline, $Index)
    if ($lineStart -lt 0) { return 0 }
    return $lineStart + $Newline.Length
}

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $originalContent = $content
    $newline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }
    $missing = $false

    if ($content -notmatch '(?m)^#include\s+"\.\./common\.hlsl"\r?$') {
        $content = '#include "../common.hlsl"' + $newline + $newline + $content
    }

    $isHdr = $content.Contains('78.84375f')
    $hasDepth = $content.Contains('__3__36__0__0__g_depth')

    $sceneSampleMatch = [regex]::Match($content, '(?m)^\s*(?:(?:float4)\s+)?(_\d+)\s*=\s*__3__36__0__0__g_sceneColor\.Sample\(')
    if (-not $sceneSampleMatch.Success) {
        $missing = $true
    }
    $sceneSample = if ($sceneSampleMatch.Success) { $sceneSampleMatch.Groups[1].Value } else { '' }

    $chromaticMatch = [regex]::Match($content, 'if\s*\(\s*_postProcessParams\.w\s*>\s*0\.0f\s*\)\s*\{')
    $redVar = ''
    $blueVar = ''
    if ($chromaticMatch.Success -and -not $content.Contains('CUSTOM_CHROMATIC_ABERRATION')) {
        $chromaticEnd = Find-IfElseEnd -Text $content -IfMatch $chromaticMatch
        if ($chromaticEnd -gt 0 -and -not [string]::IsNullOrWhiteSpace($sceneSample)) {
            $chromaticBlock = $content.Substring($chromaticMatch.Index, $chromaticEnd - $chromaticMatch.Index)
            $redMatch = [regex]::Match($chromaticBlock, "(?m)^\s*(_\d+)\s*=\s*$([regex]::Escape($sceneSample))\.x\s*;")
            $blueMatch = [regex]::Match($chromaticBlock, "(?m)^\s*(_\d+)\s*=\s*$([regex]::Escape($sceneSample))\.z\s*;")
            if ($redMatch.Success -and $blueMatch.Success) {
                $redVar = $redMatch.Groups[1].Value
                $blueVar = $blueMatch.Groups[1].Value
                $insert = $newline +
                    "  // RenoDX: >>> [Patch: FinalChromaticAberration] [Version: 1.10]$newline" +
                    "  $redVar = lerp($sceneSample.x, $redVar, CUSTOM_CHROMATIC_ABERRATION);$newline" +
                    "  $blueVar = lerp($sceneSample.z, $blueVar, CUSTOM_CHROMATIC_ABERRATION);$newline" +
                    "  // RenoDX: <<< [Patch: FinalChromaticAberration]$newline"
                $content = $content.Substring(0, $chromaticEnd) + $insert + $content.Substring($chromaticEnd)
            } else {
                $missing = $true
            }
        } else {
            $missing = $true
        }
    }

    $filmGrainMatch = [regex]::Match($content, 'if\s*\(\s*_slopeParams\.w\s*>\s*0\.0f\s*\)\s*\{')
    if ($filmGrainMatch.Success -and -not $content.Contains('CUSTOM_FILM_GRAIN_TYPE == 0')) {
        $lineStart = Find-LineStart -Text $content -Index $filmGrainMatch.Index -Newline $newline
        $prefix = "  // RenoDX: >>> [Patch: CustomFilmGrainGate] [Version: 1.10]$newline" +
            "  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;$newline" +
            "  // RenoDX: <<< [Patch: CustomFilmGrainGate]$newline"
        $content = $content.Substring(0, $lineStart) + $prefix + $content.Substring($lineStart)
        $content = [regex]::Replace($content, 'if\s*\(\s*_slopeParams\.w\s*>\s*0\.0f\s*\)\s*\{', 'if (vanilla_film_grain) {', 1)
    }

    if (-not $content.Contains('CustomPostProcessing(')) {
        $filmGateMatch = [regex]::Match($content, 'if\s*\(\s*vanilla_film_grain\s*\)\s*\{')
        if ($filmGateMatch.Success) {
            $filmEnd = Find-IfElseEnd -Text $content -IfMatch $filmGateMatch
            $filmBlock = $content.Substring($filmGateMatch.Index, $filmEnd - $filmGateMatch.Index)
            if ([string]::IsNullOrWhiteSpace($redVar) -or [string]::IsNullOrWhiteSpace($blueVar)) {
                $redMatch = [regex]::Match($content, "(?m)^\s*(_\d+)\s*=\s*$([regex]::Escape($sceneSample))\.x\s*;")
                $blueMatch = [regex]::Match($content, "(?m)^\s*(_\d+)\s*=\s*$([regex]::Escape($sceneSample))\.z\s*;")
                if ($redMatch.Success) { $redVar = $redMatch.Groups[1].Value }
                if ($blueMatch.Success) { $blueVar = $blueMatch.Groups[1].Value }
            }
            $colorMatch = [regex]::Match($filmBlock, "(?s)else\s*\{\s*(_\d+)\s*=\s*$([regex]::Escape($redVar))\s*;\s*(_\d+)\s*=\s*$([regex]::Escape($sceneSample))\.y\s*;\s*(_\d+)\s*=\s*$([regex]::Escape($blueVar))\s*;")
            if ($filmEnd -gt 0 -and $colorMatch.Success) {
                $colorX = $colorMatch.Groups[1].Value
                $colorY = $colorMatch.Groups[2].Value
                $colorZ = $colorMatch.Groups[3].Value

                if ($isHdr) {
                    $postProcessBlock = $newline +
                        "  // RenoDX: >>> [Patch: FinalCustomPostProcessingHDR] [Version: 1.10]$newline" +
                        "  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {$newline" +
                        "    float3 color_pq = float3($colorX, $colorY, $colorZ);$newline$newline" +
                        "    float scaling = RENODX_TONE_MAP_TYPE == 0 ? 100.0f : RENODX_DIFFUSE_WHITE_NITS;$newline" +
                        "    float3 color_bt2020 = renodx::color::pq::DecodeSafe(color_pq, scaling);$newline" +
                        "    float3 color_bt709 = renodx::color::bt709::from::BT2020(color_bt2020);$newline" +
                        "    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 0, scaling);$newline" +
                        "    color_bt2020 = renodx::color::bt2020::from::BT709(color_bt709);$newline" +
                        "    color_pq = renodx::color::pq::EncodeSafe(color_bt2020, scaling);$newline$newline" +
                        "    $colorX = color_pq.x;$newline" +
                        "    $colorY = color_pq.y;$newline" +
                        "    $colorZ = color_pq.z;$newline" +
                        "  }$newline" +
                        "  // RenoDX: <<< [Patch: FinalCustomPostProcessingHDR]$newline"
                } else {
                    $postProcessBlock = $newline +
                        "  // RenoDX: >>> [Patch: FinalCustomPostProcessingSDR] [Version: 1.10]$newline" +
                        "  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {$newline" +
                        "    float3 color_bt709 = renodx::color::srgb::Decode(float3($colorX, $colorY, $colorZ));$newline" +
                        "    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);$newline" +
                        "    color_bt709 = renodx::color::srgb::Encode(color_bt709);$newline" +
                        "    $colorX = color_bt709.x;$newline" +
                        "    $colorY = color_bt709.y;$newline" +
                        "    $colorZ = color_bt709.z;$newline" +
                        "  }$newline" +
                        "  // RenoDX: <<< [Patch: FinalCustomPostProcessingSDR]$newline"
                }

                $content = $content.Substring(0, $filmEnd) + $postProcessBlock + $content.Substring($filmEnd)
            } else {
                $missing = $true
            }
        } else {
            $missing = $true
        }
    }

    if ($isHdr -and -not $content.Contains('CUSTOM_SHARPENING) +')) {
        $content = [regex]::Replace($content, '(?m)^(\s*_\d+\s*=\s*\(\(_\d+\s*\*\s*_\d+)(\)\s*\+\s*_\d+\);)', '$1 * CUSTOM_SHARPENING$2', 3)
    }

    if ($isHdr -and -not $content.Contains('Patch: RemoveFinalSrgbDecodeHDR')) {
        $srgbDecodePattern = '(?m)^(?<indent>\s*)float\s+(?<out>_\d+)\s*=\s*\((?<scale>_\d+)\s*\*\s*select\(\((?<in>_\d+)\s*<\s*0\.040449999272823334f\),\s*\(\k<in>\s*\*\s*0\.07739938050508499f\),\s*exp2\(log2\(\(\k<in>\s*\+\s*0\.054999999701976776f\)\s*\*\s*0\.9478673338890076f\)\s*\*\s*2\.4000000953674316f\)\)\)\s*\+\s*(?<offset>_\d+)\s*;\r?$'
        $srgbDecodeMatches = @([regex]::Matches($content, $srgbDecodePattern))
        if ($srgbDecodeMatches.Count -ge 3) {
            $firstSrgbDecode = $srgbDecodeMatches[0]
            $thirdSrgbDecode = $srgbDecodeMatches[2]
            $replacementLines = @(
                "$($firstSrgbDecode.Groups['indent'].Value)// RenoDX: >>> [Patch: RemoveFinalSrgbDecodeHDR] [Version: 1.10]",
                "$($srgbDecodeMatches[0].Groups['indent'].Value)float $($srgbDecodeMatches[0].Groups['out'].Value) = ($($srgbDecodeMatches[0].Groups['scale'].Value) * $($srgbDecodeMatches[0].Groups['in'].Value)) + $($srgbDecodeMatches[0].Groups['offset'].Value);",
                "$($srgbDecodeMatches[1].Groups['indent'].Value)float $($srgbDecodeMatches[1].Groups['out'].Value) = ($($srgbDecodeMatches[1].Groups['scale'].Value) * $($srgbDecodeMatches[1].Groups['in'].Value)) + $($srgbDecodeMatches[1].Groups['offset'].Value);",
                "$($srgbDecodeMatches[2].Groups['indent'].Value)float $($srgbDecodeMatches[2].Groups['out'].Value) = ($($srgbDecodeMatches[2].Groups['scale'].Value) * $($srgbDecodeMatches[2].Groups['in'].Value)) + $($srgbDecodeMatches[2].Groups['offset'].Value);",
                "$($thirdSrgbDecode.Groups['indent'].Value)// RenoDX: <<< [Patch: RemoveFinalSrgbDecodeHDR]"
            )
            $replacement = $replacementLines -join $newline
            $replaceStart = $firstSrgbDecode.Index
            $replaceEnd = $thirdSrgbDecode.Index + $thirdSrgbDecode.Length
            $content = $content.Substring(0, $replaceStart) + $replacement + $content.Substring($replaceEnd)
        } else {
            $missing = $true
        }
    }

    if (-not $isHdr -and $hasDepth -and -not $content.Contains('FinalSharpeningStrength')) {
        $depthSampleMatch = [regex]::Match($content, '__3__36__0__0__g_depth\.Sample\([^;]+;')
        $depthMatch = $null
        if ($depthSampleMatch.Success) {
            $depthMatch = [regex]::Match($content.Substring($depthSampleMatch.Index + $depthSampleMatch.Length), 'if\s*\(')
            if ($depthMatch.Success) {
                $depthMatch = [regex]::Match($content, 'if\s*\(', [System.Text.RegularExpressions.RegexOptions]::None, [timespan]::FromSeconds(1))
                foreach ($candidateDepthMatch in [regex]::Matches($content, 'if\s*\(')) {
                    if ($candidateDepthMatch.Index -gt $depthSampleMatch.Index) {
                        $depthMatch = $candidateDepthMatch
                        break
                    }
                }
            }
        }

        if ($null -ne $depthMatch -and $depthMatch.Success) {
            $depthEnd = Find-IfElseEnd -Text $content -IfMatch $depthMatch
            if ($depthEnd -gt 0) {
                $depthBlock = $content.Substring($depthMatch.Index, $depthEnd - $depthMatch.Index)
                $elseAssigns = [regex]::Matches($depthBlock, '(?m)^\s*(_\d+)\s*=\s*(_\d+)\s*;')
                if ($elseAssigns.Count -ge 3) {
                    $out1 = $elseAssigns[$elseAssigns.Count - 3].Groups[1].Value
                    $in1 = $elseAssigns[$elseAssigns.Count - 3].Groups[2].Value
                    $out2 = $elseAssigns[$elseAssigns.Count - 2].Groups[1].Value
                    $in2 = $elseAssigns[$elseAssigns.Count - 2].Groups[2].Value
                    $out3 = $elseAssigns[$elseAssigns.Count - 1].Groups[1].Value
                    $in3 = $elseAssigns[$elseAssigns.Count - 1].Groups[2].Value
                    $sharpenBlock = $newline +
                        "  // RenoDX: >>> [Patch: FinalSharpeningStrength] [Version: 1.10]$newline" +
                        "  $out1 = lerp($in1, $out1, CUSTOM_SHARPENING);$newline" +
                        "  $out2 = lerp($in2, $out2, CUSTOM_SHARPENING);$newline" +
                        "  $out3 = lerp($in3, $out3, CUSTOM_SHARPENING);$newline" +
                        "  // RenoDX: <<< [Patch: FinalSharpeningStrength]$newline"
                    $content = $content.Substring(0, $depthEnd) + $sharpenBlock + $content.Substring($depthEnd)
                } else {
                    $missing = $true
                }
            } else {
                $missing = $true
            }
        }
    }

    if (-not $content.Contains('CUSTOM_VIGNETTE')) {
        $content = [regex]::Replace($content, '(_localToneMappingParams\.w[\s\S]*?saturate\(1\.0f - \(\(_\d+ \* _postProcessParams\.x)(\) \* dot\(float2)', '$1 * CUSTOM_VIGNETTE$2', 1)
    }

    if (-not $content.Contains('FinalizePostProcess')) {
        $targetWMatch = [regex]::Match($content, '(?m)^\s*SV_Target\.w\s*=\s*[^;]+;')
        if ($targetWMatch.Success) {
            if ($isHdr) {
                $finalizeBlock = $newline + $newline +
                    "  // RenoDX: >>> [Patch: FinalizePostProcessHDR] [Version: 1.10]$newline" +
                    "  SV_Target.xyz = FinalizeHDR(SV_Target.xyz, _sunDirection.y, _moonDirection.y);$newline" +
                    "  // RenoDX: <<< [Patch: FinalizePostProcessHDR]"
            } else {
                $finalizeBlock = $newline + $newline +
                    "  // RenoDX: >>> [Patch: FinalizePostProcessSDR] [Version: 1.10]$newline" +
                    "  SV_Target.xyz = FinalizeSDR(SV_Target.xyz, _sunDirection.y, _moonDirection.y);$newline" +
                    "  // RenoDX: <<< [Patch: FinalizePostProcessSDR]"
            }
            $insertAt = $targetWMatch.Index + $targetWMatch.Length
            $content = $content.Substring(0, $insertAt) + $finalizeBlock + $content.Substring($insertAt)
        } else {
            $missing = $true
        }
    }

    if ($missing) {
        $missingPattern.Add($file.Name)
    }

    if ($content -ne $originalContent) {
        if (-not $WhatIf) {
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
        }
        $updatedFiles.Add($file.Name)
    }
}

Write-Output "TOTAL_FILES=$($files.Count)"
Write-Output "UPDATED_FILES=$($updatedFiles.Count)"

if ($missingPattern.Count -gt 0) {
    Write-Output "MISSING_PATTERN=$($missingPattern.Count)"
    $missingPattern | ForEach-Object { Write-Output ("  " + $_) }
}
