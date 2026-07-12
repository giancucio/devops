param workspaceName string = 'databricks-portfolio'
param connectorName string = 'access-connector'
param location string = 'eastus'

resource resourceModule 'Microsoft.Databricks/workspaces/accessConnectors@2023-04-01' = {
  name: '${workspaceName}/${connectorName}'
  location: location
}

output connectorId string = resourceModule.id
