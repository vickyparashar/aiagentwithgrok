# ```powershell
<#
.SYNOPSIS
    This script will:
    - Add 2 to the content of each file in the specified directory.
    - Overwrite the original files with the modified content.
    - Handle potential errors like file access issues or invalid file content.
#>

# Define the directory path
$directoryPath = "C:\Vicky\tools\test"

# Get all files in the directory
$files = Get-ChildItem -Path $directoryPath -File

# Loop through each file
foreach ($file in $files) {
    try {
        # Read the content of the file
        $content = Get-Content -Path $file.FullName -Raw

        # Convert content to integer, add 2, and convert back to string
        $newContent = ([int]$content + 2).ToString()

        # Write the new content back to the file
        $newContent | Set-Content -Path $file.FullName
    }
    catch {
        Write-Error "An error occurred while processing file $($file.Name): $_"
    }
}
# ```