# ```powershell
<#
    This script will:
    - Delete all files inside the folder C:\Vicky\tools\test\
    - Not delete subfolders or their contents
    - Provide feedback on the number of files deleted
#>

$directoryPath = "C:\Vicky\tools\test\"
$files = Get-ChildItem -Path $directoryPath -File

$count = $files.Count
if ($count -gt 0) {
    $files | Remove-Item -Force
    Write-Output "$count files were deleted from $directoryPath"
} else {
    Write-Output "No files found in $directoryPath"
}
# ```