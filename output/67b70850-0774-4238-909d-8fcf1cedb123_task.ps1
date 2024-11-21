# ```powershell
<#
.SYNOPSIS
    This script will:
    - Create 5 random text files in the specified directory.
    - Each file will contain random content.
#>

# Define the directory path
$directoryPath = "C:\Vicky\tools\test\"

# Ensure the directory exists
if (-not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath
}

# Function to generate random content
function Get-RandomContent {
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    $randomContent = -join ($chars | Get-Random -Count 100)
    return $randomContent
}

# Loop to create 5 random files
for ($i = 1; $i -le 5; $i++) {
    $fileName = "randomFile_" + (Get-Random -Minimum 1000 -Maximum 9999) + ".txt"
    $filePath = Join-Path -Path $directoryPath -ChildPath $fileName
    $randomContent = Get-RandomContent
    Set-Content -Path $filePath -Value $randomContent
}
# ```