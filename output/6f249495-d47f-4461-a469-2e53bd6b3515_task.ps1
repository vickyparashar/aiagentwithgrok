# ```powershell
<#
This script will:
- Check if the specified folder exists
- If the folder exists, it will:
  - List all files in the folder
  - Delete each file in the folder
  - Output the number of files deleted
- If the folder does not exist, it will:
  - Output an error message
#>

$folderPath = "C:\Vicky\tools\test"

if (Test-Path -Path $folderPath) {
    $files = Get-ChildItem -Path $folderPath -File
    $count = 0
    foreach ($file in $files) {
        Remove-Item -Path $file.FullName -Force
        $count++
    }
    Write-Output "$count files deleted from $folderPath"
} else {
    Write-Output "The folder $folderPath does not exist."
}
# ```