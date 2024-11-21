# ```powershell
# This script will:
# - Create a new folder at "C:\Vicky\tools\test\" if it doesn't exist
# - Generate 5 random text files inside this folder
# - Each file will contain random content

# Create the directory if it doesn't exist
if (-not (Test-Path "C:\Vicky\tools\test\")) {
    New-Item -ItemType Directory -Path "C:\Vicky\tools\test\" | Out-Null
}

# Function to generate random string
function Get-RandomString {
    param([int]$length = 10)
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    $randomString = -join ($characters.ToCharArray() | Get-Random -Count $length)
    return $randomString
}

# Generate 5 random files
for ($i = 1; $i -le 5; $i++) {
    $fileName = "file_" + (Get-RandomString -length 5) + ".txt"
    $filePath = "C:\Vicky\tools\test\" + $fileName
    $randomContent = Get-RandomString -length 100
    $randomContent | Out-File -FilePath $filePath
}
# ```