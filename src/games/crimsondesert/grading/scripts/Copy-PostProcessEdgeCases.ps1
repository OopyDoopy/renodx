[CmdletBinding()]
param(
    [string]$SourceFolder = 'G:\Games\Steam\steamapps\common\Crimson Desert\bin64\renodx-dev\dump',
    [string]$GradingFolder = 'G:\Projects\source\repos\renodx\src\games\crimsondesert\grading',
    [string]$EdgeCasesFolder = 'G:\Projects\source\repos\renodx\src\games\crimsondesert\grading\tonemap-sdr',
    [string]$Needle = '_localToneMappingParams.w > 0.0f',
    [string[]]$RequiredNeedles = @('_exposure0.x', '_slopeParams.x', '_offsetParams.x', '_powerParams.x'),
    [string]$Prefix = 'PostProcessMaterial_'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $SourceFolder)) {
    throw "Source folder not found: $SourceFolder"
}

if (-not (Test-Path -LiteralPath $GradingFolder)) {
    throw "Grading folder not found: $GradingFolder"
}

New-Item -ItemType Directory -Path $EdgeCasesFolder -Force | Out-Null

$candidateFiles = @(Get-ChildItem -Path $SourceFolder -File -Filter '*.hlsl' |
    Where-Object {
        $hasPrimaryNeedle = Select-String -LiteralPath $_.FullName -SimpleMatch -Pattern $Needle -Quiet
        if (-not $hasPrimaryNeedle) {
            return $false
        }

        foreach ($requiredNeedle in $RequiredNeedles) {
            if ([string]::IsNullOrWhiteSpace($requiredNeedle)) {
                continue
            }

            if (-not (Select-String -LiteralPath $_.FullName -SimpleMatch -Pattern $requiredNeedle -Quiet)) {
                return $false
            }
        }

        return $true
    })

$existingNames = @(Get-ChildItem -Path $GradingFolder -File -Recurse |
    Select-Object -ExpandProperty Name)

$copied = New-Object System.Collections.Generic.List[object]
$skipped = New-Object System.Collections.Generic.List[object]
$brokenDecomps = New-Object System.Collections.Generic.List[object]

function Get-BrokenNumericTemps {
    param(
        [Parameter(Mandatory)] [string]$Content
    )

    $contentWithoutComments = [regex]::Replace($Content, '(?s)/\*.*?\*/', '')
    $contentWithoutComments = [regex]::Replace($contentWithoutComments, '(?m)//.*$', '')

    $declarationPattern = '\b(?:precise\s+)?(?:static\s+)?(?:const\s+)?(?:min16float|float|half|int|uint|bool)(?:[1-4](?:x[1-4])?)?\s+(_\d+)\b'
    $numericTempPattern = '(?<![A-Za-z0-9_])_\d+(?![A-Za-z0-9_])'

    $allDeclaredTemps = New-Object System.Collections.Generic.HashSet[string]
    foreach ($match in [regex]::Matches($contentWithoutComments, $declarationPattern)) {
        [void]$allDeclaredTemps.Add($match.Groups[1].Value)
    }

    $seenDeclaredTemps = New-Object System.Collections.Generic.HashSet[string]
    $brokenTemps = New-Object System.Collections.Generic.HashSet[string]
    foreach ($line in ($contentWithoutComments -split "`r?`n")) {
        $declaredOnLine = New-Object System.Collections.Generic.HashSet[string]
        foreach ($match in [regex]::Matches($line, $declarationPattern)) {
            [void]$declaredOnLine.Add($match.Groups[1].Value)
        }

        foreach ($match in [regex]::Matches($line, $numericTempPattern)) {
            $temp = $match.Value
            if ($declaredOnLine.Contains($temp)) {
                continue
            }

            if ((-not $allDeclaredTemps.Contains($temp)) -or (-not $seenDeclaredTemps.Contains($temp))) {
                [void]$brokenTemps.Add($temp)
            }
        }

        foreach ($temp in $declaredOnLine) {
            [void]$seenDeclaredTemps.Add($temp)
        }
    }

    return @($brokenTemps | Sort-Object)
}

foreach ($file in $candidateFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $hash = ($baseName -split '\.')[0]

    if ([string]::IsNullOrWhiteSpace($hash)) {
        continue
    }

    $sourceContent = [System.IO.File]::ReadAllText($file.FullName)
    $brokenTemps = @(Get-BrokenNumericTemps -Content $sourceContent)
    if ($brokenTemps.Count -gt 0) {
        $brokenDecomps.Add([pscustomobject]@{
            Hash             = $hash
            File             = $file.Name
            BrokenTemps      = ($brokenTemps -join ',')
        })
        continue
    }

    $duplicate = $existingNames |
        Where-Object { $_ -match [regex]::Escape($hash) } |
        Select-Object -First 1

    if ($null -ne $duplicate) {
        $skipped.Add([pscustomobject]@{
            Hash      = $hash
            File      = $file.Name
            Duplicate = $duplicate
        })
        continue
    }

    $destinationName = "$Prefix$($file.Name)"
    $destinationPath = Join-Path $EdgeCasesFolder $destinationName

    Copy-Item -LiteralPath $file.FullName -Destination $destinationPath -Force

    $copied.Add([pscustomobject]@{
        Hash   = $hash
        Source = $file.Name
        Dest   = $destinationName
    })
}

Write-Output "MATCHED=$($candidateFiles.Count)"
Write-Output "COPIED=$($copied.Count)"
Write-Output "SKIPPED=$($skipped.Count)"
Write-Output "BROKEN_DECOMPS=$($brokenDecomps.Count)"

if ($copied.Count -gt 0) {
    Write-Output 'COPIED_FILES:'
    $copied | ForEach-Object { Write-Output ("  " + $_.Dest) }
}

if ($skipped.Count -gt 0) {
    Write-Output 'SKIPPED_HASHES:'
    $skipped | ForEach-Object {
        Write-Output ("  " + $_.Hash + " (" + $_.File + ") duplicate: " + $_.Duplicate)
    }
}

if ($brokenDecomps.Count -gt 0) {
    Write-Output 'BROKEN_DECOMPS:'
    $brokenDecomps | ForEach-Object {
        Write-Output ("  " + $_.Hash + " (" + $_.File + ") broken numeric temps: " + $_.BrokenTemps)
    }
}
