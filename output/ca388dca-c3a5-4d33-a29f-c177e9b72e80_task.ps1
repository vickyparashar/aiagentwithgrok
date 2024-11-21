# ```powershell
<#
    This script will:
    - Target the folder C:\Vicky\tools\test\
    - Delete all files inside this folder
    - Leave the folder itself intact
#>

# Set the path to the target folder
$folderPath = "C:\Vicky\tools\test\"

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath -File

# Loop through each file and delete it
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
}
# ```