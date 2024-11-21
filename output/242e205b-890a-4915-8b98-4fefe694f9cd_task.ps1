# ```powershell
<#
    This script will:
    - Target the folder C:\Vicky\tools\test\
    - Delete all files within this folder
    - Not delete subfolders or their contents
    - Provide feedback on the operation's progress
#>

# Set the target directory path
$targetDir = "C:\Vicky\tools\test\"

# Check if the directory exists
if (Test-Path -Path $targetDir) {
    # Get all files in the directory
    $files = Get-ChildItem -Path $targetDir -File

    # Loop through each file and delete it
    foreach ($file in $files) {
        Remove-Item -Path $file.FullName -Force
        Write-Host "Deleted file: $($file.Name)"
    }

    # Check if any files were deleted
    if ($files.Count -eq 0) {
        Write-Host "No files found in the directory to delete."
    } else {
        Write-Host "All files in the directory have been deleted."
    }
} else {
    Write-Host "The specified directory does not exist."
}
# ```