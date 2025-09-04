targetScope = 'subscription'
metadata name = 'Landing Zone - Defaults'
metadata description = 'Deploys the landing zone with defaults.'

// Parameters
@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-bicep-${serviceShort}-rg'

import { enforcedLocation } from '../../shared/constants.bicep'

@description('Optional. Short identifier for the test kind. Keep short to avoid name-length issues.')
param serviceShort string = 'lzdef'

@description('Optional. A token injected by CI for uniqueness.')
param namePrefix string = '#_namePrefix_#'

// Keep 12 chars to match baseName default constraints
var workloadName = take(padLeft('${namePrefix}${serviceShort}', 12), 12)

// RG for test
resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: enforcedLocation
}

// Test execution (idempotency: init + idem)
@batchSize(1)
module testDeployment '../../../main.bicep' = [
  for iteration in ['init', 'idem']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, enforcedLocation)}-test-${serviceShort}-${iteration}'
    params: {
      // Make baseName explicit for stability
      baseName: workloadName

      // Minimal model to keep capacity small and deterministic
      aiFoundryDefinition: {
        lock: { kind: 'None', name: '' }
        aiProjects: []
        includeAssociatedResources: true
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
