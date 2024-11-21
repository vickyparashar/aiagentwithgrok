# ```powershell
<#
.SYNOPSIS
    This script checks if the current user has administrative rights.

.DESCRIPTION
    - Retrieves the current user's identity.
    - Checks if the user is part of the Administrators group.
    - Outputs whether the user has admin rights or not.
#>

# Get the current user's identity
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Create a WindowsPrincipal object for the current user
$principal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

# Check if the user is in the Administrators group
$isAdmin = $principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

# Output the result
if ($isAdmin) {
    Write-Output "The current user has administrative rights."
} else {
    Write-Output "The current user does not have administrative rights."
}
# ```