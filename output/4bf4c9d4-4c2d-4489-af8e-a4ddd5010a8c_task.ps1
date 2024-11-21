# ```powershell
<#
    This script will:
    - Create a directory at C:\Vicky\tools\test\ if it doesn't exist
    - Generate 10 random files within this directory
    - Each file will have a random name and contain random text content
#>

# Create the directory if it doesn't exist
if (-not (Test-Path "C:\Vicky\tools\test\")) {
    New-Item -ItemType Directory -Path "C:\Vicky\tools\test\" -Force
}

# Function to generate random string
function Get-RandomString {
    param([int]$length = 10)
    $set    = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.ToCharArray()
    $result = ''
    for ($x = 0; $x -lt $length; $x++) {
        $result += $set | Get-Random
    }
    return $result
}

# Generate 10 random files
1..10 | ForEach-Object {
    $fileName = Get-RandomString -length 8
    $filePath = "C:\Vicky\tools\test\$fileName.txt"
    $randomContent = Get-RandomString -length 50
    Set-Content -Path $filePath -Value $randomContent
}
# ```