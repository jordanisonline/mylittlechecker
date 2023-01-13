@description('Specifies the location for resources.')
param location string = resourceGroup().location
param SPapplicationId string
param SPobjectId string

resource symbolicname 'Microsoft.KeyVault/vaults@2022-07-01' = {
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
        tenantId: 'string'
      }
    ]
  }
}
