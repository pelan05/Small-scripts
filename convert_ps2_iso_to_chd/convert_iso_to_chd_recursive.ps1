# --------------------------

# Folder to start searching (current folder)
$rootFolder = Get-Location

# Path to chdman executable (in the same folder as script / root folder)
$chdman = Join-Path $rootFolder "chdman.exe"

# --------------------------

# Recursively find all ISO files
$isoFiles = Get-ChildItem -Path $rootFolder -Recurse -Filter "*.iso"

foreach ($iso in $isoFiles) {
    $isoPath = $iso.FullName
    $chdPath = [System.IO.Path]::ChangeExtension($isoPath, ".chd")

    Write-Host "Converting: $isoPath → $chdPath"

    # Run chdman and wait for it to finish
    & $chdman createcd -i "$isoPath" -o "$chdPath"

    # Check if CHD was created successfully
    if (Test-Path $chdPath) {
        Write-Host "Conversion complete. Deleting ISO: $isoPath"
        Remove-Item $isoPath
    } else {
        Write-Host "ERROR: CHD not created for $isoPath"
    }
}

Write-Host "All ISOs processed."
