# ```powershell
# This script will:
# - Delete all files inside the folder C:\Vicky\tools\test\
# - Not delete subfolders or their contents
# - Provide feedback on the operation's progress

$directoryPath = "C:\Vicky\tools\test\"

# Check if the directory exists
if (Test-Path -Path $directoryPath) {
    # Get all files in the directory
    $files = Get-ChildItem -Path $directoryPath -File

    # Loop through each file and delete it
    foreach ($file in $files) {
        Remove-Item -Path $file.FullName -Force
        Write-Host "Deleted file: $($file.Name)"
    }

    Write-Host "All files in $directoryPath have been deleted."
} else {
    Write-Host "The directory $directoryPath does not exist."
}
# ```