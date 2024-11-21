# ```powershell
<#
    This script will:
    - Target the folder C:\Vicky\tools\test\
    - Delete all files within this folder
    - Not delete subfolders or their contents
    - Output a message for each file deleted
#>

# Set the path to the target folder
$targetFolder = "C:\Vicky\tools\test\"

# Get all files in the target folder
$files = Get-ChildItem -Path $targetFolder -File

# Loop through each file and delete it
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
    Write-Output "Deleted file: $($file.Name)"
}
# ```