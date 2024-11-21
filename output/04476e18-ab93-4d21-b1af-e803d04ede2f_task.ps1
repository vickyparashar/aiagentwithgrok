# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the specified folder
    - Leave subfolders and their contents intact
    - Provide feedback on the number of files deleted
#>

# Set the path to the folder
$folderPath = "C:\Vicky\tools\test\"

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath -File

# Count the number of files
$fileCount = $files.Count

# Delete the files
$files | Remove-Item -Force

# Output the number of files deleted
Write-Output "Deleted $fileCount files from $folderPath"
# ```