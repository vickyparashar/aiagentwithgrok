# ```powershell
<#
    This script will:
    - Target the folder "C:\Vicky\tools\test\"
    - Delete all files within this folder
    - Not delete subfolders or their contents
    - Provide feedback on the operation's success or failure
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
    }

    Write-Output "All files in $targetDir have been deleted."
} else {
    Write-Output "The directory $targetDir does not exist."
}
# ```