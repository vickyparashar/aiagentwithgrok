# ```powershell
<#
This script will:
- Create 10 text files in the specified directory
- Each file will be named sequentially from file1.txt to file10.txt
- Each file will contain the text "This is file X" where X is the file number
#>

$directory = "C:\Vicky\tools\test\"

for ($i = 1; $i -le 10; $i++) {
    $fileName = "file$i.txt"
    $filePath = Join-Path -Path $directory -ChildPath $fileName
    "This is file $i" | Out-File -FilePath $filePath
}
# ```