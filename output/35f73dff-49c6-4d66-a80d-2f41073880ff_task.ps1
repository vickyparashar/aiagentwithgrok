# ```powershell
<#
.SYNOPSIS
    This script will:
    - Create 100 random files in the specified directory
    - Use random content for each file
    - Ensure the directory exists before creating files
#>

# Ensure the directory exists
$directory = "C:\Vicky\tools\test"
if (-not (Test-Path -Path $directory)) {
    New-Item -ItemType Directory -Path $directory
}

# Function to generate random content
function Get-RandomContent {
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    $randomContent = -join ($chars[(Get-Random -Minimum 0 -Maximum $chars.Length) % $chars.Length] * (Get-Random -Minimum 10 -Maximum 100))
    return $randomContent
}

# Create 100 random files
for ($i = 1; $i -le 100; $i++) {
    $fileName = "file_$i.txt"
    $filePath = Join-Path -Path $directory -ChildPath $fileName
    $randomContent = Get-RandomContent
    Set-Content -Path $filePath -Value $randomContent
}
# ```