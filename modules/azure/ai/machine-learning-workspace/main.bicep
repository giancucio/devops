targetScope = 'resourceGroup'

param location string = resourceGroup().location
param workspaceName string
param storageAccountId string
param keyVaultId string
param applicationInsightsId string
param containerRegistryId string
param tags object = {}

resource workspace 'Microsoft.MachineLearningServices/workspaces@2023-10-01' = {
  name: workspaceName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    friendlyName: workspaceName
    storageAccount: storageAccountId
    keyVault: keyVaultId
    applicationInsights: applicationInsightsId
    containerRegistry: containerRegistryId
  }
}

output workspaceId string = workspace.id
