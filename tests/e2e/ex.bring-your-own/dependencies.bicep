// Creates Search, Storage, Cosmos DB to be referenced by AI Foundry (BYO scenario)
targetScope = 'resourceGroup'

@description('Seed for deterministic names.')
param workloadName string

@description('Location for dependencies.')
param location string

// Use a safe, deterministic seed for resource names (only alphanumerics)
var seed = toLower(uniqueString(workloadName))

// Names respecting service constraints
var searchName = 'srch${take(seed, 20)}' // up to 60, lowercase letters/digits/dashes (no dashes used)
var cosmosName = 'cos${take(seed, 40)}' // 3-44, lowercase
var storageName = 'st${take(seed, 22)}' // 3-24, lowercase, alphanumeric only

// Azure AI Search
module searchService 'br/public:avm/res/search/search-service:0.11.1' = {
  name: 'dep-search'
  params: {
    name: searchName
    location: location
  }
}

// Cosmos DB account
module cosmosAccount 'br/public:avm/res/document-db/database-account:0.15.1' = {
  name: 'dep-cosmos'
  params: {
    name: cosmosName
    location: location
    zoneRedundant: false
  }
}

// Storage Account
module storageAccount 'br/public:avm/res/storage/storage-account:0.26.2' = {
  name: 'dep-storage'
  params: {
    name: storageName
    location: location
    allowBlobPublicAccess: false
  }
}

output aiSearchResourceId string = resourceId('Microsoft.Search/searchServices', searchName)
output cosmosDbAccountResourceId string = resourceId('Microsoft.DocumentDB/databaseAccounts', cosmosName)
output storageAccountResourceId string = resourceId('Microsoft.Storage/storageAccounts', storageName)
