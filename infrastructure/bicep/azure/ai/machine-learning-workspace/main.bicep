param workspaceName string = 'mlws-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.MachineLearningServices/workspaces@2023-04-01' = {
  name: workspaceName
  location: location
}

output workspaceId string = resourceModule.id
