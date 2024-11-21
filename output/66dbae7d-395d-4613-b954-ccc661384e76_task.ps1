# ```powershell
<#
.SYNOPSIS
    This script will:
    - Create a new directory at C:\Vicky\tools\test if it doesn't exist
    - Navigate to that directory
    - Create a new .NET console application named 'MyApp'
    - Restore the NuGet packages for the project
#>

# Create the directory if it doesn't exist
if (-Not (Test-Path "C:\Vicky\tools\test")) {
    New-Item -ItemType Directory -Path "C:\Vicky\tools\test"
}

# Change to the specified directory
Set-Location "C:\Vicky\tools\test"

# Create a new .NET console application
dotnet new console -n MyApp

# Navigate into the newly created project directory
Set-Location ".\MyApp"

# Restore NuGet packages
dotnet restore
# ```