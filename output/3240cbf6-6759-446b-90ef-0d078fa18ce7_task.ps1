# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the specified folder
    - Leave subfolders and their contents intact
    - Provide feedback on the number of files deleted
#>

# Define the path to the folder
$folderPath = "C:\Vicky\tools\test"

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath -File

# Count the number of files before deletion
$fileCount = $files.Count

# Delete each file
$files | ForEach-Object {
    Remove-Item -Path $_.FullName -Force
}

# Output the number of files deleted
Write-Output "Deleted $fileCount files from $folderPath"
# ```