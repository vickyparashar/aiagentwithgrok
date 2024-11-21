# ```powershell
# This script will:
# - Delete all files inside the folder C:\Vicky\tools\test\
# - Not delete subfolders or their contents
# - Provide feedback on the number of files deleted

$directoryPath = "C:\Vicky\tools\test\"
$files = Get-ChildItem -Path $directoryPath -File

if ($files.Count -gt 0) {
    $files | Remove-Item -Force
    Write-Output "$($files.Count) files have been deleted from $directoryPath"
} else {
    Write-Output "No files found in $directoryPath"
}
# ```