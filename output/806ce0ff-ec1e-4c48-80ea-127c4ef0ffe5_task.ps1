# ```powershell
<#
    This script will:
    - Target the folder C:\Vicky\tools\test\
    - Delete all files within this folder
    - Leave subfolders and their contents intact
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