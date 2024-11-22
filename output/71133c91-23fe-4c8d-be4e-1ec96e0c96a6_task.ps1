# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the folder C:\Vicky\tools\test\
    - Not delete subfolders or their contents
#>

# Set the path to the folder
$folderPath = "C:\Vicky\tools\test\"

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath -File

# Loop through each file and delete it
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
}
# ```