# ```powershell
<#
.SYNOPSIS
    This script deletes all files inside the specified folder.

.DESCRIPTION
    - The script targets the folder "C:\Vicky\tools\test\".
    - It removes all files within this directory but does not delete subfolders or their contents.
    - If the folder does not exist, it will inform the user.
#>

# Check if the folder exists
if (Test-Path -Path "C:\Vicky\tools\test\") {
    # Get all files in the directory
    $files = Get-ChildItem -Path "C:\Vicky\tools\test\" -File

    # Loop through each file and delete it
    foreach ($file in $files) {
        Remove-Item -Path $file.FullName -Force
    }

    Write-Output "All files in C:\Vicky\tools\test\ have been deleted."
} else {
    Write-Output "The folder C:\Vicky\tools\test\ does not exist."
}
# ```