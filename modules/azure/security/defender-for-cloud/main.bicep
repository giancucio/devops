targetScope = 'subscription'

param pricingTier string = 'Standard'

resource virtualMachinesPlan 'Microsoft.Security/pricings@2023-01-01' = {
  name: 'VirtualMachines'
  properties: {
    pricingTier: pricingTier
  }
}

resource containersPlan 'Microsoft.Security/pricings@2023-01-01' = {
  name: 'Containers'
  properties: {
    pricingTier: pricingTier
  }
}

output virtualMachinesPlanId string = virtualMachinesPlan.id
output containersPlanId string = containersPlan.id
