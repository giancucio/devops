param identityName string = 'identity-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: identityName
  location: location
}

output identityId string = resourceModule.id
