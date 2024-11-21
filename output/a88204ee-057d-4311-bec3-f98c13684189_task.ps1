# ```powershell
<#
.SYNOPSIS
    This script deletes a specific file from a given path.

.DESCRIPTION
    The script will:
    - Check if the file exists at the specified path.
    - If the file exists, it will be deleted.
    - If the file does not exist, a message will be displayed indicating that the file was not found.
#>

# Define the path to the file
$filePath = "C:\Vicky\tools\test\hello1.txt"

# Check if the file exists
if (Test-Path $filePath) {
    # Delete the file
    Remove-Item $filePath -Force
    Write-Host "The file $filePath has been deleted."
} else {
    # Inform user that the file was not found
    Write-Host "The file $filePath does not exist."
}
# ```