param keyVaultName string
param containerRegistry string
param containerGroupName string
param containerName string
param image string
param environmentVariableName string
param environmentVariableValue string
param portNumber int

resource 'Microsoft.KeyVault/vaults' 'myKeyVault' {
  name                = keyVaultName
  location            = 'westus'
  resourceGroupName   = resourceGroup().name
  sku                 = 'standard'

  accessPolicies = [
    {
      tenantId = 'your tenant id'
      objectId = 'your object id'
      secretPermissions = ['get','list']
    }
  ]
}

resource 'Microsoft.KeyVault/vaults/secrets' 'myaccesskey' {
  vault_name = keyVaultName
  name = environmentVariableName
  value = environmentVariableValue
}

resource 'Microsoft.ContainerInstance/containerGroups' 'myContainerGroup' {
  name = containerGroupName
  location = 'westus'
  resourceGroupName = resourceGroup().name
  ipAddress {
    ports = [
      {
        protocol = 'TCP'
        port = portNumber
      }
    ]
    type = 'Public'
  }
  container {
    name = containerName
    image = image
    environmentVariables = [
        {
            name = environmentVariableName
            value = reference('Microsoft.KeyVault/vaults/secrets', environmentVariableName, 'value')
        }
    ]
  }
}
