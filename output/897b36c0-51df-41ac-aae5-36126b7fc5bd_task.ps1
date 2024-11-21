# ```powershell
<#
.SYNOPSIS
    This script will:
    - Create 10 random files in the specified directory.
    - Use random names and content for each file.
#>

# Set the directory path
$directoryPath = "C:\Vicky\tools\test\"

# Ensure the directory exists
if (-not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath
}

# Function to generate a random string
function Get-RandomString {
    param([int]$length = 10)
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    $randomString = -join ($characters.ToCharArray() | Get-Random -Count $length)
    return $randomString
}

# Loop to create 10 files
for ($i = 1; $i -le 10; $i++) {
    $fileName = Get-RandomString
    $filePath = Join-Path -Path $directoryPath -ChildPath "$fileName.txt"
    $randomContent = Get-RandomString -length 50
    Set-Content -Path $filePath -Value $randomContent
}
# ```