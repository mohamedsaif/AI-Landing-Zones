using '../bicep/infra/main.bicep'

// ====================================================================================================
// COMPREHENSIVE AI/ML LANDING ZONE PARAMETER FILE
// ====================================================================================================
// This parameter file demonstrates ALL available configuration options for the AI/ML Landing Zone.
// Uncomment and customize sections as needed for your specific deployment scenario.
// ====================================================================================================

// ====================================================================================================
// 1. DEPLOYMENT TOGGLES (REQUIRED)
// ====================================================================================================
// Control which resources are deployed. Set to true to deploy, false to skip.

@description('Per-service deployment toggles.')
param deployToggles = {
  // Network Security Groups
  acaEnvironmentNsg: true              // NSG for Azure Container Apps environment subnet
  agentNsg: true                       // NSG for agent (workload) subnet
  apiManagementNsg: true              // NSG for API Management subnet
  applicationGatewayNsg: true         // NSG for Application Gateway subnet
  bastionNsg: true                    // NSG for Bastion host subnet
  devopsBuildAgentsNsg: true          // NSG for DevOps build agents subnet
  jumpboxNsg: true                    // NSG for jumpbox subnet
  peNsg: true                         // NSG for private endpoints subnet

  // Networking Infrastructure
  virtualNetwork: true                // Virtual Network and subnets
  applicationGatewayPublicIp: true    // Public IP for Application Gateway
  applicationGateway: true            // Application Gateway (Layer 7 load balancer)
  wafPolicy: true                     // Web Application Firewall policy
  firewall: true                      // Azure Firewall
  bastionHost: true                   // Azure Bastion for secure VM access

  // AI/ML Services
  searchService: true                 // Azure AI Search
  cosmosDb: true                      // Cosmos DB for data storage
  storageAccount: true                // Storage Account for blobs

  // Platform Services
  logAnalytics: true                  // Log Analytics workspace
  appInsights: true                   // Application Insights
  keyVault: true                      // Key Vault for secrets
  appConfig: true                     // App Configuration store
  apiManagement: true                 // API Management service

  // Container Platform
  containerRegistry: true             // Azure Container Registry
  containerEnv: true                  // Container Apps Environment
  containerApps: true                 // Container Apps

  // Compute
  buildVm: true                       // Build VM for CI/CD tasks
  jumpVm: true                        // Jump VM for secure access

  // Additional Services
  groundingWithBingSearch: true       // Bing Search for grounding
}

// ====================================================================================================
// 2. GLOBAL CONFIGURATION (OPTIONAL)
// ====================================================================================================

@description('Optional. Azure region for all resources. Defaults to resource group location.')
// param location = 'eastus2'

@description('Optional. Deterministic token for resource names (auto-generated if not provided).')
// param resourceToken = 'mytoken123'

@description('Optional. Base name to seed resource names (defaults to a 12-char token).')
// param baseName = 'aimlzone'

@description('Optional. Enable/Disable usage telemetry for module.')
// param enableTelemetry = true

@description('Optional. Tags to apply to all resources.')
// param tags = {
//   Environment: 'Production'
//   Project: 'AI-ML-LZ'
//   CostCenter: '12345'
//   Owner: 'ai-team@contoso.com'
// }

// ====================================================================================================
// 3. PLATFORM LANDING ZONE INTEGRATION (OPTIONAL)
// ====================================================================================================

@description('Enable platform landing zone integration. When true, private DNS zones and private endpoints are managed by the platform landing zone.')
param flagPlatformLandingZone = false

// ====================================================================================================
// 4. EXISTING RESOURCE IDS (OPTIONAL)
// ====================================================================================================
// Provide resource IDs to reuse existing resources instead of creating new ones.

@description('Existing resource IDs (empty means create new).')
param resourceIds = {}

// Example of reusing existing resources:
// param resourceIds = {
//   vnetResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet-name>'
//   logAnalyticsResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace>'
//   appInsightsResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Insights/components/<appinsights>'
//   containerRegistryResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.ContainerRegistry/registries/<acr>'
//   containerEnvResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.App/managedEnvironments/<env>'
//   keyVaultResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.KeyVault/vaults/<kv>'
//   storageAccountResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Storage/storageAccounts/<sa>'
//   cosmosDbResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.DocumentDB/databaseAccounts/<cosmos>'
//   aiSearchResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Search/searchServices/<search>'
//   appConfigResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.AppConfiguration/configurationStores/<appconfig>'
//   apimResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.ApiManagement/service/<apim>'
//   applicationGatewayPublicIpResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/publicIPAddresses/<pip>'
//   firewallPublicIpResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/publicIPAddresses/<pip-fw>'
//   agentNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg>'
//   peNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-pe>'
//   applicationGatewayNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-appgw>'
//   apiManagementNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-apim>'
//   acaEnvironmentNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-aca>'
//   jumpboxNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-jump>'
//   devopsBuildAgentsNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-build>'
//   bastionNsgResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/networkSecurityGroups/<nsg-bastion>'
//   wafPolicyResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies/<waf>'
//   applicationGatewayResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/applicationGateways/<appgw>'
//   firewallPolicyResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/firewallPolicies/<fwpolicy>'
//   firewallResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/azureFirewalls/<fw>'
// }

// ====================================================================================================
// 5. PRIVATE DNS ZONES CONFIGURATION (OPTIONAL)
// ====================================================================================================
// Configure Private DNS Zones for private endpoint resolution.
// Use when NOT in platform landing zone mode.

// param privateDnsZonesDefinition = {
//   allowInternetResolutionFallback: false    // Allow fallback to public DNS if private resolution fails
//   createNetworkLinks: true                  // Create VNet links for DNS zones
//   cognitiveservicesZoneId: ''              // Resource ID of existing Cognitive Services DNS zone
//   apimZoneId: ''                           // Resource ID of existing APIM DNS zone
//   openaiZoneId: ''                         // Resource ID of existing OpenAI DNS zone
//   aiServicesZoneId: ''                     // Resource ID of existing AI Services DNS zone
//   searchZoneId: ''                         // Resource ID of existing Search DNS zone
//   cosmosSqlZoneId: ''                      // Resource ID of existing Cosmos DB DNS zone
//   blobZoneId: ''                           // Resource ID of existing Blob Storage DNS zone
//   keyVaultZoneId: ''                       // Resource ID of existing Key Vault DNS zone
//   appConfigZoneId: ''                      // Resource ID of existing App Config DNS zone
//   containerAppsZoneId: ''                  // Resource ID of existing Container Apps DNS zone
//   acrZoneId: ''                            // Resource ID of existing ACR DNS zone
//   appInsightsZoneId: ''                    // Resource ID of existing App Insights DNS zone
//   tags: {
//     Environment: 'Production'
//   }
// }

// Example for Platform Landing Zone with existing DNS zones:
// param privateDnsZonesDefinition = {
//   allowInternetResolutionFallback: false
//   createNetworkLinks: false
//   cognitiveservicesZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.cognitiveservices.azure.com'
//   openaiZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.openai.azure.com'
//   aiServicesZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.services.ai.azure.com'
//   searchZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.search.windows.net'
//   cosmosSqlZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.documents.azure.com'
//   blobZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
//   keyVaultZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net'
//   appConfigZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azconfig.io'
//   containerAppsZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.eastus2.azurecontainerapps.io'
//   acrZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io'
//   apimZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azure-api.net'
// }

// ====================================================================================================
// 6. NETWORK CONFIGURATION (OPTIONAL)
// ====================================================================================================

// 6.1 Virtual Network Definition
// Define a new VNet with custom address spaces and subnets

// param vNetDefinition = {
//   name: 'vnet-aiml-prod'
//   addressPrefixes: ['10.0.0.0/16']
//   subnets: [
//     {
//       name: 'agent-subnet'
//       addressPrefix: '10.0.0.0/24'
//       delegation: 'Microsoft.App/environments'
//       serviceEndpoints: ['Microsoft.CognitiveServices']
//     }
//     {
//       name: 'pe-subnet'
//       addressPrefix: '10.0.1.0/24'
//       serviceEndpoints: ['Microsoft.AzureCosmosDB', 'Microsoft.Storage']
//       privateEndpointNetworkPolicies: 'Disabled'
//     }
//     {
//       name: 'aca-env-subnet'
//       addressPrefix: '10.0.2.0/23'
//       delegation: 'Microsoft.App/environments'
//     }
//     {
//       name: 'appgw-subnet'
//       addressPrefix: '10.0.4.0/24'
//     }
//     {
//       name: 'apim-subnet'
//       addressPrefix: '10.0.5.0/24'
//     }
//     {
//       name: 'firewall-subnet'
//       addressPrefix: '10.0.6.0/24'
//     }
//     {
//       name: 'bastion-subnet'
//       addressPrefix: '10.0.7.0/26'
//     }
//     {
//       name: 'jumpbox-subnet'
//       addressPrefix: '10.0.8.0/27'
//     }
//     {
//       name: 'devops-agents-subnet'
//       addressPrefix: '10.0.9.0/27'
//     }
//   ]
//   enableDdosProtection: false
//   dnsServers: []
//   tags: {}
// }

// 6.2 Existing VNet Subnet Configuration
// Use when connecting to an existing VNet

// param existingVNetSubnetsDefinition = {
//   existingVNetName: 'existing-vnet-name'
//   useDefaultSubnets: false
//   subnets: [
//     {
//       name: 'agent-subnet'
//       addressPrefix: '192.168.0.0/27'
//       delegation: 'Microsoft.App/environments'
//       serviceEndpoints: ['Microsoft.CognitiveServices']
//     }
//     {
//       name: 'pe-subnet'
//       addressPrefix: '192.168.0.32/27'
//       serviceEndpoints: ['Microsoft.AzureCosmosDB']
//       privateEndpointNetworkPolicies: 'Disabled'
//     }
//   ]
// }

// 6.3 Network Security Group Definitions
// Customize NSG rules for each subnet

// param nsgDefinitions = {
//   agent: {
//     securityRules: [
//       {
//         name: 'AllowHTTPS'
//         properties: {
//           protocol: 'Tcp'
//           sourcePortRange: '*'
//           destinationPortRange: '443'
//           sourceAddressPrefix: '*'
//           destinationAddressPrefix: '*'
//           access: 'Allow'
//           priority: 100
//           direction: 'Inbound'
//         }
//       }
//     ]
//   }
//   pe: {
//     securityRules: []
//   }
//   applicationGateway: {
//     securityRules: []
//   }
//   apiManagement: {
//     securityRules: []
//   }
//   acaEnvironment: {
//     securityRules: []
//   }
//   jumpbox: {
//     securityRules: []
//   }
//   devopsBuildAgents: {
//     securityRules: []
//   }
//   bastion: {
//     securityRules: []
//   }
// }

// 6.4 Hub VNet Peering Configuration
// Configure peering with a hub VNet

// param hubVnetPeeringDefinition = {
//   hubVnetResourceId: '/subscriptions/<sub-id>/resourceGroups/<hub-rg>/providers/Microsoft.Network/virtualNetworks/<hub-vnet>'
//   allowForwardedTraffic: true
//   allowGatewayTransit: false
//   allowVirtualNetworkAccess: true
//   useRemoteGateways: false
//   enableHubToSpokeReversePeering: true
//   reversePeeringAllowForwardedTraffic: true
//   reversePeeringAllowGatewayTransit: true
//   reversePeeringAllowVirtualNetworkAccess: true
//   reversePeeringUseRemoteGateways: false
// }

// 6.5 Public IP Configurations

// param appGatewayPublicIp = {
//   name: 'pip-appgw-aiml'
//   zones: [1, 2, 3]
//   publicIPAllocationMethod: 'Static'
//   skuName: 'Standard'
//   skuTier: 'Regional'
// }

// param firewallPublicIp = {
//   name: 'pip-fw-aiml'
//   zones: [1, 2, 3]
//   publicIPAllocationMethod: 'Static'
//   skuName: 'Standard'
//   skuTier: 'Regional'
// }

// ====================================================================================================
// 7. PRIVATE DNS ZONE DEFINITIONS (OPTIONAL)
// ====================================================================================================
// Individual DNS zone configurations for each service

// param apimPrivateDnsZoneDefinition = {
//   name: 'privatelink.azure-api.net'
//   location: 'global'
//   tags: {}
// }

// param cognitiveServicesPrivateDnsZoneDefinition = {
//   name: 'privatelink.cognitiveservices.azure.com'
//   location: 'global'
// }

// param openAiPrivateDnsZoneDefinition = {
//   name: 'privatelink.openai.azure.com'
//   location: 'global'
// }

// param aiServicesPrivateDnsZoneDefinition = {
//   name: 'privatelink.services.ai.azure.com'
//   location: 'global'
// }

// param searchPrivateDnsZoneDefinition = {
//   name: 'privatelink.search.windows.net'
//   location: 'global'
// }

// param cosmosPrivateDnsZoneDefinition = {
//   name: 'privatelink.documents.azure.com'
//   location: 'global'
// }

// param blobPrivateDnsZoneDefinition = {
//   name: 'privatelink.blob.core.windows.net'
//   location: 'global'
// }

// param keyVaultPrivateDnsZoneDefinition = {
//   name: 'privatelink.vaultcore.azure.net'
//   location: 'global'
// }

// param appConfigPrivateDnsZoneDefinition = {
//   name: 'privatelink.azconfig.io'
//   location: 'global'
// }

// param containerAppsPrivateDnsZoneDefinition = {
//   name: 'privatelink.eastus2.azurecontainerapps.io'
//   location: 'global'
// }

// param acrPrivateDnsZoneDefinition = {
//   name: 'privatelink.azurecr.io'
//   location: 'global'
// }

// param appInsightsPrivateDnsZoneDefinition = {
//   name: 'privatelink.monitor.azure.com'
//   location: 'global'
// }

// ====================================================================================================
// 8. PRIVATE ENDPOINT DEFINITIONS (OPTIONAL)
// ====================================================================================================
// Configure private endpoints for each service

// param appConfigPrivateEndpointDefinition = {
//   subnetResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>/subnets/pe-subnet'
//   privateDnsZoneResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azconfig.io'
// }

// param apimPrivateEndpointDefinition = {}
// param containerAppEnvPrivateEndpointDefinition = {}
// param acrPrivateEndpointDefinition = {}
// param storageBlobPrivateEndpointDefinition = {}
// param cosmosPrivateEndpointDefinition = {}
// param searchPrivateEndpointDefinition = {}
// param keyVaultPrivateEndpointDefinition = {}

// ====================================================================================================
// 9. OBSERVABILITY (OPTIONAL)
// ====================================================================================================

// 9.1 Log Analytics Workspace
// param logAnalyticsDefinition = {
//   name: 'log-aiml-prod'
//   sku: 'PerGB2018'
//   dailyQuotaGb: 10
//   dataRetention: 30
//   publicNetworkAccessForIngestion: 'Enabled'
//   publicNetworkAccessForQuery: 'Enabled'
//   tags: {}
// }

// 9.2 Application Insights
// param appInsightsDefinition = {
//   name: 'appi-aiml-prod'
//   kind: 'web'
//   applicationType: 'web'
//   retentionInDays: 90
//   samplingPercentage: 100
//   publicNetworkAccessForIngestion: 'Enabled'
//   publicNetworkAccessForQuery: 'Enabled'
// }

// ====================================================================================================
// 10. CONTAINER PLATFORM (OPTIONAL)
// ====================================================================================================

// 10.1 Container Apps Environment
// param containerAppEnvDefinition = {
//   name: 'cae-aiml-prod'
//   zoneRedundant: true
//   workloadProfiles: [
//     {
//       name: 'Consumption'
//       workloadProfileType: 'Consumption'
//     }
//   ]
//   enableTelemetry: true
// }

// 10.2 Container Registry
// param containerRegistryDefinition = {
//   name: 'cracaimlprod'
//   acrSku: 'Premium'
//   adminUserEnabled: false
//   publicNetworkAccess: 'Disabled'
//   zoneRedundancy: 'Enabled'
//   trustPolicyStatus: 'enabled'
//   retentionPolicy: {
//     days: 30
//     status: 'enabled'
//   }
// }

// 10.3 Container Apps List
// param containerAppsList = [
//   {
//     name: 'ca-frontend'
//     environmentId: '<container-env-resource-id>'
//     workloadProfileName: 'Consumption'
//     ingressExternal: true
//     ingressTargetPort: 80
//     ingressTransport: 'http'
//     scaleMinReplicas: 1
//     scaleMaxReplicas: 10
//     containers: [
//       {
//         name: 'frontend'
//         image: 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
//         resources: {
//           cpu: '0.5'
//           memory: '1Gi'
//         }
//       }
//     ]
//   }
// ]

// ====================================================================================================
// 11. STORAGE (OPTIONAL)
// ====================================================================================================

// param storageAccountDefinition = {
//   name: 'staaimlprod'
//   kind: 'StorageV2'
//   skuName: 'Standard_ZRS'
//   accessTier: 'Hot'
//   allowBlobPublicAccess: false
//   minimumTlsVersion: 'TLS1_2'
//   publicNetworkAccess: 'Disabled'
//   networkAcls: {
//     defaultAction: 'Deny'
//     bypass: 'AzureServices'
//   }
//   blobServices: {
//     containers: [
//       {
//         name: 'data'
//         publicAccess: 'None'
//       }
//     ]
//   }
// }

// ====================================================================================================
// 12. APP CONFIGURATION (OPTIONAL)
// ====================================================================================================

// param appConfigurationDefinition = {
//   name: 'appcs-aiml-prod'
//   sku: 'Standard'
//   disableLocalAuth: false
//   enablePurgeProtection: true
//   publicNetworkAccess: 'Disabled'
// }

// ====================================================================================================
// 13. COSMOS DB (OPTIONAL)
// ====================================================================================================

// param cosmosDbDefinition = {
//   name: 'cosmos-aiml-prod'
//   databaseAccountOfferType: 'Standard'
//   locations: [
//     {
//       locationName: 'East US 2'
//       failoverPriority: 0
//       isZoneRedundant: true
//     }
//   ]
//   publicNetworkAccess: 'Disabled'
//   enableAutomaticFailover: true
//   enableMultipleWriteLocations: false
//   consistencyLevel: 'Session'
//   sqlDatabases: [
//     {
//       name: 'aiml-db'
//       containers: [
//         {
//           name: 'items'
//           partitionKeyPath: '/id'
//         }
//       ]
//     }
//   ]
// }

// ====================================================================================================
// 14. KEY VAULT (OPTIONAL)
// ====================================================================================================

// param keyVaultDefinition = {
//   name: 'kv-aiml-prod'
//   sku: 'premium'
//   enableRbacAuthorization: true
//   enabledForDeployment: false
//   enabledForDiskEncryption: false
//   enabledForTemplateDeployment: false
//   enableSoftDelete: true
//   softDeleteRetentionInDays: 90
//   enablePurgeProtection: true
//   publicNetworkAccess: 'Disabled'
//   networkAcls: {
//     defaultAction: 'Deny'
//     bypass: 'AzureServices'
//   }
// }

// ====================================================================================================
// 15. AI SEARCH (OPTIONAL)
// ====================================================================================================

// param aiSearchDefinition = {
//   name: 'srch-aiml-prod'
//   sku: 'standard'
//   replicaCount: 1
//   partitionCount: 1
//   hostingMode: 'default'
//   publicNetworkAccess: 'disabled'
//   semanticSearch: 'standard'
// }

// ====================================================================================================
// 16. API MANAGEMENT (OPTIONAL)
// ====================================================================================================

// param apimDefinition = {
//   name: 'apim-aiml-prod'
//   sku: 'Developer'
//   capacity: 1
//   publisherEmail: 'admin@contoso.com'
//   publisherName: 'Contoso AI Team'
//   publicNetworkAccess: 'Enabled'
//   virtualNetworkType: 'Internal'
//   disableGateway: false
// }

// ====================================================================================================
// 17. AI FOUNDRY (OPTIONAL)
// ====================================================================================================
// Azure AI Foundry (Azure AI Studio) configuration

// param aiFoundryDefinition = {
//   baseName: 'aifoundry'
//   enableTelemetry: true
//   includeAssociatedResources: true
//   location: 'eastus2'
//   privateEndpointSubnetResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>/subnets/pe-subnet'
//   tags: {}
//   
//   // AI Foundry Account Configuration
//   aiFoundryConfiguration: {
//     accountName: 'aifoundry-aiml-prod'
//     allowProjectManagement: true
//     createCapabilityHosts: false
//     disableLocalAuth: false
//     sku: 'S0'
//     
//     // Networking for AI Foundry
//     networking: {
//       aiServicesPrivateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.services.ai.azure.com'
//       cognitiveServicesPrivateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.cognitiveservices.azure.com'
//       openAiPrivateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.openai.azure.com'
//       agentServiceSubnetResourceId: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>/subnets/agent-subnet'
//     }
//     
//     // Default Project
//     project: {
//       name: 'aiml-project'
//       displayName: 'AI/ML Landing Zone Project'
//       description: 'Default AI Foundry project for AI/ML workloads'
//     }
//   }
//   
//   // AI Model Deployments
//   aiModelDeployments: [
//     {
//       name: 'gpt-4o'
//       model: {
//         format: 'OpenAI'
//         name: 'gpt-4o'
//         version: '2024-08-06'
//       }
//       sku: {
//         name: 'Standard'
//         capacity: 20
//       }
//     }
//     {
//       name: 'text-embedding-ada-002'
//       model: {
//         format: 'OpenAI'
//         name: 'text-embedding-ada-002'
//         version: '2'
//       }
//       sku: {
//         name: 'Standard'
//         capacity: 10
//       }
//     }
//   ]
//   
//   // Associated Resources Configuration
//   aiSearchConfiguration: {
//     name: 'srch-aifoundry'
//     privateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.search.windows.net'
//   }
//   
//   cosmosDbConfiguration: {
//     name: 'cosmos-aifoundry'
//     privateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.documents.azure.com'
//   }
//   
//   keyVaultConfiguration: {
//     name: 'kv-aifoundry'
//     privateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net'
//   }
//   
//   storageAccountConfiguration: {
//     name: 'staifoundry'
//     blobPrivateDnsZoneResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
//   }
// }

// ====================================================================================================
// 18. BING SEARCH GROUNDING (OPTIONAL)
// ====================================================================================================

// param groundingWithBingDefinition = {
//   name: 'bing-aiml-prod'
//   sku: 'S1'
//   kind: 'Bing.Search.v7'
//   location: 'global'
// }

// ====================================================================================================
// 19. APPLICATION GATEWAY & WAF (OPTIONAL)
// ====================================================================================================

// 19.1 WAF Policy
// param wafPolicyDefinition = {
//   name: 'waf-aiml-prod'
//   policySettings: {
//     mode: 'Prevention'
//     state: 'Enabled'
//     requestBodyCheck: true
//     maxRequestBodySizeInKb: 128
//     fileUploadLimitInMb: 100
//   }
//   managedRules: {
//     managedRuleSets: [
//       {
//         ruleSetType: 'OWASP'
//         ruleSetVersion: '3.2'
//       }
//     ]
//   }
// }

// 19.2 Application Gateway
// param appGatewayDefinition = {
//   name: 'appgw-aiml-prod'
//   sku: 'WAF_v2'
//   autoscaleMinCapacity: 2
//   autoscaleMaxCapacity: 10
//   availabilityZones: [1, 2, 3]
//   enableHttp2: true
//   gatewayIPConfigurations: [
//     {
//       name: 'appgw-ip-config'
//       properties: {
//         subnet: {
//           id: '/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>/subnets/appgw-subnet'
//         }
//       }
//     }
//   ]
// }

// ====================================================================================================
// 20. AZURE FIREWALL (OPTIONAL)
// ====================================================================================================

// 20.1 Firewall Policy
// param firewallPolicyDefinition = {
//   name: 'fwpol-aiml-prod'
//   threatIntelMode: 'Alert'
//   tier: 'Premium'
//   enableProxy: true
// }

// 20.2 Azure Firewall
// param firewallDefinition = {
//   name: 'fw-aiml-prod'
//   sku: 'AZFW_VNet'
//   tier: 'Premium'
//   zones: [1, 2, 3]
// }

// ====================================================================================================
// 21. VIRTUAL MACHINES (OPTIONAL)
// ====================================================================================================

// 21.1 Build VM
// param buildVmDefinition = {
//   name: 'vm-build-aiml'
//   vmSize: 'Standard_D4s_v5'
//   osType: 'Linux'
//   imageReference: {
//     publisher: 'Canonical'
//     offer: '0001-com-ubuntu-server-jammy'
//     sku: '22_04-lts-gen2'
//     version: 'latest'
//   }
//   osDisk: {
//     diskSizeGB: 128
//     managedDisk: {
//       storageAccountType: 'Premium_LRS'
//     }
//   }
//   adminUsername: 'azureuser'
//   disablePasswordAuthentication: true
//   publicKeys: [
//     {
//       keyData: 'ssh-rsa AAAAB3...'
//       path: '/home/azureuser/.ssh/authorized_keys'
//     }
//   ]
// }

// param buildVmMaintenanceDefinition = {
//   name: 'maint-build-vm'
//   maintenanceScope: 'InGuestPatch'
//   maintenanceWindow: {
//     startDateTime: '2024-01-01 00:00'
//     duration: '03:00'
//     timeZone: 'UTC'
//     recurEvery: '1Week'
//   }
// }

// 21.2 Jump VM
// param jumpVmDefinition = {
//   name: 'vm-jump-aiml'
//   vmSize: 'Standard_D2s_v5'
//   osType: 'Windows'
//   imageReference: {
//     publisher: 'MicrosoftWindowsServer'
//     offer: 'WindowsServer'
//     sku: '2022-datacenter-azure-edition'
//     version: 'latest'
//   }
//   osDisk: {
//     diskSizeGB: 128
//     managedDisk: {
//       storageAccountType: 'Premium_LRS'
//     }
//   }
//   adminUsername: 'azureuser'
//   adminPassword: '<secure-password>'
// }

// param jumpVmMaintenanceDefinition = {
//   name: 'maint-jump-vm'
//   maintenanceScope: 'InGuestPatch'
//   maintenanceWindow: {
//     startDateTime: '2024-01-01 00:00'
//     duration: '03:00'
//     timeZone: 'UTC'
//     recurEvery: '1Week'
//   }
// }

// ====================================================================================================
// END OF CONFIGURATION
// ====================================================================================================
