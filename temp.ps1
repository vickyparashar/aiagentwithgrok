# ```powershell
<#
.SYNOPSIS
    This script will:
    - Delete all files inside the specified folder.
    - Log each action and any errors to a file.
    - Use error handling to manage exceptions.

.NOTES
    Log file: 2ce222e7-2c92-47e9-a71f-307ed17982fc_task.log
    Log directory: .\output\
#>

# Ensure the output directory exists
$logDir = ".\output\"
if (-not (Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

# Define log file path
$logFile = Join-Path -Path $logDir -ChildPath "2ce222e7-2c92-47e9-a71f-307ed17982fc_task.log"

# Function to log messages
function Write-Log {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $logFile -Append
}

# Target directory
$targetDir = "C:\Vicky\tools\test\"

try {
    # Check if the directory exists
    if (Test-Path -Path $targetDir) {
        Write-Log "Directory found: $targetDir"
        
        # Get all files in the directory
        $files = Get-ChildItem -Path $targetDir -File
        
        # Delete each file
        foreach ($file in $files) {
            try {
                Remove-Item -Path $file.FullName -Force
                Write-Log "Deleted file: $($file.FullName)"
            } catch {
                Write-Log "Failed to delete file: $($file.FullName). Error: $_"
            }
        }
        Write-Log "File deletion process completed."
    } else {
        Write-Log "Directory not found: $targetDir"
    }
} catch {
    Write-Log "An error occurred: $_"
}
# ```