# ```powershell
<#
    This script will:
    - Delete all files inside the folder "C:\Vicky\tools\test\"
    - Leave the folder structure intact
#>

# Get all files in the specified directory
$files = Get-ChildItem -Path "C:\Vicky\tools\test\" -File

# Loop through each file and delete it
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
}
# ```