# ```powershell
<#
.SYNOPSIS
    This script deletes all files inside the specified folder.

.DESCRIPTION
    - The script targets the folder: C:\Vicky\tools\test\
    - It will remove all files within this directory but not the directory itself or any subdirectories.
    - If the folder does not exist, it will inform the user.
    - If there are no files to delete, it will also inform the user.
#>

# Define the path to the folder
$folderPath = "C:\Vicky\tools\test"

# Check if the folder exists
if (Test-Path -Path $folderPath) {
    # Get all files in the folder
    $files = Get-ChildItem -Path $folderPath -File

    # Check if there are any files to delete
    if ($files.Count -gt 0) {
        # Delete each file
        foreach ($file in $files) {
            Remove-Item -Path $file.FullName -Force
        }
        Write-Output "All files in $folderPath have been deleted."
    } else {
        Write-Output "No files found in $folderPath to delete."
    }
} else {
    Write-Output "The folder $folderPath does not exist."
}
# ```