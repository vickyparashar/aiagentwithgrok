# ```powershell
<#
This script will:
- Add 2 to the content of each file in the specified directory.
- The directory path is "C:\Vicky\tools\test\".
- It will read each file, add 2 to the numeric content, and overwrite the file with the new value.
#>

$directoryPath = "C:\Vicky\tools\test\"

Get-ChildItem -Path $directoryPath -File | ForEach-Object {
    $content = Get-Content $_.FullName
    if ([double]::TryParse($content, [ref]$null)) {
        $newContent = [double]$content + 2
        Set-Content -Path $_.FullName -Value $newContent
    }
}
# ```