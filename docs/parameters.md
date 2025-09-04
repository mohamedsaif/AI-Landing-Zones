#  `[AiMl/LandingZone]`


## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Data Collection](#Data-Collection)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.ApiManagement/service` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2024-05-01/service) |
| `Microsoft.ApiManagement/service/apis` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/apis) |
| `Microsoft.ApiManagement/service/apis/diagnostics` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/apis/diagnostics) |
| `Microsoft.ApiManagement/service/apis/policies` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/apis/policies) |
| `Microsoft.ApiManagement/service/apiVersionSets` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/apiVersionSets) |
| `Microsoft.ApiManagement/service/authorizationServers` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/authorizationServers) |
| `Microsoft.ApiManagement/service/backends` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/backends) |
| `Microsoft.ApiManagement/service/caches` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/caches) |
| `Microsoft.ApiManagement/service/identityProviders` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/identityProviders) |
| `Microsoft.ApiManagement/service/loggers` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/loggers) |
| `Microsoft.ApiManagement/service/namedValues` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/namedValues) |
| `Microsoft.ApiManagement/service/policies` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/policies) |
| `Microsoft.ApiManagement/service/portalsettings` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/portalsettings) |
| `Microsoft.ApiManagement/service/products` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/products) |
| `Microsoft.ApiManagement/service/products/apis` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/products/apis) |
| `Microsoft.ApiManagement/service/products/groups` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/products/groups) |
| `Microsoft.ApiManagement/service/subscriptions` | [2022-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2022-08-01/service/subscriptions) |
| `Microsoft.App/containerApps` | [2025-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2025-01-01/containerApps) |
| `Microsoft.App/containerApps/authConfigs` | [2025-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2025-01-01/containerApps/authConfigs) |
| `Microsoft.App/managedEnvironments` | [2024-10-02-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2024-10-02-preview/managedEnvironments) |
| `Microsoft.App/managedEnvironments/certificates` | [2024-10-02-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2024-10-02-preview/managedEnvironments/certificates) |
| `Microsoft.App/managedEnvironments/storages` | [2024-10-02-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.App/2024-10-02-preview/managedEnvironments/storages) |
| `Microsoft.AppConfiguration/configurationStores` | [2025-02-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.AppConfiguration/2025-02-01-preview/configurationStores) |
| `Microsoft.AppConfiguration/configurationStores/keyValues` | [2025-02-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.AppConfiguration/2025-02-01-preview/configurationStores/keyValues) |
| `Microsoft.AppConfiguration/configurationStores/replicas` | [2025-02-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.AppConfiguration/2025-02-01-preview/configurationStores/replicas) |
| `Microsoft.Authorization/locks` | [2020-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks) |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.Automanage/configurationProfileAssignments` | [2022-05-04](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Automanage/2022-05-04/configurationProfileAssignments) |
| `Microsoft.CognitiveServices/accounts` | [2025-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts) |
| `Microsoft.CognitiveServices/accounts/capabilityHosts` | [2025-04-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/capabilityHosts) |
| `Microsoft.CognitiveServices/accounts/commitmentPlans` | [2025-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts/commitmentPlans) |
| `Microsoft.CognitiveServices/accounts/deployments` | [2025-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-06-01/accounts/deployments) |
| `Microsoft.CognitiveServices/accounts/projects` | [2025-04-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/projects) |
| `Microsoft.CognitiveServices/accounts/projects/capabilityHosts` | [2025-04-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/projects/capabilityHosts) |
| `Microsoft.CognitiveServices/accounts/projects/connections` | [2025-04-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.CognitiveServices/2025-04-01-preview/accounts/projects/connections) |
| `Microsoft.Compute/disks` | [2024-03-02](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Compute/2024-03-02/disks) |
| `Microsoft.Compute/virtualMachines` | [2024-07-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Compute/2024-07-01/virtualMachines) |
| `Microsoft.Compute/virtualMachines/extensions` | [2022-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Compute/2022-11-01/virtualMachines/extensions) |
| `Microsoft.ContainerRegistry/registries` | [2023-06-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries) |
| `Microsoft.ContainerRegistry/registries/cacheRules` | [2023-06-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/cacheRules) |
| `Microsoft.ContainerRegistry/registries/credentialSets` | [2023-11-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-11-01-preview/registries/credentialSets) |
| `Microsoft.ContainerRegistry/registries/replications` | [2023-06-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/replications) |
| `Microsoft.ContainerRegistry/registries/scopeMaps` | [2023-06-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/scopeMaps) |
| `Microsoft.ContainerRegistry/registries/webhooks` | [2023-06-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ContainerRegistry/2023-06-01-preview/registries/webhooks) |
| `Microsoft.DevTestLab/schedules` | [2018-09-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DevTestLab/2018-09-15/schedules) |
| `Microsoft.DocumentDB/databaseAccounts` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts) |
| `Microsoft.DocumentDB/databaseAccounts/gremlinDatabases` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/gremlinDatabases) |
| `Microsoft.DocumentDB/databaseAccounts/gremlinDatabases/graphs` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/gremlinDatabases/graphs) |
| `Microsoft.DocumentDB/databaseAccounts/mongodbDatabases` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/mongodbDatabases) |
| `Microsoft.DocumentDB/databaseAccounts/mongodbDatabases/collections` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/mongodbDatabases/collections) |
| `Microsoft.DocumentDB/databaseAccounts/sqlDatabases` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlDatabases) |
| `Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlDatabases/containers) |
| `Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlRoleAssignments) |
| `Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments` | [2025-04-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2025-04-15/databaseAccounts/sqlRoleAssignments) |
| `Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/sqlRoleDefinitions) |
| `Microsoft.DocumentDB/databaseAccounts/tables` | [2024-11-15](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DocumentDB/2024-11-15/databaseAccounts/tables) |
| `Microsoft.GuestConfiguration/guestConfigurationAssignments` | [2020-06-25](https://learn.microsoft.com/en-us/azure/templates/Microsoft.GuestConfiguration/2020-06-25/guestConfigurationAssignments) |
| `Microsoft.Insights/components` | [2020-02-02](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2020-02-02/components) |
| `microsoft.insights/components/linkedStorageAccounts` | [2020-03-01-preview](https://learn.microsoft.com/en-us/azure/templates/microsoft.insights/2020-03-01-preview/components/linkedStorageAccounts) |
| `Microsoft.Insights/dataCollectionRuleAssociations` | [2023-03-11](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2023-03-11/dataCollectionRuleAssociations) |
| `Microsoft.Insights/diagnosticSettings` | [2021-05-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2021-05-01-preview/diagnosticSettings) |
| `Microsoft.KeyVault/vaults` | [2024-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults) |
| `Microsoft.KeyVault/vaults/accessPolicies` | [2024-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults/accessPolicies) |
| `Microsoft.KeyVault/vaults/keys` | [2024-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults/keys) |
| `Microsoft.KeyVault/vaults/secrets` | [2024-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2024-11-01/vaults/secrets) |
| `Microsoft.Maintenance/configurationAssignments` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Maintenance/2023-04-01/configurationAssignments) |
| `Microsoft.Network/applicationGateways` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/applicationGateways) |
| `Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies` | [2024-03-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-03-01/ApplicationGatewayWebApplicationFirewallPolicies) |
| `Microsoft.Network/azureFirewalls` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/azureFirewalls) |
| `Microsoft.Network/firewallPolicies` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/firewallPolicies) |
| `Microsoft.Network/firewallPolicies/ruleCollectionGroups` | [2023-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-04-01/firewallPolicies/ruleCollectionGroups) |
| `Microsoft.Network/networkInterfaces` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/networkInterfaces) |
| `Microsoft.Network/privateDnsZones` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones) |
| `Microsoft.Network/privateDnsZones/A` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/A) |
| `Microsoft.Network/privateDnsZones/AAAA` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/AAAA) |
| `Microsoft.Network/privateDnsZones/CNAME` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/CNAME) |
| `Microsoft.Network/privateDnsZones/MX` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/MX) |
| `Microsoft.Network/privateDnsZones/PTR` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/PTR) |
| `Microsoft.Network/privateDnsZones/SOA` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SOA) |
| `Microsoft.Network/privateDnsZones/SRV` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SRV) |
| `Microsoft.Network/privateDnsZones/TXT` | [2020-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/TXT) |
| `Microsoft.Network/privateDnsZones/virtualNetworkLinks` | [2024-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-06-01/privateDnsZones/virtualNetworkLinks) |
| `Microsoft.Network/privateEndpoints` | [2023-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-11-01/privateEndpoints) |
| `Microsoft.Network/privateEndpoints` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/privateEndpoints) |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups` | [2023-11-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2023-11-01/privateEndpoints/privateDnsZoneGroups) |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/privateEndpoints/privateDnsZoneGroups) |
| `Microsoft.Network/publicIPAddresses` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/publicIPAddresses) |
| `Microsoft.Network/virtualNetworks` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/virtualNetworks) |
| `Microsoft.Network/virtualNetworks/subnets` | [2024-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-05-01/virtualNetworks/subnets) |
| `Microsoft.Network/virtualNetworks/virtualNetworkPeerings` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Network/2024-01-01/virtualNetworks/virtualNetworkPeerings) |
| `Microsoft.OperationalInsights/workspaces` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces) |
| `Microsoft.OperationalInsights/workspaces/dataExports` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/dataExports) |
| `Microsoft.OperationalInsights/workspaces/dataSources` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/dataSources) |
| `Microsoft.OperationalInsights/workspaces/linkedServices` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/linkedServices) |
| `Microsoft.OperationalInsights/workspaces/linkedStorageAccounts` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/linkedStorageAccounts) |
| `Microsoft.OperationalInsights/workspaces/savedSearches` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/savedSearches) |
| `Microsoft.OperationalInsights/workspaces/storageInsightConfigs` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/storageInsightConfigs) |
| `Microsoft.OperationalInsights/workspaces/tables` | [2025-02-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2025-02-01/workspaces/tables) |
| `Microsoft.OperationsManagement/solutions` | [2015-11-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationsManagement/2015-11-01-preview/solutions) |
| `Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems` | [2023-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.RecoveryServices/2023-01-01/vaults/backupFabrics/protectionContainers/protectedItems) |
| `Microsoft.Resources/deploymentScripts` | [2023-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Resources/2023-08-01/deploymentScripts) |
| `Microsoft.Search/searchServices` | [2025-02-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Search/2025-02-01-preview/searchServices) |
| `Microsoft.Search/searchServices/sharedPrivateLinkResources` | [2025-02-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Search/2025-02-01-preview/searchServices/sharedPrivateLinkResources) |
| `Microsoft.SecurityInsights/onboardingStates` | [2024-03-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.SecurityInsights/2024-03-01/onboardingStates) |
| `Microsoft.Storage/storageAccounts` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts) |
| `Microsoft.Storage/storageAccounts/blobServices` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/blobServices) |
| `Microsoft.Storage/storageAccounts/blobServices/containers` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/blobServices/containers) |
| `Microsoft.Storage/storageAccounts/blobServices/containers/immutabilityPolicies` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/blobServices/containers/immutabilityPolicies) |
| `Microsoft.Storage/storageAccounts/fileServices` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/fileServices) |
| `Microsoft.Storage/storageAccounts/fileServices/shares` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/fileServices/shares) |
| `Microsoft.Storage/storageAccounts/localUsers` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/localUsers) |
| `Microsoft.Storage/storageAccounts/managementPolicies` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/managementPolicies) |
| `Microsoft.Storage/storageAccounts/queueServices` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/queueServices) |
| `Microsoft.Storage/storageAccounts/queueServices/queues` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/queueServices/queues) |
| `Microsoft.Storage/storageAccounts/tableServices` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/tableServices) |
| `Microsoft.Storage/storageAccounts/tableServices/tables` | [2024-01-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Storage/2024-01-01/storageAccounts/tableServices/tables) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/ptn/ai-ml/landing-zone:<version>`.

- [Landing Zone - Share GenAI Backing Services](#example-1-landing-zone---share-genai-backing-services)
- [Landing Zone - BYO Associated Resources](#example-2-landing-zone---byo-associated-resources)
- [Landing Zone - Defaults](#example-3-landing-zone---defaults)

### Example 1: _Landing Zone - Share GenAI Backing Services_

Deploys GenAI backing services in the landing zone and shares all of them with AI Foundry.


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    aiFoundryDefinition: {
      aiModelDeployments: [
        {
          model: {
            format: 'OpenAI'
            name: 'gpt-4o'
            version: '2024-11-20'
          }
          name: 'gpt-4o'
          scale: {
            capacity: 1
            family: ''
            size: ''
            tier: ''
            type: 'Standard'
          }
        }
      ]
      aiProjects: []
      aiSearchConfiguration: {}
      cosmosDbConfiguration: {}
      includeAssociatedResources: true
      keyVaultConfiguration: {}
      lock: {
        kind: 'None'
        name: ''
      }
      storageAccountConfiguration: {}
    }
    baseName: '<baseName>'
    jumpVmAdminPassword: '<StrongP@ssw0rd!>'
    shareResources: {
      cosmosDb: true
      keyVault: true
      searchService: true
      storageAccount: true
    }
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "aiFoundryDefinition": {
      "value": {
        "aiModelDeployments": [
          {
            "model": {
              "format": "OpenAI",
              "name": "gpt-4o",
              "version": "2024-11-20"
            },
            "name": "gpt-4o",
            "scale": {
              "capacity": 1,
              "family": "",
              "size": "",
              "tier": "",
              "type": "Standard"
            }
          }
        ],
        "aiProjects": [],
        "aiSearchConfiguration": {},
        "cosmosDbConfiguration": {},
        "includeAssociatedResources": true,
        "keyVaultConfiguration": {},
        "lock": {
          "kind": "None",
          "name": ""
        },
        "storageAccountConfiguration": {}
      }
    },
    "baseName": {
      "value": "<baseName>"
    },
    "jumpVmAdminPassword": {
      "value": "<StrongP@ssw0rd!>"
    },
    "shareResources": {
      "value": {
        "cosmosDb": true,
        "keyVault": true,
        "searchService": true,
        "storageAccount": true
      }
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone:<version>'

param aiFoundryDefinition = {
  aiModelDeployments: [
    {
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      name: 'gpt-4o'
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
  ]
  aiProjects: []
  aiSearchConfiguration: {}
  cosmosDbConfiguration: {}
  includeAssociatedResources: true
  keyVaultConfiguration: {}
  lock: {
    kind: 'None'
    name: ''
  }
  storageAccountConfiguration: {}
}
param baseName = '<baseName>'
param jumpVmAdminPassword = '<StrongP@ssw0rd!>'
param shareResources = {
  cosmosDb: true
  keyVault: true
  searchService: true
  storageAccount: true
}
```

</details>
<p>

### Example 2: _Landing Zone - BYO Associated Resources_

Deploys landing zone; AI Foundry uses existing Search/Storage/Cosmos. Runs twice (init + idem).


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    aiFoundryDefinition: {
      aiModelDeployments: [
        {
          model: {
            format: 'OpenAI'
            name: 'gpt-4o'
            version: '2024-11-20'
          }
          name: 'gpt-4o'
          scale: {
            capacity: 1
            family: ''
            size: ''
            tier: ''
            type: 'Standard'
          }
        }
      ]
      aiProjects: []
      aiSearchConfiguration: {
        existingResourceId: '<existingResourceId>'
      }
      cosmosDbConfiguration: {
        existingResourceId: '<existingResourceId>'
      }
      includeAssociatedResources: true
      keyVaultConfiguration: {}
      lock: {
        kind: 'None'
        name: ''
      }
      storageAccountConfiguration: {
        existingResourceId: '<existingResourceId>'
      }
    }
    baseName: '<baseName>'
    jumpVmAdminPassword: '<StrongP@ssw0rd!>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "aiFoundryDefinition": {
      "value": {
        "aiModelDeployments": [
          {
            "model": {
              "format": "OpenAI",
              "name": "gpt-4o",
              "version": "2024-11-20"
            },
            "name": "gpt-4o",
            "scale": {
              "capacity": 1,
              "family": "",
              "size": "",
              "tier": "",
              "type": "Standard"
            }
          }
        ],
        "aiProjects": [],
        "aiSearchConfiguration": {
          "existingResourceId": "<existingResourceId>"
        },
        "cosmosDbConfiguration": {
          "existingResourceId": "<existingResourceId>"
        },
        "includeAssociatedResources": true,
        "keyVaultConfiguration": {},
        "lock": {
          "kind": "None",
          "name": ""
        },
        "storageAccountConfiguration": {
          "existingResourceId": "<existingResourceId>"
        }
      }
    },
    "baseName": {
      "value": "<baseName>"
    },
    "jumpVmAdminPassword": {
      "value": "<StrongP@ssw0rd!>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone:<version>'

param aiFoundryDefinition = {
  aiModelDeployments: [
    {
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      name: 'gpt-4o'
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
  ]
  aiProjects: []
  aiSearchConfiguration: {
    existingResourceId: '<existingResourceId>'
  }
  cosmosDbConfiguration: {
    existingResourceId: '<existingResourceId>'
  }
  includeAssociatedResources: true
  keyVaultConfiguration: {}
  lock: {
    kind: 'None'
    name: ''
  }
  storageAccountConfiguration: {
    existingResourceId: '<existingResourceId>'
  }
}
param baseName = '<baseName>'
param jumpVmAdminPassword = '<StrongP@ssw0rd!>'
```

</details>
<p>

### Example 3: _Landing Zone - Defaults_

Deploys the landing zone with defaults.


<details>

<summary>via Bicep module</summary>

```bicep
module landingZone 'br/public:avm/ptn/ai-ml/landing-zone:<version>' = {
  name: 'landingZoneDeployment'
  params: {
    aiFoundryDefinition: {
      aiModelDeployments: [
        {
          model: {
            format: 'OpenAI'
            name: 'gpt-4o'
            version: '2024-11-20'
          }
          name: 'gpt-4o'
          scale: {
            capacity: 1
            family: ''
            size: ''
            tier: ''
            type: 'Standard'
          }
        }
      ]
      aiProjects: []
      aiSearchConfiguration: {}
      cosmosDbConfiguration: {}
      includeAssociatedResources: true
      keyVaultConfiguration: {}
      lock: {
        kind: 'None'
        name: ''
      }
      storageAccountConfiguration: {}
    }
    baseName: '<baseName>'
    jumpVmAdminPassword: '<StrongP@ssw0rd!>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "aiFoundryDefinition": {
      "value": {
        "aiModelDeployments": [
          {
            "model": {
              "format": "OpenAI",
              "name": "gpt-4o",
              "version": "2024-11-20"
            },
            "name": "gpt-4o",
            "scale": {
              "capacity": 1,
              "family": "",
              "size": "",
              "tier": "",
              "type": "Standard"
            }
          }
        ],
        "aiProjects": [],
        "aiSearchConfiguration": {},
        "cosmosDbConfiguration": {},
        "includeAssociatedResources": true,
        "keyVaultConfiguration": {},
        "lock": {
          "kind": "None",
          "name": ""
        },
        "storageAccountConfiguration": {}
      }
    },
    "baseName": {
      "value": "<baseName>"
    },
    "jumpVmAdminPassword": {
      "value": "<StrongP@ssw0rd!>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/ptn/ai-ml/landing-zone:<version>'

param aiFoundryDefinition = {
  aiModelDeployments: [
    {
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      name: 'gpt-4o'
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
  ]
  aiProjects: []
  aiSearchConfiguration: {}
  cosmosDbConfiguration: {}
  includeAssociatedResources: true
  keyVaultConfiguration: {}
  lock: {
    kind: 'None'
    name: ''
  }
  storageAccountConfiguration: {}
}
param baseName = '<baseName>'
param jumpVmAdminPassword = '<StrongP@ssw0rd!>'
```

</details>
<p>

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`location`](#parameter-location) | string |  Azure region for AI Foundry resources. Defaults to the resource group location. |
| [`vnetDefinition`](#parameter-vnetdefinition) | object |  Virtual Network configuration (created when not reusing an existing VNet). |

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`apimDefinition`](#parameter-apimdefinition) | object |  API Management configuration (used when APIM is deployed). |
| [`appConfigurationDefinition`](#parameter-appconfigurationdefinition) | object |  App Configuration store settings (used when App Configuration is deployed). |
| [`appGatewayDefinition`](#parameter-appgatewaydefinition) | object |  Application Gateway configuration (used when AGW is deployed). |
| [`appInsightsDefinition`](#parameter-appinsightsdefinition) | object |  Application Insights configuration (used when App Insights is deployed). |
| [`bastionKeyVaultDefinition`](#parameter-bastionkeyvaultdefinition) | object |  Dedicated Key Vault for JumpVM secrets (public network). |
| [`containerAppEnvDefinition`](#parameter-containerappenvdefinition) | object |  Container App Environment configuration (used when Container Apps are deployed). |
| [`containerRegistryDefinition`](#parameter-containerregistrydefinition) | object |  Container Registry configuration (used when ACR is deployed). |
| [`cosmosDbDefinition`](#parameter-cosmosdbdefinition) | object |  Cosmos DB account configuration for the GenAI app (used when Cosmos DB is deployed). |
| [`firewallDefinition`](#parameter-firewalldefinition) | object |  Azure Firewall configuration (used when Firewall is deployed). |
| [`hubVnetPeeringDefinition`](#parameter-hubvnetpeeringdefinition) | object |  Hub VNet peering configuration (required only when establishing hub-spoke peering). |
| [`jumpVmAdminPassword`](#parameter-jumpvmadminpassword) | securestring | Required when deploying Jump VM. Local admin password to set on the Windows JumpVM. |
| [`keyVaultDefinition`](#parameter-keyvaultdefinition) | object |  Key Vault configuration for the GenAI app (used when KV is deployed). |
| [`logAnalyticsDefinition`](#parameter-loganalyticsdefinition) | object |  Log Analytics Workspace configuration (required if you deploy App Insights and are not reusing an existing workspace). |
| [`privateDnsZoneIds`](#parameter-privatednszoneids) | object |  Existing Private DNS Zone resource IDs per service; provide to reuse, or leave empty to create. |
| [`privateDnsZones`](#parameter-privatednszones) | object |  Private DNS Zones and VNet links configuration (used when creating zones). |
| [`searchDefinition`](#parameter-searchdefinition) | object |  Azure AI Search configuration for the GenAI app (used when Search is deployed). |
| [`storageAccountDefinition`](#parameter-storageaccountdefinition) | object |  Storage Account configuration for the GenAI app (used when Storage is deployed). |
| [`wafPolicyDefinition`](#parameter-wafpolicydefinition) | object |  Web Application Firewall (WAF) policy configuration (required when Application Gateway with WAF is deployed). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiFoundryDefinition`](#parameter-aifoundrydefinition) | object |  AI Foundry project configuration (account/project, networking, associated resources, and deployments). |
| [`azdoPat`](#parameter-azdopat) | securestring | PAT used to register the Azure DevOps agent (when runner = azdo). |
| [`baseName`](#parameter-basename) | string |  Base name to seed resource names; defaults to a 12-char token. |
| [`buildVmDefinition`](#parameter-buildvmdefinition) | object |  Build VM configuration to support CI/CD workers (Linux). |
| [`containerAppsList`](#parameter-containerappslist) | array | List of Container Apps to create. |
| [`deployGenAiAppBackingServices`](#parameter-deploygenaiappbackingservices) | bool |  Deploy GenAI app services; defaults to true. |
| [`deployToggles`](#parameter-deploytoggles) | object |  Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds. |
| [`enableTelemetry`](#parameter-enabletelemetry) | bool |  Enable module telemetry. See https://aka.ms/avm/telemetryinfo. |
| [`firewallPolicyDefinition`](#parameter-firewallpolicydefinition) | object |  Azure Firewall Policy configuration (only used if your deployment wires a policy). |
| [`flagPlatformLandingZone`](#parameter-flagplatformlandingzone) | bool |  Enable platform landing zone integration. |
| [`githubPat`](#parameter-githubpat) | securestring | PAT used to request a GitHub runner registration token (when runner = github). |
| [`jumpVmDefinition`](#parameter-jumpvmdefinition) | object |  Jump (bastion) VM configuration (Windows). |
| [`networkIsolation`](#parameter-networkisolation) | bool | Enable network isolation posture (Private Endpoints + Private DNS). |
| [`resourceIds`](#parameter-resourceids) | object |  Existing resource IDs to reuse; leave empty to create new resources. |
| [`resourceToken`](#parameter-resourcetoken) | string |  Deterministic token for resource names; auto-generated if not provided. |
| [`shareResources`](#parameter-shareresources) | object | Share services between the GenAI app and AI Foundry (Search, KV, Cosmos DB, Storage). |
| [`tags`](#parameter-tags) | object |  Tags applied to all deployed resources. |

### Parameter: `location`

 Azure region for AI Foundry resources. Defaults to the resource group location.

- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `vnetDefinition`

 Virtual Network configuration (created when not reusing an existing VNet).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      addressSpace: '192.168.0.0/16'
      dnsServers: []
      name: ''
      subnets: [
        {
          addressPrefix: '192.168.0.0/24'
          delegation: 'Microsoft.app/environments'
          enabled: true
          name: 'agent-subnet'
          serviceEndpoints: [
            'Microsoft.CognitiveServices'
          ]
        }
        {
          addressPrefix: '192.168.1.0/24'
          enabled: true
          name: 'pe-subnet'
          serviceEndpoints: [
            'Microsoft.AzureCosmosDB'
          ]
        }
        {
          addressPrefix: '192.168.2.0/26'
          enabled: true
          name: 'gateway-subnet'
        }
        {
          addressPrefix: '192.168.2.64/26'
          enabled: true
          name: 'AzureBastionSubnet'
        }
        {
          addressPrefix: '192.168.2.128/26'
          enabled: true
          name: 'AzureFirewallSubnet'
        }
        {
          addressPrefix: '192.168.3.0/24'
          enabled: true
          name: 'AppGatewaySubnet'
        }
        {
          addressPrefix: '192.168.4.0/27'
          enabled: true
          name: 'jumpbox-subnet'
        }
        {
          addressPrefix: '192.168.4.64/27'
          delegation: 'Microsoft.app/environments'
          enabled: true
          name: 'aca-environment-subnet'
          serviceEndpoints: [
            'Microsoft.AzureCosmosDB'
          ]
        }
        {
          addressPrefix: '192.168.4.96/27'
          enabled: true
          name: 'devops-build-agents-subnet'
        }
      ]
      tags: {}
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addressSpace`](#parameter-vnetdefinitionaddressspace) | string | VNet CIDR address space (e.g., 192.168.0.0/16). |
| [`subnets`](#parameter-vnetdefinitionsubnets) | array | Subnet definitions for the VNet. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ddosProtectionPlanResourceId`](#parameter-vnetdefinitionddosprotectionplanresourceid) | string | Resource ID of an existing DDoS Protection Plan to associate. |
| [`dnsServers`](#parameter-vnetdefinitiondnsservers) | array | Custom DNS server IP addresses for the VNet. |
| [`name`](#parameter-vnetdefinitionname) | string | VNet name. If empty, a deterministic name is generated. |
| [`tags`](#parameter-vnetdefinitiontags) | object | Tags to apply to the VNet. |
| [`vnetPeeringConfiguration`](#parameter-vnetdefinitionvnetpeeringconfiguration) | object | Peering configuration to another VNet (hub/spoke). |
| [`vwanHubPeeringConfiguration`](#parameter-vnetdefinitionvwanhubpeeringconfiguration) | object | Peering configuration to a Virtual WAN hub. |

### Parameter: `vnetDefinition.addressSpace`

VNet CIDR address space (e.g., 192.168.0.0/16).

- Required: Yes
- Type: string

### Parameter: `vnetDefinition.subnets`

Subnet definitions for the VNet.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`addressPrefix`](#parameter-vnetdefinitionsubnetsaddressprefix) | string | Subnet address prefix in CIDR notation (e.g., 10.0.1.0/24). |
| [`enabled`](#parameter-vnetdefinitionsubnetsenabled) | bool | Enables (true) or disables (false) creation/use of this subnet. |
| [`name`](#parameter-vnetdefinitionsubnetsname) | string | Subnet name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`delegation`](#parameter-vnetdefinitionsubnetsdelegation) | string | Service delegation for the subnet (resource provider/type). |
| [`natGatewayResourceId`](#parameter-vnetdefinitionsubnetsnatgatewayresourceid) | string | Resource ID of an associated NAT Gateway. |
| [`privateEndpointNetworkPolicies`](#parameter-vnetdefinitionsubnetsprivateendpointnetworkpolicies) | string | Whether private endpoint network policies are Enabled or Disabled. |
| [`privateLinkServiceNetworkPolicies`](#parameter-vnetdefinitionsubnetsprivatelinkservicenetworkpolicies) | string | Whether private link service network policies are Enabled or Disabled. |
| [`serviceEndpoints`](#parameter-vnetdefinitionsubnetsserviceendpoints) | array | Service endpoints to enable for this subnet. |

### Parameter: `vnetDefinition.subnets.addressPrefix`

Subnet address prefix in CIDR notation (e.g., 10.0.1.0/24).

- Required: Yes
- Type: string

### Parameter: `vnetDefinition.subnets.enabled`

Enables (true) or disables (false) creation/use of this subnet.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.subnets.name`

Subnet name.

- Required: Yes
- Type: string

### Parameter: `vnetDefinition.subnets.delegation`

Service delegation for the subnet (resource provider/type).

- Required: No
- Type: string

### Parameter: `vnetDefinition.subnets.natGatewayResourceId`

Resource ID of an associated NAT Gateway.

- Required: No
- Type: string

### Parameter: `vnetDefinition.subnets.privateEndpointNetworkPolicies`

Whether private endpoint network policies are Enabled or Disabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `vnetDefinition.subnets.privateLinkServiceNetworkPolicies`

Whether private link service network policies are Enabled or Disabled.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `vnetDefinition.subnets.serviceEndpoints`

Service endpoints to enable for this subnet.

- Required: No
- Type: array

### Parameter: `vnetDefinition.ddosProtectionPlanResourceId`

Resource ID of an existing DDoS Protection Plan to associate.

- Required: No
- Type: string

### Parameter: `vnetDefinition.dnsServers`

Custom DNS server IP addresses for the VNet.

- Required: No
- Type: array

### Parameter: `vnetDefinition.name`

VNet name. If empty, a deterministic name is generated.

- Required: No
- Type: string

### Parameter: `vnetDefinition.tags`

Tags to apply to the VNet.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-vnetdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `vnetDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `vnetDefinition.vnetPeeringConfiguration`

Peering configuration to another VNet (hub/spoke).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowForwardedTraffic`](#parameter-vnetdefinitionvnetpeeringconfigurationallowforwardedtraffic) | bool | Allow forwarded traffic across the peering. |
| [`allowGatewayTransit`](#parameter-vnetdefinitionvnetpeeringconfigurationallowgatewaytransit) | bool | Allow gateway transit across the peering. |
| [`allowVirtualNetworkAccess`](#parameter-vnetdefinitionvnetpeeringconfigurationallowvirtualnetworkaccess) | bool | Allow virtual network access across the peering. |
| [`createReversePeering`](#parameter-vnetdefinitionvnetpeeringconfigurationcreatereversepeering) | bool | Create the reverse peering from hub back to this VNet. |
| [`peerVnetResourceId`](#parameter-vnetdefinitionvnetpeeringconfigurationpeervnetresourceid) | string | Resource ID of the peer virtual network. |
| [`reverseAllowForwardedTraffic`](#parameter-vnetdefinitionvnetpeeringconfigurationreverseallowforwardedtraffic) | bool | Reverse peering: allow forwarded traffic. |
| [`reverseAllowGatewayTransit`](#parameter-vnetdefinitionvnetpeeringconfigurationreverseallowgatewaytransit) | bool | Reverse peering: allow gateway transit. |
| [`reverseAllowVirtualNetworkAccess`](#parameter-vnetdefinitionvnetpeeringconfigurationreverseallowvirtualnetworkaccess) | bool | Reverse peering: allow virtual network access. |
| [`reverseUseRemoteGateways`](#parameter-vnetdefinitionvnetpeeringconfigurationreverseuseremotegateways) | bool | Reverse peering: use remote gateways. |
| [`useRemoteGateways`](#parameter-vnetdefinitionvnetpeeringconfigurationuseremotegateways) | bool | Use remote gateways on the spoke peering. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`firewallIpAddress`](#parameter-vnetdefinitionvnetpeeringconfigurationfirewallipaddress) | string | Hub firewall private IP address used for routing (if applicable). |
| [`name`](#parameter-vnetdefinitionvnetpeeringconfigurationname) | string | Name of the spoke-to-hub peering. |
| [`reverseName`](#parameter-vnetdefinitionvnetpeeringconfigurationreversename) | string | Name of the reverse peering (hub->spoke). |

### Parameter: `vnetDefinition.vnetPeeringConfiguration.allowForwardedTraffic`

Allow forwarded traffic across the peering.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.allowGatewayTransit`

Allow gateway transit across the peering.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.allowVirtualNetworkAccess`

Allow virtual network access across the peering.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.createReversePeering`

Create the reverse peering from hub back to this VNet.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.peerVnetResourceId`

Resource ID of the peer virtual network.

- Required: Yes
- Type: string

### Parameter: `vnetDefinition.vnetPeeringConfiguration.reverseAllowForwardedTraffic`

Reverse peering: allow forwarded traffic.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.reverseAllowGatewayTransit`

Reverse peering: allow gateway transit.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.reverseAllowVirtualNetworkAccess`

Reverse peering: allow virtual network access.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.reverseUseRemoteGateways`

Reverse peering: use remote gateways.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.useRemoteGateways`

Use remote gateways on the spoke peering.

- Required: Yes
- Type: bool

### Parameter: `vnetDefinition.vnetPeeringConfiguration.firewallIpAddress`

Hub firewall private IP address used for routing (if applicable).

- Required: No
- Type: string

### Parameter: `vnetDefinition.vnetPeeringConfiguration.name`

Name of the spoke-to-hub peering.

- Required: No
- Type: string

### Parameter: `vnetDefinition.vnetPeeringConfiguration.reverseName`

Name of the reverse peering (hub->spoke).

- Required: No
- Type: string

### Parameter: `vnetDefinition.vwanHubPeeringConfiguration`

Peering configuration to a Virtual WAN hub.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`peerVwanHubResourceId`](#parameter-vnetdefinitionvwanhubpeeringconfigurationpeervwanhubresourceid) | string | Resource ID of the target Virtual WAN hub. |

### Parameter: `vnetDefinition.vwanHubPeeringConfiguration.peerVwanHubResourceId`

Resource ID of the target Virtual WAN hub.

- Required: Yes
- Type: string

### Parameter: `apimDefinition`

 API Management configuration (used when APIM is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      additionalLocations: {}
      certificate: {}
      clientCertificateEnabled: false
      hostnameConfiguration: {
        developerPortal: {}
        management: {}
        portal: {}
        proxy: {}
        scm: {}
      }
      minApiVersion: '2019-12-01'
      name: ''
      notificationSenderEmail: 'apimgmt-noreply@azure.com'
      protocols: {
        enableHttp2: true
      }
      publisherEmail: 'admin@example.com'
      publisherName: 'Contoso'
      roleAssignments: []
      signIn: {
        enabled: true
      }
      signUp: {
        enabled: false
        termsOfService: {
          consentRequired: false
          enabled: false
          text: ''
        }
      }
      skuCapacity: 1
      skuRoot: 'Developer'
      tags: {}
      tenantAccess: {
        enabled: true
      }
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`clientCertificateEnabled`](#parameter-apimdefinitionclientcertificateenabled) | bool | Enable client certificate authentication for gateway. |
| [`publisherEmail`](#parameter-apimdefinitionpublisheremail) | string | Publisher email address. |
| [`publisherName`](#parameter-apimdefinitionpublishername) | string | Publisher display name. |
| [`signIn`](#parameter-apimdefinitionsignin) | object | Sign-in configuration for the developer portal. |
| [`signUp`](#parameter-apimdefinitionsignup) | object | Sign-up configuration for the developer portal. |
| [`skuCapacity`](#parameter-apimdefinitionskucapacity) | int | Capacity for the chosen SKU. |
| [`tenantAccess`](#parameter-apimdefinitiontenantaccess) | object | Tenant access configuration for the management plane. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`additionalLocations`](#parameter-apimdefinitionadditionallocations) | object | Additional regions for API Management. |
| [`certificate`](#parameter-apimdefinitioncertificate) | object | Certificates for API Management endpoints. |
| [`hostnameConfiguration`](#parameter-apimdefinitionhostnameconfiguration) | object | Hostname configuration for all endpoints. |
| [`minApiVersion`](#parameter-apimdefinitionminapiversion) | string | Minimum ARM API version to use for APIM operations. |
| [`name`](#parameter-apimdefinitionname) | string | API Management service name. |
| [`notificationSenderEmail`](#parameter-apimdefinitionnotificationsenderemail) | string | Sender email address used by APIM system notifications. |
| [`protocols`](#parameter-apimdefinitionprotocols) | object | Protocol options. |
| [`roleAssignments`](#parameter-apimdefinitionroleassignments) | array | Role assignments to create on the API Management service. |
| [`skuRoot`](#parameter-apimdefinitionskuroot) | string | SKU for API Management (Developer/Basic/Standard/Premium/Consumption/V2 variants). |
| [`tags`](#parameter-apimdefinitiontags) | object | Tags to apply to the API Management service. |

### Parameter: `apimDefinition.clientCertificateEnabled`

Enable client certificate authentication for gateway.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.publisherEmail`

Publisher email address.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.publisherName`

Publisher display name.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.signIn`

Sign-in configuration for the developer portal.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitionsigninenabled) | bool | Enable sign-in on developer portal. |

### Parameter: `apimDefinition.signIn.enabled`

Enable sign-in on developer portal.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp`

Sign-up configuration for the developer portal.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitionsignupenabled) | bool | Enable sign-up on developer portal. |
| [`termsOfService`](#parameter-apimdefinitionsignuptermsofservice) | object | Terms of Service configuration for sign-up. |

### Parameter: `apimDefinition.signUp.enabled`

Enable sign-up on developer portal.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp.termsOfService`

Terms of Service configuration for sign-up.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`consentRequired`](#parameter-apimdefinitionsignuptermsofserviceconsentrequired) | bool | User must consent to ToS. |
| [`enabled`](#parameter-apimdefinitionsignuptermsofserviceenabled) | bool | Terms of Service enabled. |
| [`text`](#parameter-apimdefinitionsignuptermsofservicetext) | string | Text shown for Terms of Service. |

### Parameter: `apimDefinition.signUp.termsOfService.consentRequired`

User must consent to ToS.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp.termsOfService.enabled`

Terms of Service enabled.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.signUp.termsOfService.text`

Text shown for Terms of Service.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.skuCapacity`

Capacity for the chosen SKU.

- Required: Yes
- Type: int

### Parameter: `apimDefinition.tenantAccess`

Tenant access configuration for the management plane.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-apimdefinitiontenantaccessenabled) | bool | Enable tenant access for the management plane. |

### Parameter: `apimDefinition.tenantAccess.enabled`

Enable tenant access for the management plane.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.additionalLocations`

Additional regions for API Management.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitionadditionallocations>any_other_property<) | object | Arbitrary key for each additional location entry. |

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<`

Arbitrary key for each additional location entry.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`capacity`](#parameter-apimdefinitionadditionallocations>any_other_property<capacity) | int | Capacity for the region. |
| [`location`](#parameter-apimdefinitionadditionallocations>any_other_property<location) | string | Location for the additional APIM instance. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`gatewayDisabled`](#parameter-apimdefinitionadditionallocations>any_other_property<gatewaydisabled) | bool | Disable gateway in this region. |
| [`publicIpAddressId`](#parameter-apimdefinitionadditionallocations>any_other_property<publicipaddressid) | string | Public IP address resource ID to bind. |
| [`virtualNetworkConfiguration`](#parameter-apimdefinitionadditionallocations>any_other_property<virtualnetworkconfiguration) | object | VNet configuration for the region. |
| [`zones`](#parameter-apimdefinitionadditionallocations>any_other_property<zones) | array | Availability zones for the region. |

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.capacity`

Capacity for the region.

- Required: Yes
- Type: int

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.location`

Location for the additional APIM instance.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.gatewayDisabled`

Disable gateway in this region.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.publicIpAddressId`

Public IP address resource ID to bind.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.virtualNetworkConfiguration`

VNet configuration for the region.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`subnetId`](#parameter-apimdefinitionadditionallocations>any_other_property<virtualnetworkconfigurationsubnetid) | string | Subnet resource ID used by APIM in this region. |

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.virtualNetworkConfiguration.subnetId`

Subnet resource ID used by APIM in this region.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.additionalLocations.>Any_other_property<.zones`

Availability zones for the region.

- Required: Yes
- Type: array

### Parameter: `apimDefinition.certificate`

Certificates for API Management endpoints.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitioncertificate>any_other_property<) | object | Arbitrary key for each certificate entry. |

### Parameter: `apimDefinition.certificate.>Any_other_property<`

Arbitrary key for each certificate entry.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`encodedCertificate`](#parameter-apimdefinitioncertificate>any_other_property<encodedcertificate) | string | Base64-encoded PFX certificate. |
| [`storeName`](#parameter-apimdefinitioncertificate>any_other_property<storename) | string | Store name to import to (e.g., CertificateAuthority). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificatePassword`](#parameter-apimdefinitioncertificate>any_other_property<certificatepassword) | string | Certificate password. |

### Parameter: `apimDefinition.certificate.>Any_other_property<.encodedCertificate`

Base64-encoded PFX certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.certificate.>Any_other_property<.storeName`

Store name to import to (e.g., CertificateAuthority).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.certificate.>Any_other_property<.certificatePassword`

Certificate password.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration`

Hostname configuration for all endpoints.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`developerPortal`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal) | object | Hostname configuration map for the Legacy Developer Portal (deprecated in some SKUs). |
| [`management`](#parameter-apimdefinitionhostnameconfigurationmanagement) | object | Hostname configuration map for the Management endpoint. |
| [`portal`](#parameter-apimdefinitionhostnameconfigurationportal) | object | Hostname configuration map for the Developer Portal. |
| [`proxy`](#parameter-apimdefinitionhostnameconfigurationproxy) | object | Hostname configuration map for the Gateway/Proxy endpoint. |
| [`scm`](#parameter-apimdefinitionhostnameconfigurationscm) | object | Hostname configuration map for the SCM endpoint. |

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal`

Hostname configuration map for the Legacy Developer Portal (deprecated in some SKUs).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<) | object | Arbitrary key for each hostname binding. |

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<`

Arbitrary key for each hostname binding.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hostName`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<hostname) | string | Host name to bind. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificate`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<certificate) | string | Inline certificate as base64. |
| [`certificatePassword`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<certificatepassword) | string | Password for the inline certificate (if provided). |
| [`defaultSslBinding`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<defaultsslbinding) | bool | Set this binding as default for the endpoint. |
| [`keyVaultId`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<keyvaultid) | string | Key Vault secret ID for the certificate. |
| [`negotiateClientCertificate`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<negotiateclientcertificate) | bool | Negotiate client certificate on TLS. |
| [`sslKeyvaultIdentityClientId`](#parameter-apimdefinitionhostnameconfigurationdeveloperportal>any_other_property<sslkeyvaultidentityclientid) | string | Client ID of the Key Vault identity used for SSL. |

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.hostName`

Host name to bind.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.certificate`

Inline certificate as base64.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.certificatePassword`

Password for the inline certificate (if provided).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.defaultSslBinding`

Set this binding as default for the endpoint.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.keyVaultId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.negotiateClientCertificate`

Negotiate client certificate on TLS.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.developerPortal.>Any_other_property<.sslKeyvaultIdentityClientId`

Client ID of the Key Vault identity used for SSL.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.management`

Hostname configuration map for the Management endpoint.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<) | object | Arbitrary key for each hostname binding. |

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<`

Arbitrary key for each hostname binding.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hostName`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<hostname) | string | Host name to bind. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificate`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<certificate) | string | Inline certificate as base64. |
| [`certificatePassword`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<certificatepassword) | string | Password for the inline certificate (if provided). |
| [`defaultSslBinding`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<defaultsslbinding) | bool | Set this binding as default for the endpoint. |
| [`keyVaultId`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<keyvaultid) | string | Key Vault secret ID for the certificate. |
| [`negotiateClientCertificate`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<negotiateclientcertificate) | bool | Negotiate client certificate on TLS. |
| [`sslKeyvaultIdentityClientId`](#parameter-apimdefinitionhostnameconfigurationmanagement>any_other_property<sslkeyvaultidentityclientid) | string | Client ID of the Key Vault identity used for SSL. |

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.hostName`

Host name to bind.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.certificate`

Inline certificate as base64.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.certificatePassword`

Password for the inline certificate (if provided).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.defaultSslBinding`

Set this binding as default for the endpoint.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.keyVaultId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.negotiateClientCertificate`

Negotiate client certificate on TLS.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.management.>Any_other_property<.sslKeyvaultIdentityClientId`

Client ID of the Key Vault identity used for SSL.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.portal`

Hostname configuration map for the Developer Portal.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<) | object | Arbitrary key for each hostname binding. |

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<`

Arbitrary key for each hostname binding.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hostName`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<hostname) | string | Host name to bind. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificate`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<certificate) | string | Inline certificate as base64. |
| [`certificatePassword`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<certificatepassword) | string | Password for the inline certificate (if provided). |
| [`defaultSslBinding`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<defaultsslbinding) | bool | Set this binding as default for the endpoint. |
| [`keyVaultId`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<keyvaultid) | string | Key Vault secret ID for the certificate. |
| [`negotiateClientCertificate`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<negotiateclientcertificate) | bool | Negotiate client certificate on TLS. |
| [`sslKeyvaultIdentityClientId`](#parameter-apimdefinitionhostnameconfigurationportal>any_other_property<sslkeyvaultidentityclientid) | string | Client ID of the Key Vault identity used for SSL. |

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.hostName`

Host name to bind.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.certificate`

Inline certificate as base64.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.certificatePassword`

Password for the inline certificate (if provided).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.defaultSslBinding`

Set this binding as default for the endpoint.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.keyVaultId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.negotiateClientCertificate`

Negotiate client certificate on TLS.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.portal.>Any_other_property<.sslKeyvaultIdentityClientId`

Client ID of the Key Vault identity used for SSL.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.proxy`

Hostname configuration map for the Gateway/Proxy endpoint.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<) | object | Arbitrary key for each hostname binding. |

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<`

Arbitrary key for each hostname binding.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hostName`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<hostname) | string | Host name to bind. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificate`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<certificate) | string | Inline certificate as base64. |
| [`certificatePassword`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<certificatepassword) | string | Password for the inline certificate (if provided). |
| [`defaultSslBinding`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<defaultsslbinding) | bool | Set this binding as default for the endpoint. |
| [`keyVaultId`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<keyvaultid) | string | Key Vault secret ID for the certificate. |
| [`negotiateClientCertificate`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<negotiateclientcertificate) | bool | Negotiate client certificate on TLS. |
| [`sslKeyvaultIdentityClientId`](#parameter-apimdefinitionhostnameconfigurationproxy>any_other_property<sslkeyvaultidentityclientid) | string | Client ID of the Key Vault identity used for SSL. |

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.hostName`

Host name to bind.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.certificate`

Inline certificate as base64.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.certificatePassword`

Password for the inline certificate (if provided).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.defaultSslBinding`

Set this binding as default for the endpoint.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.keyVaultId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.negotiateClientCertificate`

Negotiate client certificate on TLS.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.proxy.>Any_other_property<.sslKeyvaultIdentityClientId`

Client ID of the Key Vault identity used for SSL.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.scm`

Hostname configuration map for the SCM endpoint.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<) | object | Arbitrary key for each hostname binding. |

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<`

Arbitrary key for each hostname binding.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`hostName`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<hostname) | string | Host name to bind. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificate`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<certificate) | string | Inline certificate as base64. |
| [`certificatePassword`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<certificatepassword) | string | Password for the inline certificate (if provided). |
| [`defaultSslBinding`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<defaultsslbinding) | bool | Set this binding as default for the endpoint. |
| [`keyVaultId`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<keyvaultid) | string | Key Vault secret ID for the certificate. |
| [`negotiateClientCertificate`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<negotiateclientcertificate) | bool | Negotiate client certificate on TLS. |
| [`sslKeyvaultIdentityClientId`](#parameter-apimdefinitionhostnameconfigurationscm>any_other_property<sslkeyvaultidentityclientid) | string | Client ID of the Key Vault identity used for SSL. |

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.hostName`

Host name to bind.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.certificate`

Inline certificate as base64.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.certificatePassword`

Password for the inline certificate (if provided).

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.defaultSslBinding`

Set this binding as default for the endpoint.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.keyVaultId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.negotiateClientCertificate`

Negotiate client certificate on TLS.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.hostnameConfiguration.scm.>Any_other_property<.sslKeyvaultIdentityClientId`

Client ID of the Key Vault identity used for SSL.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.minApiVersion`

Minimum ARM API version to use for APIM operations.

- Required: No
- Type: string

### Parameter: `apimDefinition.name`

API Management service name.

- Required: No
- Type: string

### Parameter: `apimDefinition.notificationSenderEmail`

Sender email address used by APIM system notifications.

- Required: No
- Type: string

### Parameter: `apimDefinition.protocols`

Protocol options.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enableHttp2`](#parameter-apimdefinitionprotocolsenablehttp2) | bool | Enable HTTP/2 for API traffic. |

### Parameter: `apimDefinition.protocols.enableHttp2`

Enable HTTP/2 for API traffic.

- Required: Yes
- Type: bool

### Parameter: `apimDefinition.roleAssignments`

Role assignments to create on the API Management service.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-apimdefinitionroleassignmentsprincipalid) | string | Principal ID to assign. |
| [`principalType`](#parameter-apimdefinitionroleassignmentsprincipaltype) | string | Principal type of the assignment. |
| [`roleDefinitionIdOrName`](#parameter-apimdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-apimdefinitionroleassignmentscondition) | string | Condition for the assignment. |
| [`conditionVersion`](#parameter-apimdefinitionroleassignmentsconditionversion) | string | Condition version (2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-apimdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-apimdefinitionroleassignmentsdescription) | string | Description of the assignment. |
| [`name`](#parameter-apimdefinitionroleassignmentsname) | string | Name of the role assignment. |

### Parameter: `apimDefinition.roleAssignments.principalId`

Principal ID to assign.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.roleAssignments.principalType`

Principal type of the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `apimDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or name.

- Required: Yes
- Type: string

### Parameter: `apimDefinition.roleAssignments.condition`

Condition for the assignment.

- Required: No
- Type: string

### Parameter: `apimDefinition.roleAssignments.conditionVersion`

Condition version (2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `apimDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `apimDefinition.roleAssignments.description`

Description of the assignment.

- Required: No
- Type: string

### Parameter: `apimDefinition.roleAssignments.name`

Name of the role assignment.

- Required: No
- Type: string

### Parameter: `apimDefinition.skuRoot`

SKU for API Management (Developer/Basic/Standard/Premium/Consumption/V2 variants).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'BasicV2'
    'Consumption'
    'Developer'
    'Premium'
    'Standard'
    'StandardV2'
  ]
  ```

### Parameter: `apimDefinition.tags`

Tags to apply to the API Management service.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-apimdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `apimDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition`

 App Configuration store settings (used when App Configuration is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      localAuthEnabled: false
      name: ''
      purgeProtectionEnabled: true
      roleAssignments: []
      sku: 'standard'
      softDeleteRetentionInDays: 7
      tags: {}
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dataPlaneProxy`](#parameter-appconfigurationdefinitiondataplaneproxy) | object | Data plane proxy configuration (auth and Private Link delegation). |
| [`localAuthEnabled`](#parameter-appconfigurationdefinitionlocalauthenabled) | bool | Enable local (access keys) authentication. |
| [`name`](#parameter-appconfigurationdefinitionname) | string | App Configuration store name. |
| [`purgeProtectionEnabled`](#parameter-appconfigurationdefinitionpurgeprotectionenabled) | bool | Enable purge protection. |
| [`roleAssignments`](#parameter-appconfigurationdefinitionroleassignments) | array | Role assignments to create on the store. |
| [`sku`](#parameter-appconfigurationdefinitionsku) | string | SKU for App Configuration. |
| [`softDeleteRetentionInDays`](#parameter-appconfigurationdefinitionsoftdeleteretentionindays) | int | Soft delete retention (days). |
| [`tags`](#parameter-appconfigurationdefinitiontags) | object | Tags to apply to the App Configuration store. |

### Parameter: `appConfigurationDefinition.dataPlaneProxy`

Data plane proxy configuration (auth and Private Link delegation).

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authenticationMode`](#parameter-appconfigurationdefinitiondataplaneproxyauthenticationmode) | string | Authentication mode for data plane proxy. |
| [`privateLinkDelegation`](#parameter-appconfigurationdefinitiondataplaneproxyprivatelinkdelegation) | string | Private Link delegation for data plane proxy. |

### Parameter: `appConfigurationDefinition.dataPlaneProxy.authenticationMode`

Authentication mode for data plane proxy.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.dataPlaneProxy.privateLinkDelegation`

Private Link delegation for data plane proxy.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.localAuthEnabled`

Enable local (access keys) authentication.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.name`

App Configuration store name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.purgeProtectionEnabled`

Enable purge protection.

- Required: No
- Type: bool

### Parameter: `appConfigurationDefinition.roleAssignments`

Role assignments to create on the store.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-appconfigurationdefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-appconfigurationdefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-appconfigurationdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-appconfigurationdefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-appconfigurationdefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-appconfigurationdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-appconfigurationdefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-appconfigurationdefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `appConfigurationDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `appConfigurationDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `appConfigurationDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `appConfigurationDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.sku`

SKU for App Configuration.

- Required: No
- Type: string

### Parameter: `appConfigurationDefinition.softDeleteRetentionInDays`

Soft delete retention (days).

- Required: No
- Type: int

### Parameter: `appConfigurationDefinition.tags`

Tags to apply to the App Configuration store.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appconfigurationdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `appConfigurationDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition`

 Application Gateway configuration (used when AGW is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      authenticationCertificate: {}
      autoscaleConfiguration: {
        maxCapacity: 10
        minCapacity: 2
      }
      backendAddressPools: {
        defaultPool: {
          fqdns: []
          ipAddresses: []
          name: 'defaultPool'
        }
      }
      backendHttpSettings: {
        defaultSetting: {
          affinityCookieName: ''
          authenticationCertificate: []
          connectionDraining: {
            drainTimeoutSec: 0
            enabled: false
          }
          cookieBasedAffinity: 'Disabled'
          hostName: ''
          name: 'defaultSetting'
          path: ''
          pickHostNameFromBackendAddress: false
          port: 80
          probeName: ''
          protocol: 'Http'
          requestTimeout: 30
          trustedRootCertificateNames: []
        }
      }
      createPublicFrontend: true
      frontendPorts: {
        port80: {
          name: 'port80'
          port: 80
        }
      }
      http2Enable: true
      httpListeners: {
        defaultListener: {
          customErrorConfiguration: []
          firewallPolicyId: ''
          frontendIpConfigurationName: 'privateFrontend'
          frontendPortName: 'port80'
          hostName: ''
          hostNames: []
          name: 'defaultListener'
          requireSni: false
          sslCertificateName: ''
          sslProfileName: ''
        }
      }
      name: ''
      probeConfigurations: {}
      redirectConfiguration: {
        defaultRedirect: {
          includePath: true
          includeQueryString: true
          name: 'defaultRedirect'
          redirectType: 'Permanent'
          targetListenerName: ''
          targetUrl: 'https://example.com'
        }
      }
      requestRoutingRules: {
        defaultRule: {
          backendAddressPoolName: ''
          backendHttpSettingsName: ''
          httpListenerName: 'defaultListener'
          name: 'defaultRule'
          priority: 100
          redirectConfigurationName: 'defaultRedirect'
          rewriteRuleSetName: ''
          ruleType: 'Basic'
          urlPathMapName: ''
        }
      }
      rewriteRuleSet: {}
      roleAssignments: []
      sku: {
        capacity: 0
        name: 'WAF_v2'
        tier: 'WAF_v2'
      }
      sslCertificates: {}
      sslPolicy: {
        cipherSuites: []
        disabledProtocols: []
        minProtocolVersion: 'TLSv1_2'
        policyName: ''
        policyType: 'Custom'
      }
      sslProfile: {}
      tags: {}
      trustedClientCertificate: {}
      trustedRootCertificate: {}
      urlPathMapConfigurations: {}
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`autoscaleConfiguration`](#parameter-appgatewaydefinitionautoscaleconfiguration) | object | Autoscale configuration (min/max capacity). |
| [`backendAddressPools`](#parameter-appgatewaydefinitionbackendaddresspools) | object | Backend address pools (FQDNs/IPs). |
| [`backendHttpSettings`](#parameter-appgatewaydefinitionbackendhttpsettings) | object | Backend HTTP settings collection. |
| [`frontendPorts`](#parameter-appgatewaydefinitionfrontendports) | object | Frontend ports to expose. |
| [`http2Enable`](#parameter-appgatewaydefinitionhttp2enable) | bool | Enable HTTP/2 on the gateway. |
| [`httpListeners`](#parameter-appgatewaydefinitionhttplisteners) | object | HTTP listeners configuration. |
| [`probeConfigurations`](#parameter-appgatewaydefinitionprobeconfigurations) | object | Health probe configurations. |
| [`redirectConfiguration`](#parameter-appgatewaydefinitionredirectconfiguration) | object | Redirect configurations. |
| [`requestRoutingRules`](#parameter-appgatewaydefinitionrequestroutingrules) | object | Request routing rules. |
| [`sku`](#parameter-appgatewaydefinitionsku) | object | SKU definition (name/tier/capacity). |
| [`sslPolicy`](#parameter-appgatewaydefinitionsslpolicy) | object | SSL policy (protocols/ciphers). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authenticationCertificate`](#parameter-appgatewaydefinitionauthenticationcertificate) | object | Authentication certificates to attach to the gateway. |
| [`createPublicFrontend`](#parameter-appgatewaydefinitioncreatepublicfrontend) | bool | Create public frontend and public IP for the gateway. |
| [`name`](#parameter-appgatewaydefinitionname) | string | Application Gateway name. |
| [`rewriteRuleSet`](#parameter-appgatewaydefinitionrewriteruleset) | object | Rewrite rule sets. |
| [`roleAssignments`](#parameter-appgatewaydefinitionroleassignments) | array | Role assignments to create on the gateway. |
| [`sslCertificates`](#parameter-appgatewaydefinitionsslcertificates) | object | SSL certificates. |
| [`sslProfile`](#parameter-appgatewaydefinitionsslprofile) | object | SSL profiles. |
| [`tags`](#parameter-appgatewaydefinitiontags) | object | Tags to apply to the Application Gateway. |
| [`trustedClientCertificate`](#parameter-appgatewaydefinitiontrustedclientcertificate) | object | Trusted client certificates. |
| [`trustedRootCertificate`](#parameter-appgatewaydefinitiontrustedrootcertificate) | object | Trusted root certificates. |
| [`urlPathMapConfigurations`](#parameter-appgatewaydefinitionurlpathmapconfigurations) | object | URL path map configurations. |

### Parameter: `appGatewayDefinition.autoscaleConfiguration`

Autoscale configuration (min/max capacity).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`maxCapacity`](#parameter-appgatewaydefinitionautoscaleconfigurationmaxcapacity) | int | Maximum autoscale capacity. |
| [`minCapacity`](#parameter-appgatewaydefinitionautoscaleconfigurationmincapacity) | int | Minimum autoscale capacity. |

### Parameter: `appGatewayDefinition.autoscaleConfiguration.maxCapacity`

Maximum autoscale capacity.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.autoscaleConfiguration.minCapacity`

Minimum autoscale capacity.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.backendAddressPools`

Backend address pools (FQDNs/IPs).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionbackendaddresspools>any_other_property<) | object | Arbitrary key for each backend pool. |

### Parameter: `appGatewayDefinition.backendAddressPools.>Any_other_property<`

Arbitrary key for each backend pool.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionbackendaddresspools>any_other_property<name) | string | Pool name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`fqdns`](#parameter-appgatewaydefinitionbackendaddresspools>any_other_property<fqdns) | array | Backend FQDNs. |
| [`ipAddresses`](#parameter-appgatewaydefinitionbackendaddresspools>any_other_property<ipaddresses) | array | Backend IP addresses. |

### Parameter: `appGatewayDefinition.backendAddressPools.>Any_other_property<.name`

Pool name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendAddressPools.>Any_other_property<.fqdns`

Backend FQDNs.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.backendAddressPools.>Any_other_property<.ipAddresses`

Backend IP addresses.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.backendHttpSettings`

Backend HTTP settings collection.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<) | object | Arbitrary key for each backend HTTP setting. |

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<`

Arbitrary key for each backend HTTP setting.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`cookieBasedAffinity`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<cookiebasedaffinity) | string | Cookie-based affinity mode. |
| [`name`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<name) | string | Setting name. |
| [`port`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<port) | int | Backend port for the setting. |
| [`protocol`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<protocol) | string | Protocol (Http/Https). |
| [`requestTimeout`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<requesttimeout) | int | Request timeout in seconds. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`affinityCookieName`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<affinitycookiename) | string | Custom affinity cookie name. |
| [`authenticationCertificate`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<authenticationcertificate) | array | Authentication certificate names to present to backend. |
| [`connectionDraining`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<connectiondraining) | object | Connection draining settings (enable and drain timeout in seconds). |
| [`hostName`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<hostname) | string | Host header to use when forwarding. |
| [`path`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<path) | string | Path to append when forwarding. |
| [`pickHostNameFromBackendAddress`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<pickhostnamefrombackendaddress) | bool | Use backend address as host header (true/false). |
| [`probeName`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<probename) | string | Probe name to associate. |
| [`trustedRootCertificateNames`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<trustedrootcertificatenames) | array | Trusted root certificate names to use. |

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.cookieBasedAffinity`

Cookie-based affinity mode.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.name`

Setting name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.port`

Backend port for the setting.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.protocol`

Protocol (Http/Https).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.requestTimeout`

Request timeout in seconds.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.affinityCookieName`

Custom affinity cookie name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.authenticationCertificate`

Authentication certificate names to present to backend.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.connectionDraining`

Connection draining settings (enable and drain timeout in seconds).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`drainTimeoutSec`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<connectiondrainingdraintimeoutsec) | int | Drain timeout in seconds before terminating connections. |
| [`enabled`](#parameter-appgatewaydefinitionbackendhttpsettings>any_other_property<connectiondrainingenabled) | bool | Enable connection draining for backend HTTP settings. |

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.connectionDraining.drainTimeoutSec`

Drain timeout in seconds before terminating connections.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.connectionDraining.enabled`

Enable connection draining for backend HTTP settings.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.hostName`

Host header to use when forwarding.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.path`

Path to append when forwarding.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.pickHostNameFromBackendAddress`

Use backend address as host header (true/false).

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.probeName`

Probe name to associate.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.backendHttpSettings.>Any_other_property<.trustedRootCertificateNames`

Trusted root certificate names to use.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.frontendPorts`

Frontend ports to expose.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionfrontendports>any_other_property<) | object | Arbitrary key for each frontend port. |

### Parameter: `appGatewayDefinition.frontendPorts.>Any_other_property<`

Arbitrary key for each frontend port.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionfrontendports>any_other_property<name) | string | Port name. |
| [`port`](#parameter-appgatewaydefinitionfrontendports>any_other_property<port) | int | Port number. |

### Parameter: `appGatewayDefinition.frontendPorts.>Any_other_property<.name`

Port name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.frontendPorts.>Any_other_property<.port`

Port number.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.http2Enable`

Enable HTTP/2 on the gateway.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.httpListeners`

HTTP listeners configuration.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<) | object | Arbitrary key for each HTTP listener. |

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<`

Arbitrary key for each HTTP listener.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`frontendPortName`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<frontendportname) | string | Name of the frontend port to use. |
| [`name`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<name) | string | Listener name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`customErrorConfiguration`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<customerrorconfiguration) | array | Custom error configuration entries. |
| [`firewallPolicyId`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<firewallpolicyid) | string | Resource ID of the associated WAF policy. |
| [`frontendIpConfigurationName`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<frontendipconfigurationname) | string | Name of the frontend IP configuration to use. |
| [`hostName`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<hostname) | string | Host name for the listener. |
| [`hostNames`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<hostnames) | array | Multiple host names for the listener. |
| [`requireSni`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<requiresni) | bool | Require SNI for TLS. |
| [`sslCertificateName`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<sslcertificatename) | string | SSL certificate name to bind to the listener. |
| [`sslProfileName`](#parameter-appgatewaydefinitionhttplisteners>any_other_property<sslprofilename) | string | SSL profile name to use. |

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.frontendPortName`

Name of the frontend port to use.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.name`

Listener name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.customErrorConfiguration`

Custom error configuration entries.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.firewallPolicyId`

Resource ID of the associated WAF policy.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.frontendIpConfigurationName`

Name of the frontend IP configuration to use.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.hostName`

Host name for the listener.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.hostNames`

Multiple host names for the listener.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.requireSni`

Require SNI for TLS.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.sslCertificateName`

SSL certificate name to bind to the listener.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.httpListeners.>Any_other_property<.sslProfileName`

SSL profile name to use.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.probeConfigurations`

Health probe configurations.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<) | object | Arbitrary key for each probe configuration. |

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<`

Arbitrary key for each probe configuration.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`interval`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<interval) | int | Probe interval in seconds. |
| [`name`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<name) | string | Probe name. |
| [`protocol`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<protocol) | string | Protocol for the probe (Http/Https/Tcp). |
| [`timeout`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<timeout) | int | Probe timeout in seconds. |
| [`unhealthyThreshold`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<unhealthythreshold) | int | Consecutive failures before marking unhealthy. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`host`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<host) | string | Host header to send in probe requests. |
| [`match`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<match) | object | Match conditions for HTTP probe response. |
| [`minimumServers`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<minimumservers) | int | Minimum servers that must be healthy. |
| [`path`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<path) | string | Path to probe (for HTTP/S). |
| [`pickHostNameFromBackendHttpSettings`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<pickhostnamefrombackendhttpsettings) | bool | Use host name from backend HTTP settings. |
| [`port`](#parameter-appgatewaydefinitionprobeconfigurations>any_other_property<port) | int | Backend port to probe. |

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.interval`

Probe interval in seconds.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.name`

Probe name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.protocol`

Protocol for the probe (Http/Https/Tcp).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.timeout`

Probe timeout in seconds.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.unhealthyThreshold`

Consecutive failures before marking unhealthy.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.host`

Host header to send in probe requests.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.match`

Match conditions for HTTP probe response.

- Required: Yes
- Type: object

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.minimumServers`

Minimum servers that must be healthy.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.path`

Path to probe (for HTTP/S).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.pickHostNameFromBackendHttpSettings`

Use host name from backend HTTP settings.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.probeConfigurations.>Any_other_property<.port`

Backend port to probe.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.redirectConfiguration`

Redirect configurations.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<) | object | Arbitrary key for each redirect configuration. |

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<`

Arbitrary key for each redirect configuration.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<name) | string | Redirect configuration name. |
| [`redirectType`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<redirecttype) | string | Redirect type (Permanent, Found, Temporary, SeeOther). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`includePath`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<includepath) | bool | Include the path in the redirect. |
| [`includeQueryString`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<includequerystring) | bool | Include the query string in the redirect. |
| [`targetListenerName`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<targetlistenername) | string | Target listener name for listener redirect. |
| [`targetUrl`](#parameter-appgatewaydefinitionredirectconfiguration>any_other_property<targeturl) | string | Target URL for external redirect. |

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<.name`

Redirect configuration name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<.redirectType`

Redirect type (Permanent, Found, Temporary, SeeOther).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<.includePath`

Include the path in the redirect.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<.includeQueryString`

Include the query string in the redirect.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<.targetListenerName`

Target listener name for listener redirect.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.redirectConfiguration.>Any_other_property<.targetUrl`

Target URL for external redirect.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules`

Request routing rules.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<) | object | Arbitrary key for each routing rule. |

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<`

Arbitrary key for each routing rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`httpListenerName`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<httplistenername) | string | HTTP listener name to attach to. |
| [`name`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<name) | string | Rule name. |
| [`ruleType`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<ruletype) | string | Rule type (Basic or PathBasedRouting). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`backendAddressPoolName`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<backendaddresspoolname) | string | Backend address pool name to route to. |
| [`backendHttpSettingsName`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<backendhttpsettingsname) | string | Backend HTTP settings name to use. |
| [`priority`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<priority) | int | Rule priority (1-20000). |
| [`redirectConfigurationName`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<redirectconfigurationname) | string | Redirect configuration name to use. |
| [`rewriteRuleSetName`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<rewriterulesetname) | string | Rewrite rule set name to apply. |
| [`urlPathMapName`](#parameter-appgatewaydefinitionrequestroutingrules>any_other_property<urlpathmapname) | string | URL path map name for path-based rules. |

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.httpListenerName`

HTTP listener name to attach to.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.name`

Rule name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.ruleType`

Rule type (Basic or PathBasedRouting).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.backendAddressPoolName`

Backend address pool name to route to.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.backendHttpSettingsName`

Backend HTTP settings name to use.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.priority`

Rule priority (1-20000).

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.redirectConfigurationName`

Redirect configuration name to use.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.rewriteRuleSetName`

Rewrite rule set name to apply.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.requestRoutingRules.>Any_other_property<.urlPathMapName`

URL path map name for path-based rules.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sku`

SKU definition (name/tier/capacity).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`capacity`](#parameter-appgatewaydefinitionskucapacity) | int | Instance capacity when autoscale is disabled. |
| [`name`](#parameter-appgatewaydefinitionskuname) | string | SKU name (e.g., WAF_v2). |
| [`tier`](#parameter-appgatewaydefinitionskutier) | string | SKU tier (e.g., WAF_v2). |

### Parameter: `appGatewayDefinition.sku.capacity`

Instance capacity when autoscale is disabled.

- Required: Yes
- Type: int

### Parameter: `appGatewayDefinition.sku.name`

SKU name (e.g., WAF_v2).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sku.tier`

SKU tier (e.g., WAF_v2).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslPolicy`

SSL policy (protocols/ciphers).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`cipherSuites`](#parameter-appgatewaydefinitionsslpolicyciphersuites) | array | Allowed cipher suites. |
| [`disabledProtocols`](#parameter-appgatewaydefinitionsslpolicydisabledprotocols) | array | Disabled protocol versions. |
| [`minProtocolVersion`](#parameter-appgatewaydefinitionsslpolicyminprotocolversion) | string | Minimum allowed TLS protocol version. |
| [`policyName`](#parameter-appgatewaydefinitionsslpolicypolicyname) | string | Policy name if using a predefined policy. |
| [`policyType`](#parameter-appgatewaydefinitionsslpolicypolicytype) | string | Policy type (Predefined/Custom). |

### Parameter: `appGatewayDefinition.sslPolicy.cipherSuites`

Allowed cipher suites.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.sslPolicy.disabledProtocols`

Disabled protocol versions.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.sslPolicy.minProtocolVersion`

Minimum allowed TLS protocol version.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslPolicy.policyName`

Policy name if using a predefined policy.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslPolicy.policyType`

Policy type (Predefined/Custom).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.authenticationCertificate`

Authentication certificates to attach to the gateway.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionauthenticationcertificate>any_other_property<) | object | Arbitrary key for each authentication certificate. |

### Parameter: `appGatewayDefinition.authenticationCertificate.>Any_other_property<`

Arbitrary key for each authentication certificate.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`data`](#parameter-appgatewaydefinitionauthenticationcertificate>any_other_property<data) | string | Certificate data. |
| [`name`](#parameter-appgatewaydefinitionauthenticationcertificate>any_other_property<name) | string | Certificate name. |

### Parameter: `appGatewayDefinition.authenticationCertificate.>Any_other_property<.data`

Certificate data.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.authenticationCertificate.>Any_other_property<.name`

Certificate name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.createPublicFrontend`

Create public frontend and public IP for the gateway.

- Required: No
- Type: bool

### Parameter: `appGatewayDefinition.name`

Application Gateway name.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.rewriteRuleSet`

Rewrite rule sets.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionrewriteruleset>any_other_property<) | object | Arbitrary key for each rewrite rule set. |

### Parameter: `appGatewayDefinition.rewriteRuleSet.>Any_other_property<`

Arbitrary key for each rewrite rule set.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionrewriteruleset>any_other_property<name) | string | Rewrite rule set name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`rewriteRules`](#parameter-appgatewaydefinitionrewriteruleset>any_other_property<rewriterules) | object | Rewrite rules contained in this set. |

### Parameter: `appGatewayDefinition.rewriteRuleSet.>Any_other_property<.name`

Rewrite rule set name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.rewriteRuleSet.>Any_other_property<.rewriteRules`

Rewrite rules contained in this set.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionrewriteruleset>any_other_property<rewriterules>any_other_property<) | object | Arbitrary key for each rewrite rule entry. |

### Parameter: `appGatewayDefinition.rewriteRuleSet.>Any_other_property<.rewriteRules.>Any_other_property<`

Arbitrary key for each rewrite rule entry.

- Required: Yes
- Type: object

### Parameter: `appGatewayDefinition.roleAssignments`

Role assignments to create on the gateway.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-appgatewaydefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-appgatewaydefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-appgatewaydefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-appgatewaydefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-appgatewaydefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-appgatewaydefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-appgatewaydefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-appgatewaydefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `appGatewayDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `appGatewayDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `appGatewayDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `appGatewayDefinition.sslCertificates`

SSL certificates.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionsslcertificates>any_other_property<) | object | Arbitrary key for each SSL certificate. |

### Parameter: `appGatewayDefinition.sslCertificates.>Any_other_property<`

Arbitrary key for each SSL certificate.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionsslcertificates>any_other_property<name) | string | Certificate name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`data`](#parameter-appgatewaydefinitionsslcertificates>any_other_property<data) | string | Base64-encoded PFX certificate data. |
| [`keyVaultSecretId`](#parameter-appgatewaydefinitionsslcertificates>any_other_property<keyvaultsecretid) | string | Key Vault secret ID for the certificate. |
| [`password`](#parameter-appgatewaydefinitionsslcertificates>any_other_property<password) | string | PFX password (if data provided). |

### Parameter: `appGatewayDefinition.sslCertificates.>Any_other_property<.name`

Certificate name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslCertificates.>Any_other_property<.data`

Base64-encoded PFX certificate data.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslCertificates.>Any_other_property<.keyVaultSecretId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslCertificates.>Any_other_property<.password`

PFX password (if data provided).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslProfile`

SSL profiles.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionsslprofile>any_other_property<) | object | Arbitrary key for each SSL profile. |

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<`

Arbitrary key for each SSL profile.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionsslprofile>any_other_property<name) | string | SSL profile name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`sslPolicy`](#parameter-appgatewaydefinitionsslprofile>any_other_property<sslpolicy) | object | SSL policy for the profile. |
| [`trustedClientCertificateNames`](#parameter-appgatewaydefinitionsslprofile>any_other_property<trustedclientcertificatenames) | array | Trusted client certificate names to require. |
| [`verifyClientCertificateRevocation`](#parameter-appgatewaydefinitionsslprofile>any_other_property<verifyclientcertificaterevocation) | string | Client certificate revocation check setting. |
| [`verifyClientCertIssuerDn`](#parameter-appgatewaydefinitionsslprofile>any_other_property<verifyclientcertissuerdn) | bool | Verify client certificate issuer DN. |

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.name`

SSL profile name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.sslPolicy`

SSL policy for the profile.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`cipherSuites`](#parameter-appgatewaydefinitionsslprofile>any_other_property<sslpolicyciphersuites) | array | Allowed cipher suites. |
| [`disabledProtocols`](#parameter-appgatewaydefinitionsslprofile>any_other_property<sslpolicydisabledprotocols) | array | Disabled protocol versions. |
| [`minProtocolVersion`](#parameter-appgatewaydefinitionsslprofile>any_other_property<sslpolicyminprotocolversion) | string | Minimum TLS version. |
| [`policyName`](#parameter-appgatewaydefinitionsslprofile>any_other_property<sslpolicypolicyname) | string | Predefined policy name. |
| [`policyType`](#parameter-appgatewaydefinitionsslprofile>any_other_property<sslpolicypolicytype) | string | Policy type (Predefined/Custom). |

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.sslPolicy.cipherSuites`

Allowed cipher suites.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.sslPolicy.disabledProtocols`

Disabled protocol versions.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.sslPolicy.minProtocolVersion`

Minimum TLS version.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.sslPolicy.policyName`

Predefined policy name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.sslPolicy.policyType`

Policy type (Predefined/Custom).

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.trustedClientCertificateNames`

Trusted client certificate names to require.

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.verifyClientCertificateRevocation`

Client certificate revocation check setting.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.sslProfile.>Any_other_property<.verifyClientCertIssuerDn`

Verify client certificate issuer DN.

- Required: Yes
- Type: bool

### Parameter: `appGatewayDefinition.tags`

Tags to apply to the Application Gateway.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `appGatewayDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.trustedClientCertificate`

Trusted client certificates.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitiontrustedclientcertificate>any_other_property<) | object | Arbitrary key for each trusted client certificate. |

### Parameter: `appGatewayDefinition.trustedClientCertificate.>Any_other_property<`

Arbitrary key for each trusted client certificate.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`data`](#parameter-appgatewaydefinitiontrustedclientcertificate>any_other_property<data) | string | Base64-encoded certificate data. |
| [`name`](#parameter-appgatewaydefinitiontrustedclientcertificate>any_other_property<name) | string | Certificate name. |

### Parameter: `appGatewayDefinition.trustedClientCertificate.>Any_other_property<.data`

Base64-encoded certificate data.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.trustedClientCertificate.>Any_other_property<.name`

Certificate name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.trustedRootCertificate`

Trusted root certificates.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitiontrustedrootcertificate>any_other_property<) | object | Arbitrary key for each trusted root certificate. |

### Parameter: `appGatewayDefinition.trustedRootCertificate.>Any_other_property<`

Arbitrary key for each trusted root certificate.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitiontrustedrootcertificate>any_other_property<name) | string | Certificate name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`data`](#parameter-appgatewaydefinitiontrustedrootcertificate>any_other_property<data) | string | Base64-encoded certificate data. |
| [`keyVaultSecretId`](#parameter-appgatewaydefinitiontrustedrootcertificate>any_other_property<keyvaultsecretid) | string | Key Vault secret ID for the certificate. |

### Parameter: `appGatewayDefinition.trustedRootCertificate.>Any_other_property<.name`

Certificate name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.trustedRootCertificate.>Any_other_property<.data`

Base64-encoded certificate data.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.trustedRootCertificate.>Any_other_property<.keyVaultSecretId`

Key Vault secret ID for the certificate.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations`

URL path map configurations.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<) | object | Arbitrary key for each URL path map configuration. |

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<`

Arbitrary key for each URL path map configuration.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<name) | string | URL path map name. |
| [`pathRules`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules) | object | Path rules for this map. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`defaultBackendAddressPoolName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<defaultbackendaddresspoolname) | string | Default backend address pool name. |
| [`defaultBackendHttpSettingsName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<defaultbackendhttpsettingsname) | string | Default backend HTTP settings name. |
| [`defaultRedirectConfigurationName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<defaultredirectconfigurationname) | string | Default redirect configuration name. |
| [`defaultRewriteRuleSetName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<defaultrewriterulesetname) | string | Default rewrite rule set name. |

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.name`

URL path map name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules`

Path rules for this map.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<) | object | Arbitrary key for each path rule. |

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<`

Arbitrary key for each path rule.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<name) | string | Path rule name. |
| [`paths`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<paths) | array | Paths to match (e.g., /images/*). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`backendAddressPoolName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<backendaddresspoolname) | string | Backend address pool name for the rule. |
| [`backendHttpSettingsName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<backendhttpsettingsname) | string | Backend HTTP settings name for the rule. |
| [`redirectConfigurationName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<redirectconfigurationname) | string | Redirect configuration name for the rule. |
| [`rewriteRuleSetName`](#parameter-appgatewaydefinitionurlpathmapconfigurations>any_other_property<pathrules>any_other_property<rewriterulesetname) | string | Rewrite rule set name for the rule. |

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<.name`

Path rule name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<.paths`

Paths to match (e.g., /images/*).

- Required: Yes
- Type: array

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<.backendAddressPoolName`

Backend address pool name for the rule.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<.backendHttpSettingsName`

Backend HTTP settings name for the rule.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<.redirectConfigurationName`

Redirect configuration name for the rule.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.pathRules.>Any_other_property<.rewriteRuleSetName`

Rewrite rule set name for the rule.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.defaultBackendAddressPoolName`

Default backend address pool name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.defaultBackendHttpSettingsName`

Default backend HTTP settings name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.defaultRedirectConfigurationName`

Default redirect configuration name.

- Required: Yes
- Type: string

### Parameter: `appGatewayDefinition.urlPathMapConfigurations.>Any_other_property<.defaultRewriteRuleSetName`

Default rewrite rule set name.

- Required: Yes
- Type: string

### Parameter: `appInsightsDefinition`

 Application Insights configuration (used when App Insights is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      applicationType: 'web'
      disableIpMasking: false
      kind: 'web'
      name: ''
      tags: {}
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`applicationType`](#parameter-appinsightsdefinitionapplicationtype) | string | Application type for Insights (e.g., web). |
| [`kind`](#parameter-appinsightsdefinitionkind) | string | Resource kind. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`disableIpMasking`](#parameter-appinsightsdefinitiondisableipmasking) | bool | Disable IP masking (true) or keep enabled (false). |
| [`name`](#parameter-appinsightsdefinitionname) | string | Application Insights resource name. |
| [`tags`](#parameter-appinsightsdefinitiontags) | object | Tags to apply to the component. |

### Parameter: `appInsightsDefinition.applicationType`

Application type for Insights (e.g., web).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'other'
    'web'
  ]
  ```

### Parameter: `appInsightsDefinition.kind`

Resource kind.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'other'
    'web'
  ]
  ```

### Parameter: `appInsightsDefinition.disableIpMasking`

Disable IP masking (true) or keep enabled (false).

- Required: No
- Type: bool

### Parameter: `appInsightsDefinition.name`

Application Insights resource name.

- Required: No
- Type: string

### Parameter: `appInsightsDefinition.tags`

Tags to apply to the component.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-appinsightsdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `appInsightsDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `bastionKeyVaultDefinition`

 Dedicated Key Vault for JumpVM secrets (public network).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      roleAssignments: []
      sku: 'standard'
      tags: {}
      tenantId: '[subscription().tenantId]'
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-bastionkeyvaultdefinitionname) | string | Key Vault name. |
| [`roleAssignments`](#parameter-bastionkeyvaultdefinitionroleassignments) | array | Role assignments to create on the vault. |
| [`sku`](#parameter-bastionkeyvaultdefinitionsku) | string | Key Vault SKU (e.g., standard, premium). |
| [`tags`](#parameter-bastionkeyvaultdefinitiontags) | object | Tags to apply to the Key Vault. |
| [`tenantId`](#parameter-bastionkeyvaultdefinitiontenantid) | string | AAD tenant ID for the vault. |

### Parameter: `bastionKeyVaultDefinition.name`

Key Vault name.

- Required: No
- Type: string

### Parameter: `bastionKeyVaultDefinition.roleAssignments`

Role assignments to create on the vault.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-bastionkeyvaultdefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-bastionkeyvaultdefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-bastionkeyvaultdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-bastionkeyvaultdefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-bastionkeyvaultdefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-bastionkeyvaultdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-bastionkeyvaultdefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-bastionkeyvaultdefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `bastionKeyVaultDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `bastionKeyVaultDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `bastionKeyVaultDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `bastionKeyVaultDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `bastionKeyVaultDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `bastionKeyVaultDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `bastionKeyVaultDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `bastionKeyVaultDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `bastionKeyVaultDefinition.sku`

Key Vault SKU (e.g., standard, premium).

- Required: No
- Type: string

### Parameter: `bastionKeyVaultDefinition.tags`

Tags to apply to the Key Vault.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-bastionkeyvaultdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `bastionKeyVaultDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `bastionKeyVaultDefinition.tenantId`

AAD tenant ID for the vault.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition`

 Container App Environment configuration (used when Container Apps are deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      enableDiagnosticSettings: true
      internalLoadBalancerEnabled: true
      logAnalyticsWorkspaceResourceId: ''
      name: ''
      roleAssignments: []
      subnetName: 'aca-environment-subnet'
      tags: {}
      userAssignedManagedIdentityIds: []
      workloadProfiles: [
        {
          name: 'Consumption'
          workloadProfileType: 'Consumption'
        }
        {
          maximumCount: 3
          minimumCount: 1
          name: 'default'
          workloadProfileType: 'D4'
        }
      ]
      zoneRedundancyEnabled: true
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`internalLoadBalancerEnabled`](#parameter-containerappenvdefinitioninternalloadbalancerenabled) | bool | Enable internal load balancer (true) to make the environment internal. |
| [`userAssignedManagedIdentityIds`](#parameter-containerappenvdefinitionuserassignedmanagedidentityids) | array | List of user-assigned managed identity resource IDs to attach (can be empty). |
| [`workloadProfiles`](#parameter-containerappenvdefinitionworkloadprofiles) | array | Workload profiles for the environment. |
| [`zoneRedundancyEnabled`](#parameter-containerappenvdefinitionzoneredundancyenabled) | bool | Enable zone redundancy for the environment. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enableDiagnosticSettings`](#parameter-containerappenvdefinitionenablediagnosticsettings) | bool | Enable diagnostic settings for the environment. |
| [`logAnalyticsWorkspaceResourceId`](#parameter-containerappenvdefinitionloganalyticsworkspaceresourceid) | string | Resource ID of a Log Analytics workspace for diagnostics. |
| [`name`](#parameter-containerappenvdefinitionname) | string | Container Apps Environment name. |
| [`roleAssignments`](#parameter-containerappenvdefinitionroleassignments) | array | Role assignments to create on the environment. |
| [`subnetName`](#parameter-containerappenvdefinitionsubnetname) | string | Subnet name where the environment is deployed when internal. |
| [`tags`](#parameter-containerappenvdefinitiontags) | object | Tags to apply to the environment. |

### Parameter: `containerAppEnvDefinition.internalLoadBalancerEnabled`

Enable internal load balancer (true) to make the environment internal.

- Required: Yes
- Type: bool

### Parameter: `containerAppEnvDefinition.userAssignedManagedIdentityIds`

List of user-assigned managed identity resource IDs to attach (can be empty).

- Required: Yes
- Type: array

### Parameter: `containerAppEnvDefinition.workloadProfiles`

Workload profiles for the environment.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-containerappenvdefinitionworkloadprofilesname) | string | Profile name. |
| [`workloadProfileType`](#parameter-containerappenvdefinitionworkloadprofilesworkloadprofiletype) | string | Workload profile type. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`maximumCount`](#parameter-containerappenvdefinitionworkloadprofilesmaximumcount) | int | Maximum number of nodes for this profile. |
| [`minimumCount`](#parameter-containerappenvdefinitionworkloadprofilesminimumcount) | int | Minimum number of nodes for this profile. |

### Parameter: `containerAppEnvDefinition.workloadProfiles.name`

Profile name.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.workloadProfiles.workloadProfileType`

Workload profile type.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Consumption'
    'D16'
    'D4'
    'D8'
    'E16'
    'E32'
    'E4'
    'E8'
  ]
  ```

### Parameter: `containerAppEnvDefinition.workloadProfiles.maximumCount`

Maximum number of nodes for this profile.

- Required: No
- Type: int

### Parameter: `containerAppEnvDefinition.workloadProfiles.minimumCount`

Minimum number of nodes for this profile.

- Required: No
- Type: int

### Parameter: `containerAppEnvDefinition.zoneRedundancyEnabled`

Enable zone redundancy for the environment.

- Required: Yes
- Type: bool

### Parameter: `containerAppEnvDefinition.enableDiagnosticSettings`

Enable diagnostic settings for the environment.

- Required: No
- Type: bool

### Parameter: `containerAppEnvDefinition.logAnalyticsWorkspaceResourceId`

Resource ID of a Log Analytics workspace for diagnostics.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.name`

Container Apps Environment name.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.roleAssignments`

Role assignments to create on the environment.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-containerappenvdefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-containerappenvdefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-containerappenvdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-containerappenvdefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-containerappenvdefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-containerappenvdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-containerappenvdefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-containerappenvdefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `containerAppEnvDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `containerAppEnvDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `containerAppEnvDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `containerAppEnvDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.subnetName`

Subnet name where the environment is deployed when internal.

- Required: No
- Type: string

### Parameter: `containerAppEnvDefinition.tags`

Tags to apply to the environment.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-containerappenvdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `containerAppEnvDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition`

 Container Registry configuration (used when ACR is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      sku: 'Premium'
      tags: {}
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dataPlaneProxy`](#parameter-containerregistrydefinitiondataplaneproxy) | object | Data plane proxy configuration. |
| [`localAuthEnabled`](#parameter-containerregistrydefinitionlocalauthenabled) | bool | Enable local (admin) authentication. |
| [`name`](#parameter-containerregistrydefinitionname) | string | Container Registry name. |
| [`purgeProtectionEnabled`](#parameter-containerregistrydefinitionpurgeprotectionenabled) | bool | Enable purge protection for deleted artifacts. |
| [`sku`](#parameter-containerregistrydefinitionsku) | string | Container Registry SKU. |
| [`softDeleteRetentionInDays`](#parameter-containerregistrydefinitionsoftdeleteretentionindays) | int | Soft delete retention period in days. |
| [`tags`](#parameter-containerregistrydefinitiontags) | object | Tags to apply to the Container Registry. |

### Parameter: `containerRegistryDefinition.dataPlaneProxy`

Data plane proxy configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`authenticationMode`](#parameter-containerregistrydefinitiondataplaneproxyauthenticationmode) | string | Authentication mode for data plane proxy. |
| [`privateLinkDelegation`](#parameter-containerregistrydefinitiondataplaneproxyprivatelinkdelegation) | string | Private Link delegation setting for data plane proxy. |

### Parameter: `containerRegistryDefinition.dataPlaneProxy.authenticationMode`

Authentication mode for data plane proxy.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.dataPlaneProxy.privateLinkDelegation`

Private Link delegation setting for data plane proxy.

- Required: Yes
- Type: string

### Parameter: `containerRegistryDefinition.localAuthEnabled`

Enable local (admin) authentication.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.name`

Container Registry name.

- Required: No
- Type: string

### Parameter: `containerRegistryDefinition.purgeProtectionEnabled`

Enable purge protection for deleted artifacts.

- Required: No
- Type: bool

### Parameter: `containerRegistryDefinition.sku`

Container Registry SKU.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `containerRegistryDefinition.softDeleteRetentionInDays`

Soft delete retention period in days.

- Required: No
- Type: int

### Parameter: `containerRegistryDefinition.tags`

Tags to apply to the Container Registry.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-containerregistrydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `containerRegistryDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition`

 Cosmos DB account configuration for the GenAI app (used when Cosmos DB is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      automaticFailoverEnabled: true
      name: ''
      publicNetworkAccessEnabled: false
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`analyticalStorageConfig`](#parameter-cosmosdbdefinitionanalyticalstorageconfig) | object | Analytical storage configuration. |
| [`analyticalStorageEnabled`](#parameter-cosmosdbdefinitionanalyticalstorageenabled) | bool | Enable analytical storage. |
| [`automaticFailoverEnabled`](#parameter-cosmosdbdefinitionautomaticfailoverenabled) | bool | Enable automatic failover. |
| [`backup`](#parameter-cosmosdbdefinitionbackup) | object | Backup policy configuration. |
| [`capabilities`](#parameter-cosmosdbdefinitioncapabilities) | object | Capabilities to enable on the Cosmos DB account. |
| [`capacity`](#parameter-cosmosdbdefinitioncapacity) | object | Capacity limits for the account. |
| [`consistencyPolicy`](#parameter-cosmosdbdefinitionconsistencypolicy) | object | Consistency policy configuration. |
| [`corsRule`](#parameter-cosmosdbdefinitioncorsrule) | object | CORS rules to allow on the account. |
| [`localAuthenticationDisabled`](#parameter-cosmosdbdefinitionlocalauthenticationdisabled) | bool | Disable local authentication (keys). |
| [`multipleWriteLocationsEnabled`](#parameter-cosmosdbdefinitionmultiplewritelocationsenabled) | bool | Enable multiple write locations. |
| [`name`](#parameter-cosmosdbdefinitionname) | string | Cosmos DB account name. |
| [`partitionMergeEnabled`](#parameter-cosmosdbdefinitionpartitionmergeenabled) | bool | Enable partition merge. |
| [`publicNetworkAccessEnabled`](#parameter-cosmosdbdefinitionpublicnetworkaccessenabled) | bool | Enable public network access to the account. |
| [`secondaryRegions`](#parameter-cosmosdbdefinitionsecondaryregions) | object | Map of secondary regions and failover properties. |

### Parameter: `cosmosDbDefinition.analyticalStorageConfig`

Analytical storage configuration.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`schemaType`](#parameter-cosmosdbdefinitionanalyticalstorageconfigschematype) | string | Schema type for analytical storage. |

### Parameter: `cosmosDbDefinition.analyticalStorageConfig.schemaType`

Schema type for analytical storage.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.analyticalStorageEnabled`

Enable analytical storage.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.automaticFailoverEnabled`

Enable automatic failover.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.backup`

Backup policy configuration.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`intervalInMinutes`](#parameter-cosmosdbdefinitionbackupintervalinminutes) | int | Backup interval in minutes. |
| [`retentionInHours`](#parameter-cosmosdbdefinitionbackupretentioninhours) | int | Retention period in hours. |
| [`storageRedundancy`](#parameter-cosmosdbdefinitionbackupstorageredundancy) | string | Storage redundancy for backups. |
| [`type`](#parameter-cosmosdbdefinitionbackuptype) | string | Backup type (e.g., Periodic/Continuous). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`tier`](#parameter-cosmosdbdefinitionbackuptier) | string | Backup tier (if applicable). |

### Parameter: `cosmosDbDefinition.backup.intervalInMinutes`

Backup interval in minutes.

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.backup.retentionInHours`

Retention period in hours.

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.backup.storageRedundancy`

Storage redundancy for backups.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.backup.type`

Backup type (e.g., Periodic/Continuous).

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.backup.tier`

Backup tier (if applicable).

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.capabilities`

Capabilities to enable on the Cosmos DB account.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-cosmosdbdefinitioncapabilities>any_other_property<) | object | Arbitrary key for each capability entry. |

### Parameter: `cosmosDbDefinition.capabilities.>Any_other_property<`

Arbitrary key for each capability entry.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-cosmosdbdefinitioncapabilities>any_other_property<name) | string | Capability name. |

### Parameter: `cosmosDbDefinition.capabilities.>Any_other_property<.name`

Capability name.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.capacity`

Capacity limits for the account.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`totalThroughputLimit`](#parameter-cosmosdbdefinitioncapacitytotalthroughputlimit) | int | Total throughput limit (RU/s) for the account. |

### Parameter: `cosmosDbDefinition.capacity.totalThroughputLimit`

Total throughput limit (RU/s) for the account.

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.consistencyPolicy`

Consistency policy configuration.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`consistencyLevel`](#parameter-cosmosdbdefinitionconsistencypolicyconsistencylevel) | string | Consistency level (e.g., Strong, Session). |
| [`maxIntervalInSeconds`](#parameter-cosmosdbdefinitionconsistencypolicymaxintervalinseconds) | int | Maximum interval in seconds for Bounded Staleness. |
| [`maxStalenessPrefix`](#parameter-cosmosdbdefinitionconsistencypolicymaxstalenessprefix) | int | Maximum staleness prefix for Bounded Staleness. |

### Parameter: `cosmosDbDefinition.consistencyPolicy.consistencyLevel`

Consistency level (e.g., Strong, Session).

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.consistencyPolicy.maxIntervalInSeconds`

Maximum interval in seconds for Bounded Staleness.

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.consistencyPolicy.maxStalenessPrefix`

Maximum staleness prefix for Bounded Staleness.

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.corsRule`

CORS rules to allow on the account.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowedHeaders`](#parameter-cosmosdbdefinitioncorsruleallowedheaders) | array | Allowed headers for CORS. |
| [`allowedMethods`](#parameter-cosmosdbdefinitioncorsruleallowedmethods) | array | Allowed HTTP methods for CORS. |
| [`allowedOrigins`](#parameter-cosmosdbdefinitioncorsruleallowedorigins) | array | Allowed origins for CORS. |
| [`exposedHeaders`](#parameter-cosmosdbdefinitioncorsruleexposedheaders) | array | Exposed headers for CORS. |
| [`maxAgeInSeconds`](#parameter-cosmosdbdefinitioncorsrulemaxageinseconds) | int | Max age for preflight cache (seconds). |

### Parameter: `cosmosDbDefinition.corsRule.allowedHeaders`

Allowed headers for CORS.

- Required: Yes
- Type: array

### Parameter: `cosmosDbDefinition.corsRule.allowedMethods`

Allowed HTTP methods for CORS.

- Required: Yes
- Type: array

### Parameter: `cosmosDbDefinition.corsRule.allowedOrigins`

Allowed origins for CORS.

- Required: Yes
- Type: array

### Parameter: `cosmosDbDefinition.corsRule.exposedHeaders`

Exposed headers for CORS.

- Required: Yes
- Type: array

### Parameter: `cosmosDbDefinition.corsRule.maxAgeInSeconds`

Max age for preflight cache (seconds).

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.localAuthenticationDisabled`

Disable local authentication (keys).

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.multipleWriteLocationsEnabled`

Enable multiple write locations.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.name`

Cosmos DB account name.

- Required: No
- Type: string

### Parameter: `cosmosDbDefinition.partitionMergeEnabled`

Enable partition merge.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.publicNetworkAccessEnabled`

Enable public network access to the account.

- Required: No
- Type: bool

### Parameter: `cosmosDbDefinition.secondaryRegions`

Map of secondary regions and failover properties.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-cosmosdbdefinitionsecondaryregions>any_other_property<) | object | Arbitrary key for each secondary region entry. |

### Parameter: `cosmosDbDefinition.secondaryRegions.>Any_other_property<`

Arbitrary key for each secondary region entry.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`failoverPriority`](#parameter-cosmosdbdefinitionsecondaryregions>any_other_property<failoverpriority) | int | Failover priority for the region (0 is primary). |
| [`location`](#parameter-cosmosdbdefinitionsecondaryregions>any_other_property<location) | string | Secondary region location name. |
| [`zoneRedundant`](#parameter-cosmosdbdefinitionsecondaryregions>any_other_property<zoneredundant) | bool | Whether zone redundancy is enabled in the region. |

### Parameter: `cosmosDbDefinition.secondaryRegions.>Any_other_property<.failoverPriority`

Failover priority for the region (0 is primary).

- Required: Yes
- Type: int

### Parameter: `cosmosDbDefinition.secondaryRegions.>Any_other_property<.location`

Secondary region location name.

- Required: Yes
- Type: string

### Parameter: `cosmosDbDefinition.secondaryRegions.>Any_other_property<.zoneRedundant`

Whether zone redundancy is enabled in the region.

- Required: Yes
- Type: bool

### Parameter: `firewallDefinition`

 Azure Firewall configuration (used when Firewall is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      sku: 'AZFW_VNet'
      tags: {}
      tier: 'Standard'
      zones: []
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`sku`](#parameter-firewalldefinitionsku) | string | Azure Firewall SKU (e.g., AZFW_VNet). |
| [`tier`](#parameter-firewalldefinitiontier) | string | Azure Firewall tier (Standard/Premium/Basic). |
| [`zones`](#parameter-firewalldefinitionzones) | array | Availability zones to use (if any). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-firewalldefinitionname) | string | Azure Firewall name. |
| [`tags`](#parameter-firewalldefinitiontags) | object | Tags to apply to the firewall. |

### Parameter: `firewallDefinition.sku`

Azure Firewall SKU (e.g., AZFW_VNet).

- Required: Yes
- Type: string

### Parameter: `firewallDefinition.tier`

Azure Firewall tier (Standard/Premium/Basic).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Basic'
    'Premium'
    'Standard'
  ]
  ```

### Parameter: `firewallDefinition.zones`

Availability zones to use (if any).

- Required: Yes
- Type: array

### Parameter: `firewallDefinition.name`

Azure Firewall name.

- Required: No
- Type: string

### Parameter: `firewallDefinition.tags`

Tags to apply to the firewall.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-firewalldefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `firewallDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `hubVnetPeeringDefinition`

 Hub VNet peering configuration (required only when establishing hub-spoke peering).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      allowForwardedTraffic: true
      allowGatewayTransit: false
      allowVirtualNetworkAccess: true
      createReversePeering: true
      firewallIpAddress: ''
      name: ''
      peerVnetResourceId: ''
      reverseAllowForwardedTraffic: true
      reverseAllowGatewayTransit: false
      reverseAllowVirtualNetworkAccess: true
      reverseName: ''
      reverseUseRemoteGateways: false
      useRemoteGateways: false
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowForwardedTraffic`](#parameter-hubvnetpeeringdefinitionallowforwardedtraffic) | bool | Allow forwarded traffic across the peering. |
| [`allowGatewayTransit`](#parameter-hubvnetpeeringdefinitionallowgatewaytransit) | bool | Allow gateway transit across the peering. |
| [`allowVirtualNetworkAccess`](#parameter-hubvnetpeeringdefinitionallowvirtualnetworkaccess) | bool | Allow virtual network access across the peering. |
| [`createReversePeering`](#parameter-hubvnetpeeringdefinitioncreatereversepeering) | bool | Create reverse peering from hub back to this VNet. |
| [`firewallIpAddress`](#parameter-hubvnetpeeringdefinitionfirewallipaddress) | string | Hub firewall private IP address for routing (if applicable). |
| [`peerVnetResourceId`](#parameter-hubvnetpeeringdefinitionpeervnetresourceid) | string | Resource ID of the hub (peer) VNet. |
| [`reverseAllowForwardedTraffic`](#parameter-hubvnetpeeringdefinitionreverseallowforwardedtraffic) | bool | Reverse peering: allow forwarded traffic. |
| [`reverseAllowGatewayTransit`](#parameter-hubvnetpeeringdefinitionreverseallowgatewaytransit) | bool | Reverse peering: allow gateway transit. |
| [`reverseAllowVirtualNetworkAccess`](#parameter-hubvnetpeeringdefinitionreverseallowvirtualnetworkaccess) | bool | Reverse peering: allow VNet access. |
| [`reverseName`](#parameter-hubvnetpeeringdefinitionreversename) | string | Name of the reverse peering (hub->spoke). |
| [`reverseUseRemoteGateways`](#parameter-hubvnetpeeringdefinitionreverseuseremotegateways) | bool | Reverse peering: use remote gateways. |
| [`useRemoteGateways`](#parameter-hubvnetpeeringdefinitionuseremotegateways) | bool | Use remote gateways on the spoke peering. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-hubvnetpeeringdefinitionname) | string | Name of the peering from spoke to hub. |

### Parameter: `hubVnetPeeringDefinition.allowForwardedTraffic`

Allow forwarded traffic across the peering.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.allowGatewayTransit`

Allow gateway transit across the peering.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.allowVirtualNetworkAccess`

Allow virtual network access across the peering.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.createReversePeering`

Create reverse peering from hub back to this VNet.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.firewallIpAddress`

Hub firewall private IP address for routing (if applicable).

- Required: Yes
- Type: string

### Parameter: `hubVnetPeeringDefinition.peerVnetResourceId`

Resource ID of the hub (peer) VNet.

- Required: Yes
- Type: string

### Parameter: `hubVnetPeeringDefinition.reverseAllowForwardedTraffic`

Reverse peering: allow forwarded traffic.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.reverseAllowGatewayTransit`

Reverse peering: allow gateway transit.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.reverseAllowVirtualNetworkAccess`

Reverse peering: allow VNet access.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.reverseName`

Name of the reverse peering (hub->spoke).

- Required: Yes
- Type: string

### Parameter: `hubVnetPeeringDefinition.reverseUseRemoteGateways`

Reverse peering: use remote gateways.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.useRemoteGateways`

Use remote gateways on the spoke peering.

- Required: Yes
- Type: bool

### Parameter: `hubVnetPeeringDefinition.name`

Name of the peering from spoke to hub.

- Required: No
- Type: string

### Parameter: `jumpVmAdminPassword`

Required when deploying Jump VM. Local admin password to set on the Windows JumpVM.

- Required: No
- Type: securestring
- Default: `''`

### Parameter: `keyVaultDefinition`

 Key Vault configuration for the GenAI app (used when KV is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      roleAssignments: []
      sku: 'standard'
      tags: {}
      tenantId: '[subscription().tenantId]'
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-keyvaultdefinitionname) | string | Key Vault name. |
| [`roleAssignments`](#parameter-keyvaultdefinitionroleassignments) | array | Role assignments to create on the vault. |
| [`sku`](#parameter-keyvaultdefinitionsku) | string | Key Vault SKU (e.g., standard, premium). |
| [`tags`](#parameter-keyvaultdefinitiontags) | object | Tags to apply to the Key Vault. |
| [`tenantId`](#parameter-keyvaultdefinitiontenantid) | string | AAD tenant ID for the vault. |

### Parameter: `keyVaultDefinition.name`

Key Vault name.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.roleAssignments`

Role assignments to create on the vault.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-keyvaultdefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-keyvaultdefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-keyvaultdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-keyvaultdefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-keyvaultdefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-keyvaultdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-keyvaultdefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-keyvaultdefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `keyVaultDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `keyVaultDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `keyVaultDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.sku`

Key Vault SKU (e.g., standard, premium).

- Required: No
- Type: string

### Parameter: `keyVaultDefinition.tags`

Tags to apply to the Key Vault.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-keyvaultdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `keyVaultDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `keyVaultDefinition.tenantId`

AAD tenant ID for the vault.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition`

 Log Analytics Workspace configuration (required if you deploy App Insights and are not reusing an existing workspace).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      name: ''
      retention: 30
      sku: 'PerGB2018'
      tags: {}
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`retention`](#parameter-loganalyticsdefinitionretention) | int | Data retention in days. |
| [`sku`](#parameter-loganalyticsdefinitionsku) | string | Workspace SKU. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-loganalyticsdefinitionname) | string | Workspace name. If empty, a deterministic name is used. |
| [`tags`](#parameter-loganalyticsdefinitiontags) | object | Tags to apply to the workspace. |

### Parameter: `logAnalyticsDefinition.retention`

Data retention in days.

- Required: Yes
- Type: int

### Parameter: `logAnalyticsDefinition.sku`

Workspace SKU.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'CapacityReservation'
    'Free'
    'LACluster'
    'PerGB2018'
    'PerNode'
    'Premium'
    'Standalone'
    'Standard'
  ]
  ```

### Parameter: `logAnalyticsDefinition.name`

Workspace name. If empty, a deterministic name is used.

- Required: No
- Type: string

### Parameter: `logAnalyticsDefinition.tags`

Tags to apply to the workspace.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-loganalyticsdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `logAnalyticsDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `privateDnsZoneIds`

 Existing Private DNS Zone resource IDs per service; provide to reuse, or leave empty to create.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      acr: ''
      aiServices: ''
      appConfig: ''
      appInsights: ''
      blob: ''
      cognitiveservices: ''
      containerApps: ''
      cosmosSql: ''
      keyVault: ''
      openai: ''
      search: ''
  }
  ```

### Parameter: `privateDnsZones`

 Private DNS Zones and VNet links configuration (used when creating zones).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      allowInternetResolutionFallback: false
      existingZonesResourceGroupResourceId: ''
      networkLinks: []
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`networkLinks`](#parameter-privatednszonesnetworklinks) | array | VNet link definitions to associate with the zones (can be empty). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allowInternetResolutionFallback`](#parameter-privatednszonesallowinternetresolutionfallback) | bool | Allow fallback to internet DNS resolution when Private DNS is unavailable. |
| [`existingZonesResourceGroupResourceId`](#parameter-privatednszonesexistingzonesresourcegroupresourceid) | string | Resource ID of the resource group that hosts existing Private DNS zones. |

### Parameter: `privateDnsZones.networkLinks`

VNet link definitions to associate with the zones (can be empty).

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`vnetId`](#parameter-privatednszonesnetworklinksvnetid) | string | Resource ID of the VNet to link. |
| [`vnetLinkName`](#parameter-privatednszonesnetworklinksvnetlinkname) | string | Name of the VNet link resource to create. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`resolutionPolicy`](#parameter-privatednszonesnetworklinksresolutionpolicy) | string | DNS resolution policy for the link. |

### Parameter: `privateDnsZones.networkLinks.vnetId`

Resource ID of the VNet to link.

- Required: Yes
- Type: string

### Parameter: `privateDnsZones.networkLinks.vnetLinkName`

Name of the VNet link resource to create.

- Required: Yes
- Type: string

### Parameter: `privateDnsZones.networkLinks.resolutionPolicy`

DNS resolution policy for the link.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Classic'
    'Default'
    'SecureOnly'
  ]
  ```

### Parameter: `privateDnsZones.allowInternetResolutionFallback`

Allow fallback to internet DNS resolution when Private DNS is unavailable.

- Required: No
- Type: bool

### Parameter: `privateDnsZones.existingZonesResourceGroupResourceId`

Resource ID of the resource group that hosts existing Private DNS zones.

- Required: No
- Type: string

### Parameter: `searchDefinition`

 Azure AI Search configuration for the GenAI app (used when Search is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      localAuthenticationEnabled: true
      name: ''
      partitionCount: 1
      publicNetworkAccessEnabled: false
      replicaCount: 2
      semanticSearchSku: 'standard'
      sku: 'standard'
      tags: {}
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enableTelemetry`](#parameter-searchdefinitionenabletelemetry) | bool | Enable module telemetry. |
| [`localAuthenticationEnabled`](#parameter-searchdefinitionlocalauthenticationenabled) | bool | Enable local (admin keys) authentication. |
| [`name`](#parameter-searchdefinitionname) | string | Search service name. |
| [`partitionCount`](#parameter-searchdefinitionpartitioncount) | int | Number of partitions. |
| [`publicNetworkAccessEnabled`](#parameter-searchdefinitionpublicnetworkaccessenabled) | bool | Enable public network access. |
| [`replicaCount`](#parameter-searchdefinitionreplicacount) | int | Number of replicas. |
| [`roleAssignments`](#parameter-searchdefinitionroleassignments) | array | Role assignments to create on the search service. |
| [`semanticSearchSku`](#parameter-searchdefinitionsemanticsearchsku) | string | Semantic search SKU (e.g., standard). |
| [`sku`](#parameter-searchdefinitionsku) | string | Search SKU (e.g., basic/standard). |
| [`tags`](#parameter-searchdefinitiontags) | object | Tags to apply to the search service. |

### Parameter: `searchDefinition.enableTelemetry`

Enable module telemetry.

- Required: No
- Type: bool

### Parameter: `searchDefinition.localAuthenticationEnabled`

Enable local (admin keys) authentication.

- Required: No
- Type: bool

### Parameter: `searchDefinition.name`

Search service name.

- Required: No
- Type: string

### Parameter: `searchDefinition.partitionCount`

Number of partitions.

- Required: No
- Type: int

### Parameter: `searchDefinition.publicNetworkAccessEnabled`

Enable public network access.

- Required: No
- Type: bool

### Parameter: `searchDefinition.replicaCount`

Number of replicas.

- Required: No
- Type: int

### Parameter: `searchDefinition.roleAssignments`

Role assignments to create on the search service.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-searchdefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-searchdefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-searchdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-searchdefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-searchdefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-searchdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-searchdefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-searchdefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `searchDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `searchDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `searchDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `searchDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `searchDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `searchDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `searchDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `searchDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `searchDefinition.semanticSearchSku`

Semantic search SKU (e.g., standard).

- Required: No
- Type: string

### Parameter: `searchDefinition.sku`

Search SKU (e.g., basic/standard).

- Required: No
- Type: string

### Parameter: `searchDefinition.tags`

Tags to apply to the search service.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-searchdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `searchDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition`

 Storage Account configuration for the GenAI app (used when Storage is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      accountKind: 'StorageV2'
      accountReplicationType: 'GRS'
      accountTier: 'Standard'
      name: ''
      tags: {}
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`accessTier`](#parameter-storageaccountdefinitionaccesstier) | string | Access tier (Hot/Cool). |
| [`accountKind`](#parameter-storageaccountdefinitionaccountkind) | string | Storage account kind (e.g., StorageV2). |
| [`accountReplicationType`](#parameter-storageaccountdefinitionaccountreplicationtype) | string | Replication type (e.g., LRS/ZRS/GRS). |
| [`accountTier`](#parameter-storageaccountdefinitionaccounttier) | string | Storage account tier (Standard/Premium). |
| [`endpointTypes`](#parameter-storageaccountdefinitionendpointtypes) | array | Endpoint types to enable (e.g., blob, dfs). |
| [`name`](#parameter-storageaccountdefinitionname) | string | Storage account name. |
| [`publicNetworkAccessEnabled`](#parameter-storageaccountdefinitionpublicnetworkaccessenabled) | bool | Enable public network access. |
| [`roleAssignments`](#parameter-storageaccountdefinitionroleassignments) | array | Role assignments to create on the account. |
| [`sharedAccessKeyEnabled`](#parameter-storageaccountdefinitionsharedaccesskeyenabled) | bool | Enable shared access keys (account keys). |
| [`tags`](#parameter-storageaccountdefinitiontags) | object | Tags to apply to the storage account. |

### Parameter: `storageAccountDefinition.accessTier`

Access tier (Hot/Cool).

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.accountKind`

Storage account kind (e.g., StorageV2).

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.accountReplicationType`

Replication type (e.g., LRS/ZRS/GRS).

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.accountTier`

Storage account tier (Standard/Premium).

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.endpointTypes`

Endpoint types to enable (e.g., blob, dfs).

- Required: No
- Type: array

### Parameter: `storageAccountDefinition.name`

Storage account name.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.publicNetworkAccessEnabled`

Enable public network access.

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.roleAssignments`

Role assignments to create on the account.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-storageaccountdefinitionroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-storageaccountdefinitionroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-storageaccountdefinitionroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-storageaccountdefinitionroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-storageaccountdefinitionroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-storageaccountdefinitionroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-storageaccountdefinitionroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-storageaccountdefinitionroleassignmentsname) | string | Role assignment name. |

### Parameter: `storageAccountDefinition.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `storageAccountDefinition.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `storageAccountDefinition.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `storageAccountDefinition.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `storageAccountDefinition.sharedAccessKeyEnabled`

Enable shared access keys (account keys).

- Required: No
- Type: bool

### Parameter: `storageAccountDefinition.tags`

Tags to apply to the storage account.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-storageaccountdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `storageAccountDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition`

 Web Application Firewall (WAF) policy configuration (required when Application Gateway with WAF is deployed).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      managedRules: {
        exclusions: []
        managedRuleSets: [
          {
            ruleGroupOverride: []
            type: 'OWASP'
            version: '3.2'
          }
        ]
      }
      name: ''
      policySettings: {
        enabledState: 'Enabled'
        fileUploadLimitInMb: 100
        maxRequestBodySizeInKb: 128
        mode: 'Prevention'
        requestBodyCheck: true
      }
      tags: {}
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`managedRules`](#parameter-wafpolicydefinitionmanagedrules) | object | Managed rule sets and exclusions for the WAF policy. |
| [`name`](#parameter-wafpolicydefinitionname) | string | WAF policy resource name. |
| [`policySettings`](#parameter-wafpolicydefinitionpolicysettings) | object | WAF policy settings (state, mode, size limits). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`tags`](#parameter-wafpolicydefinitiontags) | object | Tags to apply to the WAF Policy. |

### Parameter: `wafPolicyDefinition.managedRules`

Managed rule sets and exclusions for the WAF policy.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`managedRuleSets`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesets) | array | Managed rule sets to apply. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`exclusions`](#parameter-wafpolicydefinitionmanagedrulesexclusions) | array | Exclusions for specific rules or variables. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets`

Managed rule sets to apply.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetstype) | string | Rule set type (e.g., OWASP). |
| [`version`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsversion) | string | Rule set version. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ruleGroupOverride`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverride) | array | Overrides for specific rule groups. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.type`

Rule set type (e.g., OWASP).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.version`

Rule set version.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride`

Overrides for specific rule groups.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`rule`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverriderule) | array | Rule overrides within the group. |
| [`ruleGroupName`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverriderulegroupname) | string | Name of the rule group. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule`

Rule overrides within the group.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`action`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverrideruleaction) | string | Action to take (e.g., Allow, Block, Log). |
| [`enabled`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverrideruleenabled) | bool | Whether the rule is enabled. |
| [`id`](#parameter-wafpolicydefinitionmanagedrulesmanagedrulesetsrulegroupoverrideruleid) | string | Rule ID. |

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule.action`

Action to take (e.g., Allow, Block, Log).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule.enabled`

Whether the rule is enabled.

- Required: Yes
- Type: bool

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.rule.id`

Rule ID.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.managedRuleSets.ruleGroupOverride.ruleGroupName`

Name of the rule group.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions`

Exclusions for specific rules or variables.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`matchVariable`](#parameter-wafpolicydefinitionmanagedrulesexclusionsmatchvariable) | string | Match variable to exclude (e.g., RequestHeaderNames). |
| [`selector`](#parameter-wafpolicydefinitionmanagedrulesexclusionsselector) | string | Selector value for the match variable. |
| [`selectorMatchOperator`](#parameter-wafpolicydefinitionmanagedrulesexclusionsselectormatchoperator) | string | Selector match operator (e.g., Equals, Contains). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`excludedRuleSet`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedruleset) | object | Specific managed rule set exclusion details. |

### Parameter: `wafPolicyDefinition.managedRules.exclusions.matchVariable`

Match variable to exclude (e.g., RequestHeaderNames).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.selector`

Selector value for the match variable.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.selectorMatchOperator`

Selector match operator (e.g., Equals, Contains).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet`

Specific managed rule set exclusion details.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`type`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedrulesettype) | string | Rule set type (e.g., OWASP). |
| [`version`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedrulesetversion) | string | Rule set version (e.g., 3.2). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`ruleGroup`](#parameter-wafpolicydefinitionmanagedrulesexclusionsexcludedrulesetrulegroup) | array | Rule groups to exclude. |

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet.type`

Rule set type (e.g., OWASP).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet.version`

Rule set version (e.g., 3.2).

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.managedRules.exclusions.excludedRuleSet.ruleGroup`

Rule groups to exclude.

- Required: Yes
- Type: array

### Parameter: `wafPolicyDefinition.name`

WAF policy resource name.

- Required: Yes
- Type: string

### Parameter: `wafPolicyDefinition.policySettings`

WAF policy settings (state, mode, size limits).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabledState`](#parameter-wafpolicydefinitionpolicysettingsenabledstate) | string | WAF policy enabled state. |
| [`fileUploadLimitInMb`](#parameter-wafpolicydefinitionpolicysettingsfileuploadlimitinmb) | int | File upload size limit (MB). |
| [`maxRequestBodySizeInKb`](#parameter-wafpolicydefinitionpolicysettingsmaxrequestbodysizeinkb) | int | Maximum request body size (KB). |
| [`mode`](#parameter-wafpolicydefinitionpolicysettingsmode) | string | WAF mode (Prevention or Detection). |
| [`requestBodyCheck`](#parameter-wafpolicydefinitionpolicysettingsrequestbodycheck) | bool | Enable request body inspection. |

### Parameter: `wafPolicyDefinition.policySettings.enabledState`

WAF policy enabled state.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Disabled'
    'Enabled'
  ]
  ```

### Parameter: `wafPolicyDefinition.policySettings.fileUploadLimitInMb`

File upload size limit (MB).

- Required: Yes
- Type: int

### Parameter: `wafPolicyDefinition.policySettings.maxRequestBodySizeInKb`

Maximum request body size (KB).

- Required: Yes
- Type: int

### Parameter: `wafPolicyDefinition.policySettings.mode`

WAF mode (Prevention or Detection).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Detection'
    'Prevention'
  ]
  ```

### Parameter: `wafPolicyDefinition.policySettings.requestBodyCheck`

Enable request body inspection.

- Required: Yes
- Type: bool

### Parameter: `wafPolicyDefinition.tags`

Tags to apply to the WAF Policy.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-wafpolicydefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `wafPolicyDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition`

 AI Foundry project configuration (account/project, networking, associated resources, and deployments).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      aiFoundryConfiguration: {
        accountName: ''
        allowProjectManagement: true
        createCapabilityHosts: false
        location: '[parameters(\'location\')]'
        networking: {
          agentServiceSubnetResourceId: ''
          aiServicesPrivateDnsZoneResourceId: ''
          cognitiveServicesPrivateDnsZoneResourceId: ''
          openAiPrivateDnsZoneResourceId: ''
        }
        project: {
          desc: 'This is the default project for AI Foundry.'
          displayName: ''
          name: ''
        }
        roleAssignments: []
        sku: 'S0'
      }
      aiModelDeployments: [
        {
          model: {
            format: 'OpenAI'
            name: 'gpt-4o'
            version: '2024-11-20'
          }
          name: 'chat'
          raiPolicyName: ''
          scale: {
            capacity: 1
            family: ''
            size: ''
            tier: ''
            type: 'Standard'
          }
          versionUpgradeOption: ''
        }
        {
          model: {
            format: 'OpenAI'
            name: 'text-embedding-3-large'
            version: '1'
          }
          name: 'text-embedding'
          raiPolicyName: ''
          scale: {
            capacity: 1
            family: ''
            size: ''
            tier: ''
            type: 'Standard'
          }
          versionUpgradeOption: ''
        }
      ]
      aiProjects: []
      aiSearchConfiguration: {
        existingResourceId: ''
        name: ''
        privateDnsZoneResourceId: ''
        roleAssignments: []
      }
      baseUniqueName: ''
      cosmosDbConfiguration: {
        existingResourceId: ''
        name: ''
        privateDnsZoneResourceId: ''
        roleAssignments: []
      }
      enableTelemetry: '[parameters(\'enableTelemetry\')]'
      includeAssociatedResources: true
      keyVaultConfiguration: {
        existingResourceId: ''
        name: ''
        privateDnsZoneResourceId: ''
        roleAssignments: []
      }
      location: '[parameters(\'location\')]'
      lock: {
        kind: 'None'
        name: ''
      }
      privateEndpointSubnetResourceId: ''
      storageAccountConfiguration: {
        blobPrivateDnsZoneResourceId: ''
        existingResourceId: ''
        name: ''
        roleAssignments: []
      }
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiModelDeployments`](#parameter-aifoundrydefinitionaimodeldeployments) | array | Model deployments to provision (can be empty). |
| [`aiProjects`](#parameter-aifoundrydefinitionaiprojects) | array | Array of AI Projects to create (can be empty). |
| [`lock`](#parameter-aifoundrydefinitionlock) | object | Optional lock configuration for created resources. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiFoundryConfiguration`](#parameter-aifoundrydefinitionaifoundryconfiguration) | object | AI Foundry account/project level configuration. |
| [`aiSearchConfiguration`](#parameter-aifoundrydefinitionaisearchconfiguration) | object | Azure AI Search configuration (reuse or create) for AI Foundry associated resources. |
| [`baseUniqueName`](#parameter-aifoundrydefinitionbaseuniquename) | string | Base unique name used for related resources. |
| [`cosmosDbConfiguration`](#parameter-aifoundrydefinitioncosmosdbconfiguration) | object | Cosmos DB configuration (reuse or create) for AI Foundry associated resources. |
| [`createByor`](#parameter-aifoundrydefinitioncreatebyor) | bool | Create BYOR (bring-your-own resource) links where applicable. |
| [`enableTelemetry`](#parameter-aifoundrydefinitionenabletelemetry) | bool | Enable telemetry for the pattern modules. |
| [`includeAssociatedResources`](#parameter-aifoundrydefinitionincludeassociatedresources) | bool | Include associated resources (Search/Cosmos/Storage/KV) in the deployment. |
| [`keyVaultConfiguration`](#parameter-aifoundrydefinitionkeyvaultconfiguration) | object | Key Vault configuration (reuse or create) for AI Foundry associated resources. |
| [`location`](#parameter-aifoundrydefinitionlocation) | string | Location/region for the AI Foundry resources. |
| [`privateEndpointSubnetResourceId`](#parameter-aifoundrydefinitionprivateendpointsubnetresourceid) | string | Subnet resource ID where Private Endpoints should be created. |
| [`storageAccountConfiguration`](#parameter-aifoundrydefinitionstorageaccountconfiguration) | object | Storage Account configuration (reuse or create) for AI Foundry associated resources. |

### Parameter: `aiFoundryDefinition.aiModelDeployments`

Model deployments to provision (can be empty).

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`model`](#parameter-aifoundrydefinitionaimodeldeploymentsmodel) | object | Model identification (format/name/version). |
| [`name`](#parameter-aifoundrydefinitionaimodeldeploymentsname) | string | Deployment name. |
| [`scale`](#parameter-aifoundrydefinitionaimodeldeploymentsscale) | object | Capacity configuration (family/size/tier/type/capacity). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`raiPolicyName`](#parameter-aifoundrydefinitionaimodeldeploymentsraipolicyname) | string | Name of the associated RAI policy to apply. |
| [`versionUpgradeOption`](#parameter-aifoundrydefinitionaimodeldeploymentsversionupgradeoption) | string | Version upgrade option for this deployment. |

### Parameter: `aiFoundryDefinition.aiModelDeployments.model`

Model identification (format/name/version).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`format`](#parameter-aifoundrydefinitionaimodeldeploymentsmodelformat) | string | Model format (e.g., OpenAI, HF, ONNX). |
| [`name`](#parameter-aifoundrydefinitionaimodeldeploymentsmodelname) | string | Model name. |
| [`version`](#parameter-aifoundrydefinitionaimodeldeploymentsmodelversion) | string | Model version. |

### Parameter: `aiFoundryDefinition.aiModelDeployments.model.format`

Model format (e.g., OpenAI, HF, ONNX).

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.model.name`

Model name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.model.version`

Model version.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.name`

Deployment name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.scale`

Capacity configuration (family/size/tier/type/capacity).

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`capacity`](#parameter-aifoundrydefinitionaimodeldeploymentsscalecapacity) | int | Target capacity (number of instances). |
| [`family`](#parameter-aifoundrydefinitionaimodeldeploymentsscalefamily) | string | VM family or accelerator family. |
| [`size`](#parameter-aifoundrydefinitionaimodeldeploymentsscalesize) | string | VM size or SKU size. |
| [`tier`](#parameter-aifoundrydefinitionaimodeldeploymentsscaletier) | string | Billing tier. |
| [`type`](#parameter-aifoundrydefinitionaimodeldeploymentsscaletype) | string | Resource type (dedicated/consumption/etc.). |

### Parameter: `aiFoundryDefinition.aiModelDeployments.scale.capacity`

Target capacity (number of instances).

- Required: Yes
- Type: int

### Parameter: `aiFoundryDefinition.aiModelDeployments.scale.family`

VM family or accelerator family.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.scale.size`

VM size or SKU size.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.scale.tier`

Billing tier.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.scale.type`

Resource type (dedicated/consumption/etc.).

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.raiPolicyName`

Name of the associated RAI policy to apply.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiModelDeployments.versionUpgradeOption`

Version upgrade option for this deployment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects`

Array of AI Projects to create (can be empty).

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`desc`](#parameter-aifoundrydefinitionaiprojectsdesc) | string | Description for the project. |
| [`displayName`](#parameter-aifoundrydefinitionaiprojectsdisplayname) | string | Display name for the project. |
| [`name`](#parameter-aifoundrydefinitionaiprojectsname) | string | Project resource name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiSearchConnection`](#parameter-aifoundrydefinitionaiprojectsaisearchconnection) | object | AI Search connection reference. |
| [`cosmosDbConnection`](#parameter-aifoundrydefinitionaiprojectscosmosdbconnection) | object | Cosmos DB connection reference. |
| [`createProjectConnections`](#parameter-aifoundrydefinitionaiprojectscreateprojectconnections) | bool | Whether to auto-create project connections (BYOR). |
| [`keyVaultConnection`](#parameter-aifoundrydefinitionaiprojectskeyvaultconnection) | object | Key Vault connection reference. |
| [`sku`](#parameter-aifoundrydefinitionaiprojectssku) | string | Project SKU. |
| [`storageAccountConnection`](#parameter-aifoundrydefinitionaiprojectsstorageaccountconnection) | object | Storage Account connection reference. |

### Parameter: `aiFoundryDefinition.aiProjects.desc`

Description for the project.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.displayName`

Display name for the project.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.name`

Project resource name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.aiSearchConnection`

AI Search connection reference.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionaiprojectsaisearchconnectionexistingresourceid) | string | Resource ID of an existing resource to connect to. |
| [`newResourceMapKey`](#parameter-aifoundrydefinitionaiprojectsaisearchconnectionnewresourcemapkey) | string | Key referencing a newly created resource within the deployment map. |

### Parameter: `aiFoundryDefinition.aiProjects.aiSearchConnection.existingResourceId`

Resource ID of an existing resource to connect to.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.aiSearchConnection.newResourceMapKey`

Key referencing a newly created resource within the deployment map.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.cosmosDbConnection`

Cosmos DB connection reference.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionaiprojectscosmosdbconnectionexistingresourceid) | string | Resource ID of an existing resource to connect to. |
| [`newResourceMapKey`](#parameter-aifoundrydefinitionaiprojectscosmosdbconnectionnewresourcemapkey) | string | Key referencing a newly created resource within the deployment map. |

### Parameter: `aiFoundryDefinition.aiProjects.cosmosDbConnection.existingResourceId`

Resource ID of an existing resource to connect to.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.cosmosDbConnection.newResourceMapKey`

Key referencing a newly created resource within the deployment map.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.createProjectConnections`

Whether to auto-create project connections (BYOR).

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.aiProjects.keyVaultConnection`

Key Vault connection reference.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionaiprojectskeyvaultconnectionexistingresourceid) | string | Resource ID of an existing resource to connect to. |
| [`newResourceMapKey`](#parameter-aifoundrydefinitionaiprojectskeyvaultconnectionnewresourcemapkey) | string | Key referencing a newly created resource within the deployment map. |

### Parameter: `aiFoundryDefinition.aiProjects.keyVaultConnection.existingResourceId`

Resource ID of an existing resource to connect to.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.keyVaultConnection.newResourceMapKey`

Key referencing a newly created resource within the deployment map.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.sku`

Project SKU.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.storageAccountConnection`

Storage Account connection reference.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionaiprojectsstorageaccountconnectionexistingresourceid) | string | Resource ID of an existing resource to connect to. |
| [`newResourceMapKey`](#parameter-aifoundrydefinitionaiprojectsstorageaccountconnectionnewresourcemapkey) | string | Key referencing a newly created resource within the deployment map. |

### Parameter: `aiFoundryDefinition.aiProjects.storageAccountConnection.existingResourceId`

Resource ID of an existing resource to connect to.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiProjects.storageAccountConnection.newResourceMapKey`

Key referencing a newly created resource within the deployment map.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.lock`

Optional lock configuration for created resources.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-aifoundrydefinitionlockkind) | string | Specify the type of lock. |
| [`name`](#parameter-aifoundrydefinitionlockname) | string | Specify the name of lock. |
| [`notes`](#parameter-aifoundrydefinitionlocknotes) | string | Specify the notes of the lock. |

### Parameter: `aiFoundryDefinition.lock.kind`

Specify the type of lock.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `aiFoundryDefinition.lock.name`

Specify the name of lock.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.lock.notes`

Specify the notes of the lock.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration`

AI Foundry account/project level configuration.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`accountName`](#parameter-aifoundrydefinitionaifoundryconfigurationaccountname) | string | Account name for AI Foundry. |
| [`allowProjectManagement`](#parameter-aifoundrydefinitionaifoundryconfigurationallowprojectmanagement) | bool | Allow project management operations. |
| [`createCapabilityHosts`](#parameter-aifoundrydefinitionaifoundryconfigurationcreatecapabilityhosts) | bool | Create capability hosts (data plane services). |
| [`location`](#parameter-aifoundrydefinitionaifoundryconfigurationlocation) | string | Location for the account (defaults to RG location if omitted). |
| [`networking`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworking) | object | Networking configuration (subnet & private DNS zones). |
| [`privateDnsZoneResourceIds`](#parameter-aifoundrydefinitionaifoundryconfigurationprivatednszoneresourceids) | array | Consolidated list of Private DNS Zone resource IDs. |
| [`project`](#parameter-aifoundrydefinitionaifoundryconfigurationproject) | object | Default project properties. |
| [`roleAssignments`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignments) | array | Role assignments to create on the account. |
| [`sku`](#parameter-aifoundrydefinitionaifoundryconfigurationsku) | string | Account SKU. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.accountName`

Account name for AI Foundry.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.allowProjectManagement`

Allow project management operations.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.createCapabilityHosts`

Create capability hosts (data plane services).

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.location`

Location for the account (defaults to RG location if omitted).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking`

Networking configuration (subnet & private DNS zones).

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentServiceSubnetResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingagentservicesubnetresourceid) | string | Subnet Resource ID for the Agent Service. |
| [`aiServicesPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingaiservicesprivatednszoneresourceid) | string | Private DNS zone Resource ID for AI Services. |
| [`cognitiveServicesPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingcognitiveservicesprivatednszoneresourceid) | string | Private DNS zone Resource ID for AI Services. |
| [`openAiPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationnetworkingopenaiprivatednszoneresourceid) | string | Private DNS zone Resource ID for OpenAI. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.agentServiceSubnetResourceId`

Subnet Resource ID for the Agent Service.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.aiServicesPrivateDnsZoneResourceId`

Private DNS zone Resource ID for AI Services.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.cognitiveServicesPrivateDnsZoneResourceId`

Private DNS zone Resource ID for AI Services.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.networking.openAiPrivateDnsZoneResourceId`

Private DNS zone Resource ID for OpenAI.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.privateDnsZoneResourceIds`

Consolidated list of Private DNS Zone resource IDs.

- Required: No
- Type: array

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project`

Default project properties.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`desc`](#parameter-aifoundrydefinitionaifoundryconfigurationprojectdesc) | string | Default project description. |
| [`displayName`](#parameter-aifoundrydefinitionaifoundryconfigurationprojectdisplayname) | string | Default project display name. |
| [`name`](#parameter-aifoundrydefinitionaifoundryconfigurationprojectname) | string | Default project name. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project.desc`

Default project description.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project.displayName`

Default project display name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.project.name`

Default project name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments`

Role assignments to create on the account.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsprincipaltype) | string | Principal type. |
| [`roleDefinitionIdOrName`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-aifoundrydefinitionaifoundryconfigurationroleassignmentsname) | string | Role assignment name. |

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.principalType`

Principal type.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiFoundryConfiguration.sku`

Account SKU.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'C2'
    'C3'
    'C4'
    'DC0'
    'F0'
    'F1'
    'S'
    'S0'
    'S1'
    'S10'
    'S2'
    'S3'
    'S4'
    'S5'
    'S6'
    'S7'
    'S8'
    'S9'
  ]
  ```

### Parameter: `aiFoundryDefinition.aiSearchConfiguration`

Azure AI Search configuration (reuse or create) for AI Foundry associated resources.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionaisearchconfigurationexistingresourceid) | string | Existing Search resource ID to reuse. |
| [`name`](#parameter-aifoundrydefinitionaisearchconfigurationname) | string | Name for a new Search service (if creating). |
| [`privateDnsZoneResourceId`](#parameter-aifoundrydefinitionaisearchconfigurationprivatednszoneresourceid) | string | Private DNS Zone resource ID for Search. |
| [`roleAssignments`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignments) | array | Role assignments to create on the Search service. |

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.existingResourceId`

Existing Search resource ID to reuse.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.name`

Name for a new Search service (if creating).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.privateDnsZoneResourceId`

Private DNS Zone resource ID for Search.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments`

Role assignments to create on the Search service.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-aifoundrydefinitionaisearchconfigurationroleassignmentsname) | string | Role assignment name. |

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.aiSearchConfiguration.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.baseUniqueName`

Base unique name used for related resources.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration`

Cosmos DB configuration (reuse or create) for AI Foundry associated resources.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitioncosmosdbconfigurationexistingresourceid) | string | Existing Cosmos DB account resource ID to reuse. |
| [`name`](#parameter-aifoundrydefinitioncosmosdbconfigurationname) | string | Name for a new Cosmos DB account (if creating). |
| [`privateDnsZoneResourceId`](#parameter-aifoundrydefinitioncosmosdbconfigurationprivatednszoneresourceid) | string | Private DNS Zone resource ID for Cosmos. |
| [`roleAssignments`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignments) | array | Role assignments to create on the Cosmos DB account. |

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.existingResourceId`

Existing Cosmos DB account resource ID to reuse.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.name`

Name for a new Cosmos DB account (if creating).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.privateDnsZoneResourceId`

Private DNS Zone resource ID for Cosmos.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments`

Role assignments to create on the Cosmos DB account.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-aifoundrydefinitioncosmosdbconfigurationroleassignmentsname) | string | Role assignment name. |

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.cosmosDbConfiguration.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.createByor`

Create BYOR (bring-your-own resource) links where applicable.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.enableTelemetry`

Enable telemetry for the pattern modules.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.includeAssociatedResources`

Include associated resources (Search/Cosmos/Storage/KV) in the deployment.

- Required: No
- Type: bool

### Parameter: `aiFoundryDefinition.keyVaultConfiguration`

Key Vault configuration (reuse or create) for AI Foundry associated resources.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`existingResourceId`](#parameter-aifoundrydefinitionkeyvaultconfigurationexistingresourceid) | string | Existing Key Vault resource ID to reuse. |
| [`name`](#parameter-aifoundrydefinitionkeyvaultconfigurationname) | string | Name for a new Key Vault (if creating). |
| [`privateDnsZoneResourceId`](#parameter-aifoundrydefinitionkeyvaultconfigurationprivatednszoneresourceid) | string | Private DNS Zone resource ID for Vault. |
| [`roleAssignments`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignments) | array | Role assignments to create on the vault. |

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.existingResourceId`

Existing Key Vault resource ID to reuse.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.name`

Name for a new Key Vault (if creating).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.privateDnsZoneResourceId`

Private DNS Zone resource ID for Vault.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments`

Role assignments to create on the vault.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsprincipaltype) | string | Principal type. |
| [`roleDefinitionIdOrName`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-aifoundrydefinitionkeyvaultconfigurationroleassignmentsname) | string | Role assignment name. |

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.principalType`

Principal type.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.keyVaultConfiguration.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.location`

Location/region for the AI Foundry resources.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.privateEndpointSubnetResourceId`

Subnet resource ID where Private Endpoints should be created.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration`

Storage Account configuration (reuse or create) for AI Foundry associated resources.

- Required: Yes
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`blobPrivateDnsZoneResourceId`](#parameter-aifoundrydefinitionstorageaccountconfigurationblobprivatednszoneresourceid) | string | Private DNS Zone resource ID for Blob (if using Private Endpoints). |
| [`existingResourceId`](#parameter-aifoundrydefinitionstorageaccountconfigurationexistingresourceid) | string | Existing Storage Account resource ID to reuse. |
| [`name`](#parameter-aifoundrydefinitionstorageaccountconfigurationname) | string | Name for a new Storage Account (if creating). |
| [`roleAssignments`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignments) | array | Role assignments to create on the Storage Account. |

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.blobPrivateDnsZoneResourceId`

Private DNS Zone resource ID for Blob (if using Private Endpoints).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.existingResourceId`

Existing Storage Account resource ID to reuse.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.name`

Name for a new Storage Account (if creating).

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments`

Role assignments to create on the Storage Account.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsprincipalid) | string | Principal (objectId) to assign. |
| [`principalType`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsprincipaltype) | string | Principal type for the assignment. |
| [`roleDefinitionIdOrName`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsroledefinitionidorname) | string | Role definition ID or built-in role name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentscondition) | string | Condition expression for the assignment. |
| [`conditionVersion`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsconditionversion) | string | Condition version (e.g., 2.0). |
| [`delegatedManagedIdentityResourceId`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsdelegatedmanagedidentityresourceid) | string | Delegated managed identity resource ID. |
| [`description`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsdescription) | string | Description for the assignment. |
| [`name`](#parameter-aifoundrydefinitionstorageaccountconfigurationroleassignmentsname) | string | Role assignment name. |

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.principalId`

Principal (objectId) to assign.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.principalType`

Principal type for the assignment.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.roleDefinitionIdOrName`

Role definition ID or built-in role name.

- Required: Yes
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.condition`

Condition expression for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.conditionVersion`

Condition version (e.g., 2.0).

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.delegatedManagedIdentityResourceId`

Delegated managed identity resource ID.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.description`

Description for the assignment.

- Required: No
- Type: string

### Parameter: `aiFoundryDefinition.storageAccountConfiguration.roleAssignments.name`

Role assignment name.

- Required: No
- Type: string

### Parameter: `azdoPat`

PAT used to register the Azure DevOps agent (when runner = azdo).

- Required: No
- Type: securestring
- Default: `''`

### Parameter: `baseName`

 Base name to seed resource names; defaults to a 12-char token.

- Required: No
- Type: string
- Default: `[substring(parameters('resourceToken'), 0, 12)]`

### Parameter: `buildVmDefinition`

 Build VM configuration to support CI/CD workers (Linux).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      adminUsername: 'azureuser'
      azdo: {
        orgUrl: 'https://dev.azure.com/<org>'
        pool: 'Default'
      }
      enableTelemetry: '[parameters(\'enableTelemetry\')]'
      name: ''
      runner: 'azdo'
      sku: 'Standard_B2s'
      sshPublicKey: ''
      tags: {}
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`adminUsername`](#parameter-buildvmdefinitionadminusername) | string | Admin username to create (e.g., azureuser). |
| [`runner`](#parameter-buildvmdefinitionrunner) | string | Which agent to install. |
| [`sku`](#parameter-buildvmdefinitionsku) | string | VM size SKU (e.g., Standard_B2s). |
| [`sshPublicKey`](#parameter-buildvmdefinitionsshpublickey) | string | SSH public key for the admin user. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`azdo`](#parameter-buildvmdefinitionazdo) | object | Azure DevOps settings (required when runner = azdo). |
| [`enableTelemetry`](#parameter-buildvmdefinitionenabletelemetry) | bool | Enable AVM telemetry. |
| [`github`](#parameter-buildvmdefinitiongithub) | object | GitHub settings (required when runner = github). |
| [`imageReference`](#parameter-buildvmdefinitionimagereference) | object | Marketplace image reference for the VM. |
| [`name`](#parameter-buildvmdefinitionname) | string | VM name. |
| [`osType`](#parameter-buildvmdefinitionostype) | string | OS type for the VM. |
| [`tags`](#parameter-buildvmdefinitiontags) | object | Tags to apply to the Build VM resource. |

### Parameter: `buildVmDefinition.adminUsername`

Admin username to create (e.g., azureuser).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.runner`

Which agent to install.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'azdo'
    'github'
  ]
  ```

### Parameter: `buildVmDefinition.sku`

VM size SKU (e.g., Standard_B2s).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.sshPublicKey`

SSH public key for the admin user.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.azdo`

Azure DevOps settings (required when runner = azdo).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`orgUrl`](#parameter-buildvmdefinitionazdoorgurl) | string | Azure DevOps organization URL (e.g., https://dev.azure.com/contoso). |
| [`pool`](#parameter-buildvmdefinitionazdopool) | string | Agent pool name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentName`](#parameter-buildvmdefinitionazdoagentname) | string | Agent name. |
| [`workFolder`](#parameter-buildvmdefinitionazdoworkfolder) | string | Working folder. |

### Parameter: `buildVmDefinition.azdo.orgUrl`

Azure DevOps organization URL (e.g., https://dev.azure.com/contoso).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.azdo.pool`

Agent pool name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.azdo.agentName`

Agent name.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.azdo.workFolder`

Working folder.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.enableTelemetry`

Enable AVM telemetry.

- Required: No
- Type: bool

### Parameter: `buildVmDefinition.github`

GitHub settings (required when runner = github).

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`owner`](#parameter-buildvmdefinitiongithubowner) | string | GitHub owner (org or user). |
| [`repo`](#parameter-buildvmdefinitiongithubrepo) | string | Repository name. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentName`](#parameter-buildvmdefinitiongithubagentname) | string | Runner name. |
| [`labels`](#parameter-buildvmdefinitiongithublabels) | string | Runner labels (comma-separated). |
| [`workFolder`](#parameter-buildvmdefinitiongithubworkfolder) | string | Working folder. |

### Parameter: `buildVmDefinition.github.owner`

GitHub owner (org or user).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.github.repo`

Repository name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.github.agentName`

Runner name.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.github.labels`

Runner labels (comma-separated).

- Required: No
- Type: string

### Parameter: `buildVmDefinition.github.workFolder`

Working folder.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.imageReference`

Marketplace image reference for the VM.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`offer`](#parameter-buildvmdefinitionimagereferenceoffer) | string | Offer name. |
| [`publisher`](#parameter-buildvmdefinitionimagereferencepublisher) | string | Publisher name. |
| [`sku`](#parameter-buildvmdefinitionimagereferencesku) | string | SKU name. |
| [`version`](#parameter-buildvmdefinitionimagereferenceversion) | string | Image version (e.g., latest). |

### Parameter: `buildVmDefinition.imageReference.offer`

Offer name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.imageReference.publisher`

Publisher name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.imageReference.sku`

SKU name.

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.imageReference.version`

Image version (e.g., latest).

- Required: Yes
- Type: string

### Parameter: `buildVmDefinition.name`

VM name.

- Required: No
- Type: string

### Parameter: `buildVmDefinition.osType`

OS type for the VM.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Linux'
    'Windows'
  ]
  ```

### Parameter: `buildVmDefinition.tags`

Tags to apply to the Build VM resource.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-buildvmdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `buildVmDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `containerAppsList`

List of Container Apps to create.

- Required: No
- Type: array
- Default:
  ```Bicep
  [
    {
      app_id: 'hello-world'
      external: true
      max_replicas: 1
      min_replicas: 1
      name: ''
      profile_name: 'default'
    }
  ]
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`app_id`](#parameter-containerappslistapp_id) | string |  Logical app identifier (used for Dapr and container name). |
| [`external`](#parameter-containerappslistexternal) | bool |  Whether to expose through the environment’s external ingress. |
| [`max_replicas`](#parameter-containerappslistmax_replicas) | int | Maximum number of replicas. |
| [`min_replicas`](#parameter-containerappslistmin_replicas) | int | Minimum number of replicas. |
| [`profile_name`](#parameter-containerappslistprofile_name) | string | Workload profile name to schedule to. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`name`](#parameter-containerappslistname) | string | Container App resource name. |

### Parameter: `containerAppsList.app_id`

 Logical app identifier (used for Dapr and container name).

- Required: Yes
- Type: string

### Parameter: `containerAppsList.external`

 Whether to expose through the environment’s external ingress.

- Required: No
- Type: bool

### Parameter: `containerAppsList.max_replicas`

Maximum number of replicas.

- Required: Yes
- Type: int

### Parameter: `containerAppsList.min_replicas`

Minimum number of replicas.

- Required: Yes
- Type: int

### Parameter: `containerAppsList.profile_name`

Workload profile name to schedule to.

- Required: Yes
- Type: string

### Parameter: `containerAppsList.name`

Container App resource name.

- Required: No
- Type: string

### Parameter: `deployGenAiAppBackingServices`

 Deploy GenAI app services; defaults to true.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `deployToggles`

 Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      aiFoundry: true
      apiManagement: true
      appConfig: true
      appInsights: true
      applicationGateway: true
      buildVm: true
      containerApps: true
      containerEnv: true
      containerRegistry: true
      cosmosDb: true
      firewall: true
      jumpVm: true
      keyVault: true
      logAnalytics: true
      searchService: true
      storageAccount: true
      virtualNetwork: true
      wafPolicy: true
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aiFoundry`](#parameter-deploytogglesaifoundry) | bool | Toggle to deploy AI Foundry (true) or not (false). |
| [`apiManagement`](#parameter-deploytogglesapimanagement) | bool | Toggle to deploy API Management (true) or not (false). |
| [`appConfig`](#parameter-deploytogglesappconfig) | bool | Toggle to deploy App Configuration (true) or not (false). |
| [`appInsights`](#parameter-deploytogglesappinsights) | bool | Toggle to deploy Application Insights (true) or not (false). |
| [`applicationGateway`](#parameter-deploytogglesapplicationgateway) | bool | Toggle to deploy Application Gateway (true) or not (false). |
| [`buildVm`](#parameter-deploytogglesbuildvm) | bool | Toggle to deploy Build VM (true) or not (false). |
| [`containerApps`](#parameter-deploytogglescontainerapps) | bool | Toggle to deploy Container Apps (true) or not (false). |
| [`containerEnv`](#parameter-deploytogglescontainerenv) | bool | Toggle to deploy Container Apps Environment (true) or not (false). |
| [`containerRegistry`](#parameter-deploytogglescontainerregistry) | bool | Toggle to deploy Azure Container Registry (true) or not (false). |
| [`cosmosDb`](#parameter-deploytogglescosmosdb) | bool | Toggle to deploy Cosmos DB (true) or not (false). |
| [`firewall`](#parameter-deploytogglesfirewall) | bool | Toggle to deploy Azure Firewall (true) or not (false). |
| [`jumpVm`](#parameter-deploytogglesjumpvm) | bool | Toggle to deploy Jump VM (true) or not (false). |
| [`keyVault`](#parameter-deploytoggleskeyvault) | bool | Toggle to deploy Key Vault (true) or not (false). |
| [`logAnalytics`](#parameter-deploytogglesloganalytics) | bool | Toggle to deploy Log Analytics (true) or not (false). |
| [`searchService`](#parameter-deploytogglessearchservice) | bool | Toggle to deploy Azure AI Search (true) or not (false). |
| [`storageAccount`](#parameter-deploytogglesstorageaccount) | bool | Toggle to deploy Storage Account (true) or not (false). |
| [`virtualNetwork`](#parameter-deploytogglesvirtualnetwork) | bool | Toggle to deploy a new Virtual Network (true) or not (false). |
| [`wafPolicy`](#parameter-deploytoggleswafpolicy) | bool | Toggle to deploy an Application Gateway WAF policy (true) or not (false). |

### Parameter: `deployToggles.aiFoundry`

Toggle to deploy AI Foundry (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.apiManagement`

Toggle to deploy API Management (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.appConfig`

Toggle to deploy App Configuration (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.appInsights`

Toggle to deploy Application Insights (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.applicationGateway`

Toggle to deploy Application Gateway (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.buildVm`

Toggle to deploy Build VM (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.containerApps`

Toggle to deploy Container Apps (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.containerEnv`

Toggle to deploy Container Apps Environment (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.containerRegistry`

Toggle to deploy Azure Container Registry (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.cosmosDb`

Toggle to deploy Cosmos DB (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.firewall`

Toggle to deploy Azure Firewall (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.jumpVm`

Toggle to deploy Jump VM (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.keyVault`

Toggle to deploy Key Vault (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.logAnalytics`

Toggle to deploy Log Analytics (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.searchService`

Toggle to deploy Azure AI Search (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.storageAccount`

Toggle to deploy Storage Account (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.virtualNetwork`

Toggle to deploy a new Virtual Network (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `deployToggles.wafPolicy`

Toggle to deploy an Application Gateway WAF policy (true) or not (false).

- Required: Yes
- Type: bool

### Parameter: `enableTelemetry`

 Enable module telemetry. See https://aka.ms/avm/telemetryinfo.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `firewallPolicyDefinition`

 Azure Firewall Policy configuration (only used if your deployment wires a policy).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      networkPolicyRuleCollectionGroupName: null
      networkPolicyRuleCollectionGroupPriority: 100
      networkRules: []
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`networkRules`](#parameter-firewallpolicydefinitionnetworkrules) | array | Network rules to include in the policy (can be empty). |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`networkPolicyRuleCollectionGroupName`](#parameter-firewallpolicydefinitionnetworkpolicyrulecollectiongroupname) | string | Name of the Network Rule Collection Group. |
| [`networkPolicyRuleCollectionGroupPriority`](#parameter-firewallpolicydefinitionnetworkpolicyrulecollectiongrouppriority) | int | Priority for the Network Rule Collection Group. |
| [`ruleCollectionGroups`](#parameter-firewallpolicydefinitionrulecollectiongroups) | array | List of custom Rule Collection Groups with collections and rules. |

### Parameter: `firewallPolicyDefinition.networkRules`

Network rules to include in the policy (can be empty).

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`destinationAddresses`](#parameter-firewallpolicydefinitionnetworkrulesdestinationaddresses) | array | Destination IP addresses. |
| [`destinationPorts`](#parameter-firewallpolicydefinitionnetworkrulesdestinationports) | array | Destination ports. |
| [`name`](#parameter-firewallpolicydefinitionnetworkrulesname) | string | Rule name. |
| [`protocols`](#parameter-firewallpolicydefinitionnetworkrulesprotocols) | array | Allowed protocols (e.g., TCP, UDP, ICMP, Any). |
| [`sourceAddresses`](#parameter-firewallpolicydefinitionnetworkrulessourceaddresses) | array | Source IP addresses. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-firewallpolicydefinitionnetworkrulesdescription) | string | Rule description. |

### Parameter: `firewallPolicyDefinition.networkRules.destinationAddresses`

Destination IP addresses.

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.networkRules.destinationPorts`

Destination ports.

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.networkRules.name`

Rule name.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.networkRules.protocols`

Allowed protocols (e.g., TCP, UDP, ICMP, Any).

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.networkRules.sourceAddresses`

Source IP addresses.

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.networkRules.description`

Rule description.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.networkPolicyRuleCollectionGroupName`

Name of the Network Rule Collection Group.

- Required: No
- Type: string

### Parameter: `firewallPolicyDefinition.networkPolicyRuleCollectionGroupPriority`

Priority for the Network Rule Collection Group.

- Required: No
- Type: int

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups`

List of custom Rule Collection Groups with collections and rules.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`collections`](#parameter-firewallpolicydefinitionrulecollectiongroupscollections) | array | Rule collections that belong to this group. |
| [`name`](#parameter-firewallpolicydefinitionrulecollectiongroupsname) | string | Name of the Rule Collection Group. |
| [`priority`](#parameter-firewallpolicydefinitionrulecollectiongroupspriority) | int | Priority of the Rule Collection Group (lower value = higher priority). |

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections`

Rule collections that belong to this group.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`action`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsaction) | string | Action to apply on the rule collection (Allow or Deny). |
| [`name`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsname) | string | Name of the rule collection. |
| [`rules`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrules) | array | List of rules contained in this rule collection. |

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.action`

Action to apply on the rule collection (Allow or Deny).

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Allow'
    'Deny'
  ]
  ```

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.name`

Name of the rule collection.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules`

List of rules contained in this rule collection.

- Required: Yes
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`destinationAddresses`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrulesdestinationaddresses) | array | Destination IP addresses. |
| [`destinationPorts`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrulesdestinationports) | array | Destination ports. |
| [`name`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrulesname) | string | Rule name. |
| [`protocols`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrulesprotocols) | array | Allowed protocols (e.g., TCP, UDP, ICMP, Any). |
| [`sourceAddresses`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrulessourceaddresses) | array | Source IP addresses. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`description`](#parameter-firewallpolicydefinitionrulecollectiongroupscollectionsrulesdescription) | string | Rule description. |

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules.destinationAddresses`

Destination IP addresses.

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules.destinationPorts`

Destination ports.

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules.name`

Rule name.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules.protocols`

Allowed protocols (e.g., TCP, UDP, ICMP, Any).

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules.sourceAddresses`

Source IP addresses.

- Required: Yes
- Type: array

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.collections.rules.description`

Rule description.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.name`

Name of the Rule Collection Group.

- Required: Yes
- Type: string

### Parameter: `firewallPolicyDefinition.ruleCollectionGroups.priority`

Priority of the Rule Collection Group (lower value = higher priority).

- Required: Yes
- Type: int

### Parameter: `flagPlatformLandingZone`

 Enable platform landing zone integration.

- Required: No
- Type: bool
- Default: `False`

### Parameter: `githubPat`

PAT used to request a GitHub runner registration token (when runner = github).

- Required: No
- Type: securestring
- Default: `''`

### Parameter: `jumpVmDefinition`

 Jump (bastion) VM configuration (Windows).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      adminUsername: 'azureuser'
      enableTelemetry: '[parameters(\'enableTelemetry\')]'
      name: ''
      sku: 'Standard_D2s_v5'
      tags: {}
      vmKeyVaultSecName: 'jump-admin-password'
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`adminUsername`](#parameter-jumpvmdefinitionadminusername) | string | Admin username. |
| [`enableTelemetry`](#parameter-jumpvmdefinitionenabletelemetry) | bool | Enable telemetry for helper scripts. |
| [`sku`](#parameter-jumpvmdefinitionsku) | string | VM size SKU (e.g., Standard_D2s_v5). |
| [`tags`](#parameter-jumpvmdefinitiontags) | object | Tags to apply to the Jump VM. |
| [`vmKeyVaultSecName`](#parameter-jumpvmdefinitionvmkeyvaultsecname) | string | Name of the admin password secret in the Bastion Key Vault. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`imageReference`](#parameter-jumpvmdefinitionimagereference) | object | Marketplace image reference for the VM. |
| [`name`](#parameter-jumpvmdefinitionname) | string | VM resource name. |
| [`osType`](#parameter-jumpvmdefinitionostype) | string | OS type for the VM. |

### Parameter: `jumpVmDefinition.adminUsername`

Admin username.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.enableTelemetry`

Enable telemetry for helper scripts.

- Required: Yes
- Type: bool

### Parameter: `jumpVmDefinition.sku`

VM size SKU (e.g., Standard_D2s_v5).

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.tags`

Tags to apply to the Jump VM.

- Required: Yes
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`>Any_other_property<`](#parameter-jumpvmdefinitiontags>any_other_property<) | string | Arbitrary key for each tag. |

### Parameter: `jumpVmDefinition.tags.>Any_other_property<`

Arbitrary key for each tag.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.vmKeyVaultSecName`

Name of the admin password secret in the Bastion Key Vault.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference`

Marketplace image reference for the VM.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`offer`](#parameter-jumpvmdefinitionimagereferenceoffer) | string | Offer name. |
| [`publisher`](#parameter-jumpvmdefinitionimagereferencepublisher) | string | Publisher name. |
| [`sku`](#parameter-jumpvmdefinitionimagereferencesku) | string | SKU name. |
| [`version`](#parameter-jumpvmdefinitionimagereferenceversion) | string | Image version (e.g., latest). |

### Parameter: `jumpVmDefinition.imageReference.offer`

Offer name.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference.publisher`

Publisher name.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference.sku`

SKU name.

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.imageReference.version`

Image version (e.g., latest).

- Required: Yes
- Type: string

### Parameter: `jumpVmDefinition.name`

VM resource name.

- Required: No
- Type: string

### Parameter: `jumpVmDefinition.osType`

OS type for the VM.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Linux'
    'Windows'
  ]
  ```

### Parameter: `networkIsolation`

Enable network isolation posture (Private Endpoints + Private DNS).

- Required: No
- Type: bool
- Default: `True`

### Parameter: `resourceIds`

 Existing resource IDs to reuse; leave empty to create new resources.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      apimServiceResourceId: ''
      appConfigResourceId: ''
      appInsightsResourceId: ''
      applicationGatewayResourceId: ''
      bastionHostResourceId: ''
      containerEnvResourceId: ''
      containerRegistryResourceId: ''
      dbAccountResourceId: ''
      firewallResourceId: ''
      groundingServiceResourceId: ''
      keyVaultResourceId: ''
      logAnalyticsWorkspaceResourceId: ''
      searchServiceResourceId: ''
      storageAccountResourceId: ''
      virtualNetworkResourceId: ''
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`apimServiceResourceId`](#parameter-resourceidsapimserviceresourceid) | string | Existing API Management service resource ID to reuse. |
| [`appConfigResourceId`](#parameter-resourceidsappconfigresourceid) | string | Existing App Configuration store resource ID to reuse. |
| [`appInsightsResourceId`](#parameter-resourceidsappinsightsresourceid) | string | Existing Application Insights resource ID to reuse. |
| [`applicationGatewayResourceId`](#parameter-resourceidsapplicationgatewayresourceid) | string | Existing Application Gateway resource ID to reuse. |
| [`bastionHostResourceId`](#parameter-resourceidsbastionhostresourceid) | string | Existing Azure Bastion resource ID to reuse; leave empty to skip. |
| [`containerEnvResourceId`](#parameter-resourceidscontainerenvresourceid) | string | Existing Container Apps Environment resource ID to reuse. |
| [`containerRegistryResourceId`](#parameter-resourceidscontainerregistryresourceid) | string | Existing Azure Container Registry resource ID to reuse. |
| [`dbAccountResourceId`](#parameter-resourceidsdbaccountresourceid) | string | Existing Cosmos DB account resource ID to reuse. |
| [`firewallResourceId`](#parameter-resourceidsfirewallresourceid) | string | Existing Azure Firewall resource ID to reuse. |
| [`groundingServiceResourceId`](#parameter-resourceidsgroundingserviceresourceid) | string | Existing Grounding service resource ID to reuse. |
| [`keyVaultResourceId`](#parameter-resourceidskeyvaultresourceid) | string | Existing Key Vault resource ID to reuse. |
| [`logAnalyticsWorkspaceResourceId`](#parameter-resourceidsloganalyticsworkspaceresourceid) | string | Existing Log Analytics Workspace resource ID to reuse. |
| [`searchServiceResourceId`](#parameter-resourceidssearchserviceresourceid) | string | Existing Azure AI Search service resource ID to reuse. |
| [`storageAccountResourceId`](#parameter-resourceidsstorageaccountresourceid) | string | Existing Storage Account resource ID to reuse. |
| [`virtualNetworkResourceId`](#parameter-resourceidsvirtualnetworkresourceid) | string | Existing VNet resource ID to reuse; leave empty to create a new VNet. |

### Parameter: `resourceIds.apimServiceResourceId`

Existing API Management service resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.appConfigResourceId`

Existing App Configuration store resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.appInsightsResourceId`

Existing Application Insights resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.applicationGatewayResourceId`

Existing Application Gateway resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.bastionHostResourceId`

Existing Azure Bastion resource ID to reuse; leave empty to skip.

- Required: Yes
- Type: string

### Parameter: `resourceIds.containerEnvResourceId`

Existing Container Apps Environment resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.containerRegistryResourceId`

Existing Azure Container Registry resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.dbAccountResourceId`

Existing Cosmos DB account resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.firewallResourceId`

Existing Azure Firewall resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.groundingServiceResourceId`

Existing Grounding service resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.keyVaultResourceId`

Existing Key Vault resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.logAnalyticsWorkspaceResourceId`

Existing Log Analytics Workspace resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.searchServiceResourceId`

Existing Azure AI Search service resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.storageAccountResourceId`

Existing Storage Account resource ID to reuse.

- Required: Yes
- Type: string

### Parameter: `resourceIds.virtualNetworkResourceId`

Existing VNet resource ID to reuse; leave empty to create a new VNet.

- Required: Yes
- Type: string

### Parameter: `resourceToken`

 Deterministic token for resource names; auto-generated if not provided.

- Required: No
- Type: string
- Default: `[toLower(uniqueString(subscription().id, resourceGroup().name, parameters('location')))]`

### Parameter: `shareResources`

Share services between the GenAI app and AI Foundry (Search, KV, Cosmos DB, Storage).

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      cosmosDb: false
      keyVault: false
      searchService: false
      storageAccount: false
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`cosmosDb`](#parameter-shareresourcescosmosdb) | bool | Share the Cosmos DB account across services. |
| [`keyVault`](#parameter-shareresourceskeyvault) | bool | Share the Key Vault across services. |
| [`searchService`](#parameter-shareresourcessearchservice) | bool | Share the Azure AI Search service across services. |
| [`storageAccount`](#parameter-shareresourcesstorageaccount) | bool | Share the Storage Account across services. |

### Parameter: `shareResources.cosmosDb`

Share the Cosmos DB account across services.

- Required: Yes
- Type: bool

### Parameter: `shareResources.keyVault`

Share the Key Vault across services.

- Required: Yes
- Type: bool

### Parameter: `shareResources.searchService`

Share the Azure AI Search service across services.

- Required: Yes
- Type: bool

### Parameter: `shareResources.storageAccount`

Share the Storage Account across services.

- Required: Yes
- Type: bool

### Parameter: `tags`

 Tags applied to all deployed resources.

- Required: No
- Type: object
- Default: `{}`

## Outputs

| Output | Type |
| :-- | :-- |
| `apimServiceResourceId` | string |
| `appConfigResourceId` | string |
| `applicationGatewayResourceId` | string |
| `applicationInsightsResourceId` | string |
| `containerEnvResourceId` | string |
| `containerRegistryResourceId` | string |
| `dbAccountResourceId` | string |
| `firewallResourceId` | string |
| `keyVaultResourceId` | string |
| `location` | string |
| `logAnalyticsWorkspaceResourceId` | string |
| `resourceGroupName` | string |
| `searchServiceResourceId` | string |
| `storageAccountResourceId` | string |
| `subscriptionId` | string |
| `tenantId` | string |
| `virtualNetworkResourceId` | string |
| `wafPolicyResourceId` | string |

## Cross-referenced modules

This section gives you an overview of all local-referenced module files (i.e., other modules that are referenced in this module) and all remote-referenced files (i.e., Bicep modules that are referenced from a Bicep Registry or Template Specs).

| Reference | Type |
| :-- | :-- |
| `br/public:avm/res/api-management/service:0.9.1` | Remote reference |
| `br/public:avm/res/app-configuration/configuration-store:0.9.1` | Remote reference |
| `br/public:avm/res/app/container-app:0.18.1` | Remote reference |
| `br/public:avm/res/app/managed-environment:0.11.3` | Remote reference |
| `br/public:avm/res/cognitive-services/account:0.12.0` | Remote reference |
| `br/public:avm/res/cognitive-services/account:0.13.2` | Remote reference |
| `br/public:avm/res/compute/virtual-machine:0.18.0` | Remote reference |
| `br/public:avm/res/container-registry/registry:0.9.3` | Remote reference |
| `br/public:avm/res/document-db/database-account:0.15.1` | Remote reference |
| `br/public:avm/res/insights/component:0.6.0` | Remote reference |
| `br/public:avm/res/key-vault/vault:0.13.3` | Remote reference |
| `br/public:avm/res/network/application-gateway-web-application-firewall-policy:0.2.0` | Remote reference |
| `br/public:avm/res/network/application-gateway:0.7.1` | Remote reference |
| `br/public:avm/res/network/azure-firewall:0.8.0` | Remote reference |
| `br/public:avm/res/network/firewall-policy:0.3.1` | Remote reference |
| `br/public:avm/res/network/private-dns-zone:0.7.1` | Remote reference |
| `br/public:avm/res/network/private-endpoint:0.11.0` | Remote reference |
| `br/public:avm/res/network/public-ip-address:0.9.0` | Remote reference |
| `br/public:avm/res/network/virtual-network:0.7.0` | Remote reference |
| `br/public:avm/res/operational-insights/workspace:0.12.0` | Remote reference |
| `br/public:avm/res/search/search-service:0.11.1` | Remote reference |
| `br/public:avm/res/storage/storage-account:0.26.2` | Remote reference |
| `br/public:avm/utl/types/avm-common-types:0.6.0` | Remote reference |

## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the [repository](https://aka.ms/avm/telemetry). There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
