# ```powershell
<#
.SYNOPSIS
    This script deletes a specific file at a given path.

.DESCRIPTION
    - Checks if the file exists at the specified path.
    - If the file exists, it deletes the file.
    - If the file does not exist, it informs the user.
#>

$filePath = "C:\Vicky\tools\test\hello.txt"

if (Test-Path $filePath) {
    Remove-Item $filePath -Force
    Write-Host "The file $filePath has been deleted."
} else {
    Write-Host "The file $filePath does not exist."
}
# ```