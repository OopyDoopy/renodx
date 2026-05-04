[CmdletBinding()]
param(
    [string]$Folder = '',
    [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Folder)) {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $Folder = Join-Path $scriptDir '..\postprocessedgecases'
}

if (-not (Test-Path -LiteralPath $Folder)) {
    throw "Folder not found: $Folder"
}

$folderPath = (Resolve-Path -LiteralPath $Folder).Path
$files = @(Get-ChildItem -LiteralPath $folderPath -File -Filter '*.hlsl')
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$updatedFiles = New-Object System.Collections.Generic.List[string]
$missingCBufferPattern = New-Object System.Collections.Generic.List[string]
$missingTonemapPattern = New-Object System.Collections.Generic.List[string]

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $originalContent = $content

    $newline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }

    if ($content -notmatch '(?m)^#include\s+"\.\./tonemap\.hlsli"$') {
        $content = '#include "../tonemap.hlsli"' + $newline + $newline + $content
    }

    if ($content -notmatch '#if 0 // Provided by tonemap\.hlsli') {
        $cbufferPattern = '(?s)cbuffer __3__35__0__0__ExposureConstantBuffer : register\(b29, space35\) \{.*?\};\s*cbuffer __3__1__0__0__GlobalPushConstants : register\(b0, space1\) \{.*?\};'
        if ([regex]::IsMatch($content, $cbufferPattern)) {
            $content = [regex]::Replace(
                $content,
                $cbufferPattern,
                {
                    param($m)
                    "#if 0 // Provided by tonemap.hlsli$newline$($m.Value)$newline#endif"
                },
                1
            )
        } else {
            $missingCBufferPattern.Add($file.Name)
        }
    }

    $needle = 'if (_localToneMappingParams.w > 0.0f) {'
    $start = $content.LastIndexOf($needle, [System.StringComparison]::Ordinal)

    if ($start -ge 0) {
        $bodyStart = $start + $needle.Length
        $depth = 1
        $index = $bodyStart

        while ($index -lt $content.Length -and $depth -gt 0) {
            $char = $content[$index]
            if ($char -eq '{') {
                $depth++
            } elseif ($char -eq '}') {
                $depth--
            }
            $index++
        }

        if ($depth -eq 0) {
            $ifBodyEnd = $index - 1

            $cursor = $index
            while ($cursor -lt $content.Length -and [char]::IsWhiteSpace($content[$cursor])) {
                $cursor++
            }

            if ($cursor + 3 -le $content.Length -and $content.Substring($cursor, 4) -eq 'else') {
                $cursor += 4

                while ($cursor -lt $content.Length -and [char]::IsWhiteSpace($content[$cursor])) {
                    $cursor++
                }

                if ($cursor -lt $content.Length -and $content[$cursor] -eq '{') {
                    $elseBodyStart = $cursor + 1
                    $elseDepth = 1
                    $cursor = $elseBodyStart

                    while ($cursor -lt $content.Length -and $elseDepth -gt 0) {
                        $elseChar = $content[$cursor]
                        if ($elseChar -eq '{') {
                            $elseDepth++
                        } elseif ($elseChar -eq '}') {
                            $elseDepth--
                        }
                        $cursor++
                    }

                    if ($elseDepth -eq 0) {
                        $elseBodyEnd = $cursor - 1
                        $elseBody = $content.Substring($elseBodyStart, $elseBodyEnd - $elseBodyStart)

                        $pairs = New-Object System.Collections.Generic.List[object]
                        $elseLines = $elseBody -split '\r?\n'
                        $elseDepth = 0
                        foreach ($line in $elseLines) {
                            if ($elseDepth -eq 0) {
                                $m = [regex]::Match($line, '^\s*(_\d+)\s*=\s*(.+?)\s*;\s*$')
                                if ($m.Success) {
                                    $pairs.Add([pscustomobject]@{ Out = $m.Groups[1].Value; In = $m.Groups[2].Value })
                                }
                            }
                            $elseDepth += ([regex]::Matches($line, '\{')).Count - ([regex]::Matches($line, '\}')).Count
                        }

                        # Fallback: if top-level else mapping is not recoverable, infer RGB inputs from
                        # the three tonemap shaping lines (slope/offset/power), e.g. _190/_191/_192.
                        if ($pairs.Count -lt 3) {
                            $ifBody = $content.Substring($bodyStart, $ifBodyEnd - $bodyStart)
                            $ifLines = $ifBody -split '\r?\n'

                            $assignedNames = New-Object System.Collections.Generic.HashSet[string]
                            foreach ($line in $ifLines) {
                                $assignMatch = [regex]::Match($line, '^\s*(_\d+)\s*=')
                                if ($assignMatch.Success) {
                                    [void]$assignedNames.Add($assignMatch.Groups[1].Value)
                                }
                            }

                            $tonemapExprVars = New-Object System.Collections.Generic.List[object]
                            foreach ($line in $ifLines) {
                                $toneMatch = [regex]::Match($line, '^\s*(_\d+)\s*=\s*(.+?)\s*;\s*$')
                                if (-not $toneMatch.Success) {
                                    continue
                                }

                                $rhs = $toneMatch.Groups[2].Value
                                if ($rhs -notmatch '_slopeParams\.[xyz]' -or $rhs -notmatch '_offsetParams\.[xyz]' -or $rhs -notmatch '_powerParams\.[xyz]') {
                                    continue
                                }

                                $vars = New-Object System.Collections.Generic.List[string]
                                foreach ($vm in [regex]::Matches($rhs, '_\d+')) {
                                    $v = $vm.Value
                                    if (-not $assignedNames.Contains($v) -and -not $vars.Contains($v)) {
                                        $vars.Add($v)
                                    }
                                }

                                if ($vars.Count -gt 0) {
                                    $tonemapExprVars.Add($vars)
                                }
                            }

                            if ($tonemapExprVars.Count -ge 3) {
                                $common = New-Object System.Collections.Generic.List[string]
                                foreach ($v in $tonemapExprVars[0]) {
                                    $inAll = $true
                                    for ($ix = 1; $ix -lt $tonemapExprVars.Count; $ix++) {
                                        if (-not $tonemapExprVars[$ix].Contains($v)) {
                                            $inAll = $false
                                            break
                                        }
                                    }

                                    if ($inAll -and -not $common.Contains($v)) {
                                        $common.Add($v)
                                    }
                                }

                                if ($common.Count -ge 3 -and $pairs.Count -ge 3) {
                                    # Keep else-derived output wiring, replace only inferred input vars.
                                    $pairs[0].In = $common[0]
                                    $pairs[1].In = $common[1]
                                    $pairs[2].In = $common[2]
                                }
                            }
                        }

                        if ($pairs.Count -ge 3) {
                            # Normalize inputs: strip outer scalar multiply/divide to get raw variable.
                            # e.g. (_106 * 0.015625f) -> _106
                            $scalarMulPat = [regex]'^[\(\s]*(_\d+)\s*[*/]\s*[\d.]+f?[\)\s]*$'
                            $normalizeIn = {
                                param($expr)
                                $nm = $scalarMulPat.Match($expr.Trim())
                                if ($nm.Success) { $nm.Groups[1].Value } else { $expr }
                            }

                            $out1 = $pairs[0].Out
                            $in1 = & $normalizeIn $pairs[0].In
                            $out2 = $pairs[1].Out
                            $in2 = & $normalizeIn $pairs[1].In
                            $out3 = $pairs[2].Out
                            $in3 = & $normalizeIn $pairs[2].In

                            $ifLineStart = $content.LastIndexOf($newline, $start)
                            if ($ifLineStart -lt 0) {
                                $ifLineStart = 0
                            } else {
                                $ifLineStart += $newline.Length
                            }
                            $ifIndentLength = $start - $ifLineStart
                            $ifIndent = if ($ifIndentLength -gt 0) { $content.Substring($ifLineStart, $ifIndentLength) } else { '' }
                            $innerIndent = $ifIndent + '  '

                            $newIfBody =
                                "$newline$innerIndent" + "float3 output_color = TonemapReplacer(float3($in1, $in2, $in3));$newline" +
                                "$innerIndent$out1 = output_color.x;$newline" +
                                "$innerIndent$out2 = output_color.y;$newline" +
                                "$innerIndent$out3 = output_color.z;$newline" +
                                "$ifIndent"

                            $content = $content.Substring(0, $bodyStart) + $newIfBody + $content.Substring($ifBodyEnd)
                        } else {
                            $missingTonemapPattern.Add($file.Name)
                        }
                    } else {
                        $missingTonemapPattern.Add($file.Name)
                    }
                } else {
                    $missingTonemapPattern.Add($file.Name)
                }
            } else {
                $missingTonemapPattern.Add($file.Name)
            }
        } else {
            $missingTonemapPattern.Add($file.Name)
        }
    } else {
        $missingTonemapPattern.Add($file.Name)
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

if ($missingCBufferPattern.Count -gt 0) {
    Write-Output "MISSING_CBUFFER_PATTERN=$($missingCBufferPattern.Count)"
    $missingCBufferPattern | ForEach-Object { Write-Output ("  " + $_) }
}

if ($missingTonemapPattern.Count -gt 0) {
    Write-Output "MISSING_TONEMAP_PATTERN=$($missingTonemapPattern.Count)"
    $missingTonemapPattern | ForEach-Object { Write-Output ("  " + $_) }
}
