# ```powershell
<#
.SYNOPSIS
    This script will:
    - Create 5 random files in the specified directory.
    - Use random names and content for these files.
    - Ensure the files are created in the "C:\Vicky\tools\test\" folder.
#>

# Define the target directory
$targetDir = "C:\Vicky\tools\test\"

# Ensure the directory exists
if (-not (Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir
}

# Function to generate a random string
function Get-RandomString {
    param([int]$length = 10)
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    $randomString = -join ($characters.ToCharArray() | Get-Random -Count $length)
    return $randomString
}

# Loop to create 5 random files
for ($i = 1; $i -le 5; $i++) {
    $fileName = Get-RandomString
    $filePath = Join-Path -Path $targetDir -ChildPath "$fileName.txt"
    $randomContent = Get-RandomString -length 50
    $randomContent | Out-File -FilePath $filePath
}
# ```