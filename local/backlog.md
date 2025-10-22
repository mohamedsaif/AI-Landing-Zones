// 16.2 AI Foundry Application Insights Connection
var varDeployAfAppInsightsConnection = varDeployAppInsights || !empty(resourceIds.?appInsightsResourceId!)

// Compute the AI Hub account name (Cognitive Services Account)
var varAiHubAccountName = aiFoundryDefinition.?aiFoundryConfiguration.?accountName ?? 'ai${baseName}'

// Reference to the AI Hub (Cognitive Services Account) - created by aiFoundry module
resource aiHubAccount 'Microsoft.CognitiveServices/accounts@2025-06-01' existing = if (varDeployAfAppInsightsConnection) {
  name: varAiHubAccountName
  scope: resourceGroup()
}

var aiHubAccountResourceId = resourceId('Microsoft.CognitiveServices/accounts', varAiHubAccountName)

// Create the Application Insights connection under the Cognitive Services Account
resource aiFoundryAppInsightsConnection 'Microsoft.CognitiveServices/accounts/connections@2025-06-01' = if (varDeployAfAppInsightsConnection) {
  name: 'ApplicationInsights'
  parent: aiHubAccount
  properties: {
    category: 'ApplicationInsights'
    authType: 'AAD'
    isSharedToAll: true
    target: varAppiResourceId
    metadata: {
      ResourceId: varAppiResourceId
    }
  }
  dependsOn: [
    aiFoundry
    #disable-next-line BCP321
    varDeployAppInsights ? appInsights : null
  ]
}




======================================================



// 7.9 AI Services (OpenAI) Private Endpoint for Evaluation
@description('Optional. AI Services (OpenAI) Private Endpoint configuration for Evaluation feature.')
param aiServicesPrivateEndpointDefinition privateDnsZoneDefinitionType?

var aiServicesResourceId = resourceId(
  resourceGroup().id,
  'Microsoft.CognitiveServices/accounts',
  aiFoundry.outputs.aiServicesName
)

module privateEndpointAiServices 'wrappers/avm.res.network.private-endpoint.bicep' = if (varDeployPdnsAndPe) {
  name: 'aiservices-private-endpoint-${varUniqueSuffix}'
  params: {
    privateEndpoint: union(
      {
        name: 'pe-aiservices-${baseName}'
        location: location
        tags: tags
        subnetResourceId: varPeSubnetId
        enableTelemetry: enableTelemetry
        privateLinkServiceConnections: [
          {
            name: 'aiServicesConnection'
            properties: {
              privateLinkServiceId: aiServicesResourceId
              groupIds: ['account']
            }
          }
        ]
        privateDnsZoneGroup: {
          name: 'aiServicesDnsZoneGroup'
          privateDnsZoneGroupConfigs: [
            {
              name: 'aiServicesARecord'
              privateDnsZoneResourceId: !varUseExistingPdz.openai
                ? privateDnsZoneOpenAi!.outputs.resourceId
                : privateDnsZonesDefinition.openaiZoneId!
            }
          ]
        }
      },
      aiServicesPrivateEndpointDefinition ?? {}
    )
  }
  dependsOn: [
    aiFoundry!
    #disable-next-line BCP321
    (varDeployPdnsAndPe && !varUseExistingPdz.openai) ? privateDnsZoneOpenAi : null
  ]
}