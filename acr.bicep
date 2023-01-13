resource acr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: 'mylittlechecker'
  location: 'westus'
  sku: {
    name: 'Basic'
  }
}
