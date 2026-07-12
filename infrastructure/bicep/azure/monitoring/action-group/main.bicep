param actionGroupName string = 'ag-portfolio'
param shortName string = 'ag'
param location string = 'global'

resource resourceModule 'Microsoft.Insights/actionGroups@2022-06-15' = {
  name: actionGroupName
  location: location
}

output actionGroupId string = resourceModule.id
