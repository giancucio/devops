targetScope = 'resourceGroup'

param location string = resourceGroup().location
param accessConnectorName string
param tags object = {}

resource connector 'Microsoft.Databricks/accessConnectors@2023-05-01' = {
  name: accessConnectorName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
}

output connectorId string = connector.id
output principalId string = connector.identity.principalId
