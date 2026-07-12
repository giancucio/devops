param workflowName string = 'logicapp-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Logic/workflows@2019-05-01' = {
  name: workflowName
  location: location
}

output workflowId string = resourceModule.id
