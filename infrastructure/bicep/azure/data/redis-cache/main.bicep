param redisName string = 'redis-portfolio'
param location string = 'eastus'
param skuName string = 'Standard'

resource resourceModule 'Microsoft.Cache/Redis@2023-03-01' = {
  name: redisName
  location: location
}

output redisId string = resourceModule.id
