# ```powershell
<#
.SYNOPSIS
    This script deletes all files within the specified directory.

.DESCRIPTION
    - Targets the directory "C:\Vicky\tools\test\".
    - Removes all files inside this directory.
    - Does not delete subdirectories or their contents.
#>

# Set the target directory path
$directoryPath = "C:\Vicky\tools\test\"

# Get all files in the directory
$files = Get-ChildItem -Path $directoryPath -File

# Loop through each file and delete it
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
}
# ```