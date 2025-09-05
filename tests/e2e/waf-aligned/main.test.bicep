targetScope = 'subscription'
metadata name = 'Landing Zone - BYO Associated Resources'
metadata description = 'Deploys landing zone; AI Foundry uses existing Search/Storage/Cosmos. Runs twice (init + idem).'

// Parameters
@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-bicep-${serviceShort}-rg'

import { enforcedLocation } from '../../shared/constants.bicep'

@description('Optional. Short identifier for the test kind.')
param serviceShort string = 'lzbyo'

@description('Optional. A token injected by CI for uniqueness.')
param namePrefix string = '#_namePrefix_#'

// 12 chars to match baseName usage
var _seed = toLower('${namePrefix}${serviceShort}')
var workloadName = take(replace(replace(replace(replace(_seed, ' ', ''), '-', ''), '_', ''), '.', ''), 12)

// Dependencies RG
var _depRgRaw = 'dep-${namePrefix}-bicep-${serviceShort}-dependencies-rg'
resource dependenciesResourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: take(_depRgRaw, 90)
  location: enforcedLocation
}

// Create BYO resources
module dependencies 'dependencies.bicep' = {
  name: take('module.dependencies.${workloadName}', 64)
  scope: dependenciesResourceGroup
  params: {
    workloadName: workloadName
    location: enforcedLocation
  }
}

// Test RG
resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: enforcedLocation
}

// Test execution (idempotency)
@batchSize(1)
module testDeployment '../../../infra/main.bicep' = [
  for iteration in ['init', 'idem']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, enforcedLocation)}-test-${serviceShort}-${iteration}'
    params: {
      baseName: workloadName

      aiFoundryDefinition: {
        // required by type
        lock: {
          kind: 'None'
          name: ''
        }
        aiProjects: []

        // have AF wire deps
        includeAssociatedResources: true

        aiFoundryConfiguration: {
          createCapabilityHosts: true
        }

        // required config objects (BYO for these three)
        aiSearchConfiguration: {
          existingResourceId: dependencies.outputs.aiSearchResourceId
        }
        storageAccountConfiguration: {
          existingResourceId: dependencies.outputs.storageAccountResourceId
        }
        cosmosDbConfiguration: {
          existingResourceId: dependencies.outputs.cosmosDbAccountResourceId
        }
        // not BYO KV in this scenario, but property must exist
        keyVaultConfiguration: {}

        // model deployments use "scale", not "sku"
        aiModelDeployments: [
          {
            name: 'gpt-4o'
            model: {
              format: 'OpenAI'
              name: 'gpt-4o'
              version: '2024-11-20'
            }
            scale: { type: 'Standard', capacity: 1, family: '', size: '', tier: '' }
          }
        ]
      }
      jumpVmAdminPassword: '<StrongP@ssw0rd!>'
    }

    // Let the landing zone decide what GenAI core to create (defaults).
    // We are explicitly BYO for AF-associated resources via aiFoundryDefinition above.
  }
]
