targetScope = 'subscription'
metadata name = 'Landing Zone - Defaults'
metadata description = 'Deploys the landing zone with defaults.'

// Parameters
@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-bicep-${serviceShort}-rg'

#disable-next-line no-hardcoded-location
import { enforcedLocation, tags } from '../../shared/constants.bicep'

@description('Optional. Short identifier for the test kind. Keep short to avoid name-length issues.')
param serviceShort string = 'lzmin'

@description('Optional. A token injected by CI for uniqueness.')
param namePrefix string = '#_namePrefix_#'

// Keep 12 chars to match baseName default constraints
var _seed = toLower('${namePrefix}${serviceShort}')
var workloadName = take(replace(replace(replace(replace(_seed, ' ', ''), '-', ''), '_', ''), '.', ''), 12)

// RG for test
resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: enforcedLocation
  tags: tags
}

// Deploys the AI/ML landing zone with default settings and no model deployments, validating basic provisioning and idempotency.
@batchSize(1)
module testDeployment '../../../infra/main.bicep' = [
  for iteration in ['init']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, enforcedLocation)}-test-${serviceShort}-${iteration}'
    params: {
      baseName: workloadName
      location: enforcedLocation
      aiFoundryDefinition: {
        includeAssociatedResources: false
        aiModelDeployments: []
        aiFoundryConfiguration: {
          createCapabilityHosts: false
        }
      }
    }
  }
]
