// Microsoft Fabric is commonly automated using Fabric REST APIs and deployment pipelines.
// This placeholder keeps the module structure aligned with DevOps automation.
// See scripts/ for REST/PowerShell examples.

targetScope = 'resourceGroup'

param workspaceName string

output note string = 'Use Fabric REST API or deployment pipelines to automate workspace actions for: ${workspaceName}.'
