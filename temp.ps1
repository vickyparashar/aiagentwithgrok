# ```powershell
<#
    This script will:
    - Delete all files inside the folder C:\Vicky\tools\test\
    - Not delete subfolders or their contents
    - Provide feedback on the number of files deleted
#>

# Set the path to the folder
$folderPath = "C:\Vicky\tools\test\"

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath -File

# Count the number of files
$fileCount = $files.Count

# Delete each file
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
}

# Output the number of files deleted
Write-Output "Deleted $fileCount files from $folderPath"
# ```