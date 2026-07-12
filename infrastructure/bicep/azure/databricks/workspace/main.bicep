param workspaceName string = 'databricks-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Databricks/workspaces@2023-04-01' = {
  name: workspaceName
  location: location
}

output workspaceId string = resourceModule.id
