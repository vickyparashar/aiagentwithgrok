# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the specified folder.
    - Log all actions and errors to a file named '50da59c8-e419-43ab-9c41-a81f9db1a361_task.log' in the current directory.
#>

$logFile = ".\50da59c8-e419-43ab-9c41-a81f9db1a361_task.log"
$targetFolder = "C:\Vicky\tools\test"

try {
    # Ensure the log file exists
    if (-not (Test-Path $logFile)) {
        New-Item -Path $logFile -ItemType File | Out-Null
    }

    # Log start of operation
    "Starting file deletion in $targetFolder at $(Get-Date)" | Out-File -FilePath $logFile -Append

    # Get all files in the target folder
    $files = Get-ChildItem -Path $targetFolder -File

    foreach ($file in $files) {
        try {
            Remove-Item -Path $file.FullName -Force
            "Deleted file: $($file.FullName)" | Out-File -FilePath $logFile -Append
        }
        catch {
            "Failed to delete file: $($file.FullName). Error: $_" | Out-File -FilePath $logFile -Append
        }
    }

    # Log completion of operation
    "File deletion completed at $(Get-Date)" | Out-File -FilePath $logFile -Append
}
catch {
    "An error occurred: $_" | Out-File -FilePath $logFile -Append
}
# ```