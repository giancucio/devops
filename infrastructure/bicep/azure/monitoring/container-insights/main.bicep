param workspaceName string = 'la-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
}

output workspaceId string = resourceModule.id
