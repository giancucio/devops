param(
    [Parameter(Mandatory=$true)]
    [string]$WorkspaceName
)

Write-Host "Create Microsoft Fabric workspace using Fabric REST API."
Write-Host "Workspace: $WorkspaceName"
