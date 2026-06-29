param(
    [string]$WorkspaceId,
    [string]$OrganizationName,
    [string]$ProjectName,
    [string]$RepositoryName,
    [string]$BranchName = "main"
)

Write-Host "Connect Fabric workspace to Git."
Write-Host "WorkspaceId: $WorkspaceId"
