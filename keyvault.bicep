@description('Specifies the location for resources.')
param location string = 'westus'
param SPapplicationId string = '910766b3-8209-417a-8ecb-fd29ec2db0a7'
param SPobjectId string = 'a7df3aa9-e97d-466c-9135-73eafb3a1ae2'
param tenantId string = 'de4be5fa-3db1-434c-8868-cb3a511dc5d0'

resource mylittletrackervault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: 'mylittletracker-vault'
  location: location
  tags: {
    tagName1: 'prod'
  }
  properties: {
    accessPolicies: [
      {
        applicationId: SPapplicationId
        objectId: SPobjectId
        permissions: {
          secrets: [
            'get','list'
          ]
        }
        tenantId: tenantId
      }
    ]
    sku: {
      family: 'A'
      name: 'standard'
    tenantId: tenantId
  }
}
