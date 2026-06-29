targetScope = 'resourceGroup'

param lockName string = 'delete-lock'
param level string = 'CanNotDelete'
param notes string = 'Prevents accidental deletion.'

resource lockResource 'Microsoft.Authorization/locks@2016-09-01' = {
  name: lockName
  properties: {
    level: level
    notes: notes
  }
}

output lockId string = lockResource.id
