# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the specified folder.
    - The folder path is "C:\Vicky\tools\test\".
#>

# Delete all files in the specified directory
Remove-Item -Path "C:\Vicky\tools\test*" -Force
# ```