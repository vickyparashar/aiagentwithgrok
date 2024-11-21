# ```powershell
# This script will:
# - Delete the file located at "C:\Vicky\tools\test\hello.txt"
# - Output a message indicating whether the deletion was successful or if an error occurred

Remove-Item -Path "C:\Vicky\tools\test\hello.txt" -Force -ErrorAction SilentlyContinue
if ($?) {
    Write-Output "File deleted successfully."
} else {
    Write-Output "Failed to delete the file. It might not exist or you might not have permission."
}
# ```