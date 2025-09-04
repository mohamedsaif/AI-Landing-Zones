targetScope = 'subscription'
metadata name = 'Landing Zone - GenAI Core (no sharing)'
metadata description = 'Deploys GenAI core in the landing zone; AI Foundry uses its own associated resources (no sharing).'

// Parameters
@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-bicep-${serviceShort}-rg'

import { enforcedLocation } from '../../shared/constants.bicep'

@description('Optional. Short identifier for the test kind.')
param serviceShort string = 'lzshare'

@description('Optional. A token injected by CI for uniqueness.')
param namePrefix string = '#_namePrefix_#'

// 12 chars to match baseName usage
var workloadName = take(padLeft('${namePrefix}${serviceShort}', 12), 12)

// Test RG
resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: enforcedLocation
}

// Test execution (idempotency)
@batchSize(1)
module testDeployment '../../../main.bicep' = [
  for iteration in ['init', 'idem']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, enforcedLocation)}-test-${serviceShort}-${iteration}'
    params: {
      baseName: workloadName
      // Ensure GenAI core is created by the landing zone (defaults do this).
      aiFoundryDefinition: {
        lock: { kind: 'None', name: '' }
        aiProjects: []
        includeAssociatedResources: true // Foundry will create its own Search/Cosmos/KV/Storage
        aiSearchConfiguration: {}
        storageAccountConfiguration: {}
        cosmosDbConfiguration: {}
        keyVaultConfiguration: {}
        aiModelDeployments: [
          {
            name: 'gpt-4o'
            model: { format: 'OpenAI', name: 'gpt-4o', version: '2024-11-20' }
            scale: { type: 'Standard', capacity: 1, family: '', size: '', tier: '' }
          }
        ]
      }
      jumpVmAdminPassword: '<StrongP@ssw0rd!>'
    }
  }
]
