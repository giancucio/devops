param location string = 'eastus'
param assignmentName string = 'policyAssignment'
param policyDefinitionId string = '/subscriptions/.../providers/Microsoft.Authorization/policyDefinitions/...'
param scope string = '/subscriptions/<subscriptionId>'

resource resourceModule 'Microsoft.Authorization/policyAssignments@2022-01-01-preview' = {
  name: assignmentName
  location: location
}

output assignmentId string = resourceModule.id
