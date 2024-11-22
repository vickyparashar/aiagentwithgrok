# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the folder C:\Vicky\tools\test\
    - Log all actions and errors to a file named 7775c663-5fe6-4e85-bbb4-00bc568287c6_task.log in the current directory/output/
#>

$logPath = ".\output\7775c663-5fe6-4e85-bbb4-00bc568287c6_task.log"
$targetFolder = "C:\Vicky\tools\test\"

try {
    # Ensure the log directory exists
    if (-not (Test-Path -Path ".\output")) {
        New-Item -ItemType Directory -Path ".\output" | Out-Null
    }

    # Start logging
    Start-Transcript -Path $logPath -Append -Force

    # Check if the target folder exists
    if (Test-Path -Path $targetFolder) {
        Write-Output "Deleting files in $targetFolder"
        Get-ChildItem -Path $targetFolder -File | Remove-Item -Force
        Write-Output "All files in $targetFolder have been deleted."
    } else {
        Write-Output "The folder $targetFolder does not exist."
    }
} catch {
    Write-Error "An error occurred: $_"
} finally {
    Stop-Transcript
}
# ```