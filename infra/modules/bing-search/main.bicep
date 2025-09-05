// modules/bing-search/main.bicep
// Create-or-reuse a Bing Grounding account and always create the Cognitive Services connection
// to be used by Azure AI Foundry. No Microsoft.Resources/links used here.

@description('The name of the Azure Cognitive Services account to be used for the Bing Search tool.')
param account_name string

@description('The name of the Azure Cognitive Services Project.')
param project_name string

@description('The name to assign to the Bing Search resource instance (used when creating a new account).')
param bingSearchName string

@description('The name to assign to the Bing Search connection in the project.')
param bingConnectionName string = '${bingSearchName}-connection'

@description('Optional. Existing Bing Grounding account resource ID to reuse instead of creating a new one.')
param existingResourceId string = ''

// Resolve create vs reuse
var _isReuse = !empty(existingResourceId)
var _idSegs = split(existingResourceId, '/')
var _exSub = length(_idSegs) >= 3 ? _idSegs[2] : ''
var _exRg  = length(_idSegs) >= 5 ? _idSegs[4] : ''
var _exName = length(_idSegs) >= 1 ? last(_idSegs) : ''

// Cognitive Services account (same resource group as current deployment)
#disable-next-line BCP081
resource account_name_resource 'Microsoft.CognitiveServices/accounts@2025-06-01' existing = {
  name: account_name
  scope: resourceGroup()
}

// Reuse path: declare existing Bing account
#disable-next-line BCP081
resource existingBing 'Microsoft.Bing/accounts@2025-05-01-preview' existing = if (_isReuse) {
  name: _exName
  scope: resourceGroup(_exSub, _exRg)
}

// Create path: create Bing account (global location)
#disable-next-line BCP081
resource bingAccount 'Microsoft.Bing/accounts@2025-05-01-preview' = if (!_isReuse) {
  name: bingSearchName
  location: 'global'
  kind: 'Bing.Grounding'
  sku: {
    name: 'G1'
  }
}

// Effective props for both paths
var _bingId = _isReuse ? existingResourceId : bingAccount.id
var _bingEndpoint = _isReuse ? existingBing!.properties.endpoint : bingAccount!.properties.endpoint
var _bingKey = _isReuse ? existingBing!.listKeys().key1 : bingAccount!.listKeys().key1
var _bingLocation = _isReuse ? existingBing!.location : 'global'

// Create the Cognitive Services connection under the AI Services account
#disable-next-line BCP081
resource bing_search_account_connection 'Microsoft.CognitiveServices/accounts/connections@2025-06-01' = {
  name: bingConnectionName
  parent: account_name_resource
  properties: {
    category: 'GroundingWithBingSearch'
    target: _bingEndpoint
    authType: 'ApiKey'
    credentials: {
      key: _bingKey
    }
    isSharedToAll: true
    metadata: {
      ApiType: 'Azure'
      Location: _bingLocation
      ResourceId: _bingId
    }
  }
}

// Outputs
@description('Resource ID of the Bing Grounding account (created or reused).')
output resourceId string = _bingId

@description('Connection ID path under the AI services project.')
output bingConnectionId string = '/subscriptions/${subscription().subscriptionId}/resourceGroups/${resourceGroup().name}/providers/Microsoft.CognitiveServices/accounts/${account_name}/projects/${project_name}/connections/${bingConnectionName}'
