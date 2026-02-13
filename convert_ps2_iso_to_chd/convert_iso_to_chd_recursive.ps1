# --------------------------

# Folder to start searching (current folder)
$rootFolder = Get-Location

# Path to chdman executable (in the same folder as script / root folder)
$chdman = Join-Path $rootFolder "chdman.exe"

# --- Step 1: Convert all ISOs ---
Write-Host "=== Converting ISOs ==="
$isoFiles = Get-ChildItem -Path $rootFolder -Recurse -Filter "*.iso"

foreach ($iso in $isoFiles) {
    $isoPath = $iso.FullName
    $chdPath = [System.IO.Path]::ChangeExtension($isoPath, ".chd")

    Write-Host "`nConverting ISO: $isoPath → $chdPath"
    & $chdman createcd -i "$isoPath" -o "$chdPath"

    if (Test-Path $chdPath) {
        Write-Host "Conversion complete. Deleting ISO: $isoPath"
        Remove-Item $isoPath
    } else {
        Write-Host "ERROR: CHD not created for $isoPath. Skipping deletion."
    }
}

# --- Step 2: Convert all CUE folders (PS1) ---
Write-Host "`n=== Converting CUE + BIN folders ==="
$cueFiles = Get-ChildItem -Path $rootFolder -Recurse -Filter "*.cue"

foreach ($cue in $cueFiles) {
    $cuePath = $cue.FullName
    $chdPath = [System.IO.Path]::ChangeExtension($cuePath, ".chd")
    $folderPath = $cue.DirectoryName

    Write-Host "`nConverting CUE: $cuePath → $chdPath"
    & $chdman createcd -i "$cuePath" -o "$chdPath"

    if (Test-Path $chdPath) {
        Write-Host "Conversion complete. Deleting CUE + BIN in folder: $folderPath"
        Get-ChildItem -Path $folderPath -Include *.cue,*.bin | Remove-Item
    } else {
        Write-Host "ERROR: CHD not created for $cuePath. Skipping deletion."
    }
}

Write-Host "`n=== All disc-based games processed ==="
