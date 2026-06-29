param(
    [string]$WorkspaceId,
    [string]$PipelineId
)

Write-Host "Trigger Fabric Git sync and deployment pipeline."
Write-Host "WorkspaceId: $WorkspaceId"
Write-Host "PipelineId: $PipelineId"
