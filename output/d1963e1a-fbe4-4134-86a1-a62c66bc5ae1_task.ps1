# ```powershell
<#
.SYNOPSIS
    This script will:
    - Add two files inside the folder C:\Vicky\tools\test\
    - The files added will be named 'file1.txt' and 'file2.txt'
    - Each file will contain a simple text message
#>

# Create the first file
"Hello from file1!" | Out-File -FilePath "C:\Vicky\tools\test\file1.txt"

# Create the second file
"Hello from file2!" | Out-File -FilePath "C:\Vicky\tools\test\file2.txt"
# ```