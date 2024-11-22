# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the specified folder.
    - Log all actions and errors to a file named '8f670a1e-d167-463d-be42-d60463bf882a_task.log' in the current directory/output/.
    - Use try-catch blocks for error handling.
#>

$logPath = "$PSScriptRoot\output\8f670a1e-d167-463d-be42-d60463bf882a_task.log"
$targetFolder = "C:\Vicky\tools\test"

try {
    if (-not (Test-Path -Path $targetFolder)) {
        throw "The specified folder does not exist: $targetFolder"
    }

    $files = Get-ChildItem -Path $targetFolder -File
    foreach ($file in $files) {
        try {
            Remove-Item -Path $file.FullName -Force
            Add-Content -Path $logPath -Value "Deleted file: $($file.FullName)"
        } catch {
            Add-Content -Path $logPath -Value "Failed to delete file $($file.FullName): $_"
        }
    }
    Add-Content -Path $logPath -Value "Script completed successfully."
} catch {
    Add-Content -Path $logPath -Value "An error occurred: $_"
}
# ```