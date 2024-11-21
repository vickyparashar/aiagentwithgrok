# ```powershell
<#
    This script will:
    - Attempt to delete the directory "C:\Vicky\tools\test\" and all its contents.
    - If the directory does not exist, it will inform the user.
    - If there are errors during deletion, it will display those errors.
#>

$directoryPath = "C:\Vicky\tools\test\"

if (Test-Path $directoryPath) {
    try {
        Remove-Item -LiteralPath $directoryPath -Recurse -Force -ErrorAction Stop
        Write-Host "The directory $directoryPath has been successfully deleted."
    }
    catch {
        Write-Host "An error occurred while deleting the directory: $_"
    }
}
else {
    Write-Host "The directory $directoryPath does not exist."
}
# ```