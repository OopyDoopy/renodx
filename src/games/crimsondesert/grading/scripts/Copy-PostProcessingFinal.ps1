[CmdletBinding()]
param(
    [string]$SourceFolder = 'G:\Games\Steam\steamapps\common\Crimson Desert\bin64\renodx-dev\dump',
    [string]$GradingFolder = 'G:\Projects\source\repos\renodx\src\games\crimsondesert\grading',
    [string]$Needle = '_localToneMappingParams.w > 0.0f',
    [string[]]$RequiredNeedles = @('__3__36__0__0__g_sceneColor', '_postProcessParams.w', '_etcParams.w', '_userImageAdjust', '_colorGradingParams.w'),
    [string[]]$ExcludeNeedles = @('_exposure0.x', 'BindlessParameters_PostProcessUber_CD')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $SourceFolder)) {
    throw "Source folder not found: $SourceFolder"
}

if (-not (Test-Path -LiteralPath $GradingFolder)) {
    throw "Grading folder not found: $GradingFolder"
}

$candidateFiles = @(Get-ChildItem -LiteralPath $SourceFolder -File -Filter '*.hlsl' |
    Where-Object {
        if (-not (Select-String -LiteralPath $_.FullName -SimpleMatch -Pattern $Needle -Quiet)) {
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

        foreach ($excludeNeedle in $ExcludeNeedles) {
            if ([string]::IsNullOrWhiteSpace($excludeNeedle)) {
                continue
            }

            if (Select-String -LiteralPath $_.FullName -SimpleMatch -Pattern $excludeNeedle -Quiet) {
                return $false
            }
        }

        return $true
    })

$existingNames = @(Get-ChildItem -LiteralPath $GradingFolder -File -Filter '*.hlsl' |
    Select-Object -ExpandProperty Name)

$copied = New-Object System.Collections.Generic.List[object]

foreach ($file in $candidateFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $hash = ($baseName -split '\.')[0]

    if ([string]::IsNullOrWhiteSpace($hash)) {
        continue
    }

    $hasDepth = Select-String -LiteralPath $file.FullName -SimpleMatch -Pattern '__3__36__0__0__g_depth' -Quiet
    $existingName = $existingNames |
        Where-Object { $_ -match [regex]::Escape($hash) } |
        Select-Object -First 1

    if ($null -ne $existingName) {
        $destinationName = $existingName
    } elseif ($hasDepth) {
        $destinationName = "postprocessing_final_$($file.Name)"
    } else {
        $destinationName = "postprocessing_final_fsr_$($file.Name)"
    }

    $destinationPath = Join-Path $GradingFolder $destinationName
    $existed = Test-Path -LiteralPath $destinationPath

    Copy-Item -LiteralPath $file.FullName -Destination $destinationPath -Force

    $copied.Add([pscustomobject]@{
        Hash    = $hash
        Source  = $file.Name
        Dest    = $destinationName
        Updated = $existed
    })
}

Write-Output "MATCHED=$($candidateFiles.Count)"
Write-Output "COPIED=$(@($copied | Where-Object { -not $_.Updated }).Count)"
Write-Output "UPDATED=$(@($copied | Where-Object { $_.Updated }).Count)"

if ($copied.Count -gt 0) {
    Write-Output 'COPIED_OR_UPDATED_FILES:'
    $copied | ForEach-Object {
        $action = if ($_.Updated) { 'updated' } else { 'copied' }
        Write-Output ("  " + $_.Dest + " (" + $action + ")")
    }
}
