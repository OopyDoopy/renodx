[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string]$SourceFolder,

    [string]$DestinationFolder = (Join-Path $PSScriptRoot '..'),

    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$tonemapNeedle = '0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f'
$directExposurePattern = '^\s*float\s+_\d+\s*=\s*min\(dp3_f32\(float3\(' + [regex]::Escape($tonemapNeedle) + '\),\s*(_\d+)\)\s*\*\s*2\.5f,\s*65504\.0f\);'
$splitExposurePattern = '(?m)^\s*float\s+_\d+\s*=\s*min\(\s*(_\d+)\s*\*\s*2\.5f,\s*65504\.0f\);\r?\n\s*float\s+_\d+\s*=\s*min\(\s*(_\d+)\s*\*\s*2\.5f,\s*65504\.0f\);\r?\n\s*float\s+_\d+\s*=\s*min\(\s*(_\d+)\s*\*\s*2\.5f,\s*65504\.0f\);'
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Get-EnclosingIfConditions {
    param(
        [Parameter(Mandatory)]
        [string]$Content,

        [Parameter(Mandatory)]
        [int]$Position
    )

    $stack = New-Object System.Collections.Generic.List[object]
    $pendingCondition = $null
    $lineStart = 0

    while ($lineStart -lt $Position) {
        $lineEnd = $Content.IndexOf("`n", $lineStart)
        if ($lineEnd -lt 0 -or $lineEnd -gt $Position) {
            $lineEnd = $Position
        }

        $line = $Content.Substring($lineStart, $lineEnd - $lineStart).TrimEnd("`r")
        $ifMatch = [regex]::Match($line, '^\s*if\s*\((.+)\)\s*(?:\{)?\s*$')
        if ($ifMatch.Success) {
            $pendingCondition = $ifMatch.Groups[1].Value
        } elseif ($line -notmatch '^\s*$' -and $line -notmatch '^\s*\{\s*$') {
            $pendingCondition = $null
        }

        foreach ($character in $line.ToCharArray()) {
            if ($character -eq '{') {
                $stack.Add($pendingCondition)
                $pendingCondition = $null
            } elseif ($character -eq '}' -and $stack.Count -gt 0) {
                $stack.RemoveAt($stack.Count - 1)
            }
        }

        $lineStart = $lineEnd + 1
    }

    return @($stack | Where-Object { $null -ne $_ })
}

function Get-SingleMatch {
    param(
        [Parameter(Mandatory)]
        [string]$Content,

        [Parameter(Mandatory)]
        [string]$Pattern,

        [Parameter(Mandatory)]
        [string]$Description,

        [Parameter(Mandatory)]
        [string]$FileName
    )

    $matches = [regex]::Matches($Content, $Pattern, [System.Text.RegularExpressions.RegexOptions]::Multiline)
    if ($matches.Count -ne 1) {
        throw "${FileName}: expected one $Description match, found $($matches.Count)."
    }

    return $matches[0]
}

if (-not (Test-Path -LiteralPath $SourceFolder -PathType Container)) {
    throw "Source folder not found: $SourceFolder"
}

if (-not (Test-Path -LiteralPath $DestinationFolder -PathType Container)) {
    New-Item -ItemType Directory -Path $DestinationFolder -Force | Out-Null
}

$sourcePath = (Resolve-Path -LiteralPath $SourceFolder).Path
$destinationPath = (Resolve-Path -LiteralPath $DestinationFolder).Path
$matchingFiles = @(Get-ChildItem -LiteralPath $sourcePath -File -Filter '*.cs_5_0.hlsl' |
    Where-Object {
        $shaderContent = [System.IO.File]::ReadAllText($_.FullName)
        $shaderContent.Contains($tonemapNeedle) -and
        ([regex]::IsMatch($shaderContent, $directExposurePattern, [System.Text.RegularExpressions.RegexOptions]::Multiline) -or
            [regex]::IsMatch($shaderContent, $splitExposurePattern))
    })
$candidateFiles = @($matchingFiles | Where-Object {
    Select-String -LiteralPath $_.FullName -Pattern 'float4\s+cb\d+_m\[4096\]' -Quiet
})
$unsupportedFiles = @($matchingFiles | Where-Object {
    -not (Select-String -LiteralPath $_.FullName -Pattern 'float4\s+cb\d+_m\[4096\]' -Quiet)
})

$created = New-Object System.Collections.Generic.List[string]
$updated = New-Object System.Collections.Generic.List[string]
$skipped = New-Object System.Collections.Generic.List[string]

foreach ($file in $candidateFiles) {
    $hashMatch = [regex]::Match($file.Name, '^0x([0-9A-Fa-f]{8})\.cs_5_0\.hlsl$')
    if (-not $hashMatch.Success) {
        throw "Unexpected shader filename: $($file.Name)"
    }

    $hash = $hashMatch.Groups[1].Value.ToUpperInvariant()
    $destinationName = "tonemap_0x$hash.cs_5_1.hlsl"
    $outputPath = Join-Path $destinationPath $destinationName

    if ((Test-Path -LiteralPath $outputPath) -and -not $Force) {
        $skipped.Add($destinationName)
        continue
    }

    $content = [System.IO.File]::ReadAllText($file.FullName)
    $newline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }

    $directSceneMatches = [regex]::Matches(
        $content,
        $directExposurePattern,
        [System.Text.RegularExpressions.RegexOptions]::Multiline
    )
    $splitSceneMatches = [regex]::Matches($content, $splitExposurePattern)
    if ($directSceneMatches.Count -eq 1 -and $splitSceneMatches.Count -eq 0) {
        $sceneMatch = $directSceneMatches[0]
        $sceneColor = $sceneMatch.Groups[1].Value
    } elseif ($directSceneMatches.Count -eq 0 -and $splitSceneMatches.Count -eq 1) {
        $sceneMatch = $splitSceneMatches[0]
        $sceneColor = "float3($($sceneMatch.Groups[1].Value), $($sceneMatch.Groups[2].Value), $($sceneMatch.Groups[3].Value))"
    } else {
        throw "$($file.Name): expected exactly one direct or split tonemap exposure block; found $($directSceneMatches.Count) direct and $($splitSceneMatches.Count) split."
    }

    $acesBufferMatch = Get-SingleMatch -Content $content `
        -Pattern '^\s*float4\s+(cb\d+_m)\[4096\]\s*:\s*packoffset\(c0\);' `
        -Description 'ACES parameter buffer' -FileName $file.Name
    $acesBuffer = $acesBufferMatch.Groups[1].Value

    $writeMatches = [regex]::Matches(
        $content,
        '^\s*(u\d+\[[^\r\n]+?\])\s*=\s*float4\(',
        [System.Text.RegularExpressions.RegexOptions]::Multiline
    )
    if ($writeMatches.Count -eq 0) {
        throw "$($file.Name): output UAV write not found."
    }
    $finalWrite = $writeMatches[$writeMatches.Count - 1]
    $outputLValue = $finalWrite.Groups[1].Value

    $insertionConditions = @(Get-EnclosingIfConditions -Content $content -Position $sceneMatch.Index)
    $writeConditions = @(Get-EnclosingIfConditions -Content $content -Position $finalWrite.Index)
    $guardConditions = @($writeConditions | Where-Object { $insertionConditions -notcontains $_ })

    $indentMatch = [regex]::Match($sceneMatch.Value, '^\s*')
    $indent = $indentMatch.Value
    $innerIndent = $indent
    $guardOpen = ''
    $guardClose = ''
    foreach ($condition in $guardConditions) {
        $guardOpen += "$innerIndent if ($condition) {$newline"
        $guardClose = "$innerIndent}$newline" + $guardClose
        $innerIndent += '    '
    }

    $blockLines = @(
        '#if 1',
        'helldivers2::tonemap::ACESParameters aces_parameters = {',
        '    {',
        '        0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f,',
        '        0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f,',
        '    },',
        '    1.f, 1.f, 1.f, 1.f, 1.f, 0.f, 0.f, 1.f, 100.f,',
        '};',
        '[unroll]',
        'for (uint i = 0u; i < 20u; i++) {',
        "    aces_parameters.coefficients[i] = $acesBuffer[i].x;",
        '}',
        "aces_parameters.low_input = $acesBuffer[19u].y;",
        "aces_parameters.low_output = $acesBuffer[19u].z;",
        "aces_parameters.middle_input = $acesBuffer[20u].x;",
        "aces_parameters.high_input = $acesBuffer[20u].z;",
        "aces_parameters.high_output = $acesBuffer[20u].w;",
        "aces_parameters.low_slope = $acesBuffer[21u].x;",
        "aces_parameters.high_slope = $acesBuffer[21u].y;",
        'aces_parameters.target_peak_nits = RENODX_PEAK_WHITE_NITS;',
        'aces_parameters.diffuse_white_nits = RENODX_DIFFUSE_WHITE_NITS;',
        '',
        'if (RENODX_TONE_MAP_TYPE != 0.f) {',
        $guardOpen.TrimEnd("`r", "`n"),
        "${innerIndent}float3 scene_color = $sceneColor;",
        "${innerIndent}float3 output_color = CustomTonemap(scene_color, aces_parameters);",
        "${innerIndent}$outputLValue = float4(output_color, 1.f);",
        $guardClose.TrimEnd("`r", "`n"),
        '    return;',
        '}',
        '#endif',
        ''
    )

    $block = ($blockLines | ForEach-Object {
        if ([string]::IsNullOrEmpty($_)) { '' } elseif ($_ -match '^\s') { $indent + $_ } else { $indent + $_ }
    }) -join $newline

    $content = $content.Insert($sceneMatch.Index, $block)
    $content = '#include "../common.hlsl"' + $newline + $newline + $content

    # bin2hlsl preserves Vulkan binding numbers in the HLSL register signature.
    # Rebase each resource to the register represented by its generated variable name.
    $content = [regex]::Replace(
        $content,
        '\b([stu]\d+)\s*:\s*register\([stu]\d+\)',
        { param($match) "$($match.Groups[1].Value) : register($($match.Groups[1].Value))" }
    )

    $action = if (Test-Path -LiteralPath $outputPath) { 'Update' } else { 'Create' }
    if ($PSCmdlet.ShouldProcess($outputPath, "$action ported tonemap permutation")) {
        [System.IO.File]::WriteAllText($outputPath, $content, $utf8NoBom)
        if ($action -eq 'Create') {
            $created.Add($destinationName)
        } else {
            $updated.Add($destinationName)
        }
    }
}

Write-Output "MATCHED=$($matchingFiles.Count)"
Write-Output "SUPPORTED=$($candidateFiles.Count)"
Write-Output "UNSUPPORTED_LUT=$($unsupportedFiles.Count)"
Write-Output "CREATED=$($created.Count)"
Write-Output "UPDATED=$($updated.Count)"
Write-Output "SKIPPED=$($skipped.Count)"
$unsupportedFiles | ForEach-Object { Write-Output "  UNSUPPORTED_LUT $($_.Name)" }
$created | ForEach-Object { Write-Output "  CREATED $_" }
$updated | ForEach-Object { Write-Output "  UPDATED $_" }
$skipped | ForEach-Object { Write-Output "  SKIPPED $_" }