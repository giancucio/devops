targetScope = 'subscription'

param assignmentName string
param policyDefinitionId string
param location string = 'japaneast'
param parameters object = {}

resource assignment 'Microsoft.Authorization/policyAssignments@2022-06-01' = {
  name: assignmentName
  location: location
  properties: {
    policyDefinitionId: policyDefinitionId
    parameters: parameters
  }
}

output assignmentId string = assignment.id
