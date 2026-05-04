[CmdletBinding()]
param(
    [string]$SourceFolder = 'G:\Games\Steam\steamapps\common\Crimson Desert\bin64\renodx-dev\dump',
    [string]$GradingFolder = 'G:\Projects\source\repos\renodx\src\games\crimsondesert\grading',
    [string]$EdgeCasesFolder = 'G:\Projects\source\repos\renodx\src\games\crimsondesert\grading\postprocessedgecases',
    [string]$Needle = '_localToneMappingParams.w > 0.0f',
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
    Where-Object { Select-String -Path $_.FullName -SimpleMatch -Pattern $Needle -Quiet })

$existingNames = @(Get-ChildItem -Path $GradingFolder -File -Recurse |
    Select-Object -ExpandProperty Name)

$copied = New-Object System.Collections.Generic.List[object]
$skipped = New-Object System.Collections.Generic.List[object]

foreach ($file in $candidateFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $hash = ($baseName -split '\.')[0]

    if ([string]::IsNullOrWhiteSpace($hash)) {
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
