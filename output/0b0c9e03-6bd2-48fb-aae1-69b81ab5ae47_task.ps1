# ```powershell
# This script will:
# - Delete all files in the directory C:\Vicky\tools\test\
# - Skip any subdirectories
# - Provide feedback on the number of files deleted

Remove-Item -Path "C:\Vicky\tools\test*" -Force -Recurse -Exclude *
$deletedFiles = Get-ChildItem -Path "C:\Vicky\tools\test" -File | Measure-Object
Write-Output "Deleted $($deletedFiles.Count) files."
# ```