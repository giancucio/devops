param location string = 'eastus'
param lockName string = 'readOnlyLock'
param lockLevel string = 'CanNotDelete'
param notes string = 'Protect resource'

resource resourceModule 'Microsoft.Authorization/locks@2022-04-01' = {
  name: lockName
  location: location
}

output lockId string = resourceModule.id
