@export()
@description('Optional existing resource IDs to reuse; leave empty to create new resources.')
type ResourceIdsType = {
  @description('Optional. Existing VNet resource ID to reuse; leave empty to create a new VNet.')
  virtualNetworkResourceId: string

  @description('Optional. Existing Azure Bastion resource ID to reuse; leave empty to skip.')
  bastionHostResourceId: string

  @description('Optional. Existing Application Insights resource ID to reuse.')
  appInsightsResourceId: string

  @description('Optional. Existing Log Analytics Workspace resource ID to reuse.')
  logAnalyticsWorkspaceResourceId: string

  @description('Optional. Existing App Configuration store resource ID to reuse.')
  appConfigResourceId: string

  @description('Optional. Existing Key Vault resource ID to reuse.')
  keyVaultResourceId: string

  @description('Optional. Existing Storage Account resource ID to reuse.')
  storageAccountResourceId: string

  @description('Optional. Existing Cosmos DB account resource ID to reuse.')
  dbAccountResourceId: string

  @description('Optional. Existing Azure AI Search service resource ID to reuse.')
  searchServiceResourceId: string

  @description('Optional. Existing Grounding service resource ID to reuse.')
  groundingServiceResourceId: string

  @description('Optional. Existing Container Apps Environment resource ID to reuse.')
  containerEnvResourceId: string

  @description('Optional. Existing Azure Container Registry resource ID to reuse.')
  containerRegistryResourceId: string

  @description('Optional. Existing API Management service resource ID to reuse.')
  apimServiceResourceId: string

  @description('Optional. Existing Application Gateway resource ID to reuse.')
  applicationGatewayResourceId: string

  @description('Optional. Existing Azure Firewall resource ID to reuse.')
  firewallResourceId: string
}

@export()
@description('Per-service deployment toggles; set false to skip creating that service (reusing via resourceIds still works).')
type DeployTogglesType = {
  @description('Required. Toggle to deploy Log Analytics (true) or not (false).')
  logAnalytics: bool

  @description('Required. Toggle to deploy Application Insights (true) or not (false).')
  appInsights: bool

  @description('Required. Toggle to deploy Container Apps Environment (true) or not (false).')
  containerEnv: bool

  @description('Required. Toggle to deploy Azure Container Registry (true) or not (false).')
  containerRegistry: bool

  @description('Required. Toggle to deploy Cosmos DB (true) or not (false).')
  cosmosDb: bool

  @description('Required. Toggle to deploy Key Vault (true) or not (false).')
  keyVault: bool

  @description('Required. Toggle to deploy Storage Account (true) or not (false).')
  storageAccount: bool

  @description('Required. Toggle to deploy Azure AI Search (true) or not (false).')
  searchService: bool

  @description('Required. Toggle to deploy Bing Grounding with Search (true) or not (false).')
  groundingWithBingSearch: bool

  @description('Required. Toggle to deploy App Configuration (true) or not (false).')
  appConfig: bool

  @description('Required. Toggle to deploy API Management (true) or not (false).')
  apiManagement: bool

  @description('Required. Toggle to deploy Application Gateway (true) or not (false).')
  applicationGateway: bool

  @description('Required. Toggle to deploy Azure Firewall (true) or not (false).')
  firewall: bool

  @description('Required. Toggle to deploy Container Apps (true) or not (false).')
  containerApps: bool

  @description('Required. Toggle to deploy Build VM (true) or not (false).')
  buildVm: bool

  @description('Required. Toggle to deploy Jump VM (true) or not (false).')
  jumpVm: bool

  @description('Required. Toggle to deploy a new Virtual Network (true) or not (false).')
  virtualNetwork: bool

  @description('Required. Toggle to deploy an Application Gateway WAF policy (true) or not (false).')
  wafPolicy: bool
}

@export()
@description('Configuration object for one subnet.')
type VNetSubnetType = {
  @description('Required. Enables (true) or disables (false) creation/use of this subnet.')
  enabled: bool

  @description('Required. Subnet name.')
  name: string

  @description('Required. Subnet address prefix in CIDR notation (e.g., 10.0.1.0/24).')
  addressPrefix: string

  @description('Optional. Service delegation for the subnet (resource provider/type).')
  delegation: string?

  @description('Optional. Service endpoints to enable for this subnet.')
  serviceEndpoints: string[]?

  @description('Optional. Resource ID of an associated NAT Gateway.')
  natGatewayResourceId: string?

  @description('Optional. Whether private endpoint network policies are Enabled or Disabled.')
  privateEndpointNetworkPolicies: 'Enabled' | 'Disabled'?

  @description('Optional. Whether private link service network policies are Enabled or Disabled.')
  privateLinkServiceNetworkPolicies: 'Enabled' | 'Disabled'?
}

@export()
@description('Peering with another VNet (hub/spoke).')
type VNetPeeringConfigurationType = {
  @description('Required. Resource ID of the peer virtual network.')
  peerVnetResourceId: string

  @description('Optional. Hub firewall private IP address used for routing (if applicable).')
  firewallIpAddress: string?

  @description('Optional. Name of the spoke-to-hub peering.')
  name: string?

  @description('Required. Allow forwarded traffic across the peering.')
  allowForwardedTraffic: bool

  @description('Required. Allow gateway transit across the peering.')
  allowGatewayTransit: bool

  @description('Required. Allow virtual network access across the peering.')
  allowVirtualNetworkAccess: bool

  @description('Required. Create the reverse peering from hub back to this VNet.')
  createReversePeering: bool

  @description('Required. Reverse peering: allow forwarded traffic.')
  reverseAllowForwardedTraffic: bool

  @description('Required. Reverse peering: allow gateway transit.')
  reverseAllowGatewayTransit: bool

  @description('Required. Reverse peering: allow virtual network access.')
  reverseAllowVirtualNetworkAccess: bool

  @description('Optional. Name of the reverse peering (hub->spoke).')
  reverseName: string?

  @description('Required. Reverse peering: use remote gateways.')
  reverseUseRemoteGateways: bool

  @description('Required. Use remote gateways on the spoke peering.')
  useRemoteGateways: bool
}

@export()
@description('Peering with a Virtual WAN hub.')
type VWanHubPeeringConfigurationType = {
  @description('Required. Resource ID of the target Virtual WAN hub.')
  peerVwanHubResourceId: string
}

@export()
@description('Configuration object for the Virtual Network to be deployed.')
type VNetDefinitionType = {
  @description('Optional. VNet name. If empty, a deterministic name is generated.')
  name: string?

  @description('Required. VNet CIDR address space (e.g., 192.168.0.0/16).')
  addressSpace: string

  @description('Optional. Resource ID of an existing DDoS Protection Plan to associate.')
  ddosProtectionPlanResourceId: string?

  @description('Optional. Custom DNS server IP addresses for the VNet.')
  dnsServers: string[]?

  @description('Required. Subnet definitions for the VNet.')
  subnets: VNetSubnetType[]

  @description('Optional. Peering configuration to another VNet (hub/spoke).')
  vnetPeeringConfiguration: VNetPeeringConfigurationType?

  @description('Optional. Peering configuration to a Virtual WAN hub.')
  vwanHubPeeringConfiguration: VWanHubPeeringConfigurationType?

  @description('Optional. Tags to apply to the VNet.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?
}

@export()
@description('Configuration object for the Log Analytics Workspace to be created for monitoring and logging.')
type LogAnalyticsWorkspaceDefinitionType = {
  @description('Optional. Workspace name. If empty, a deterministic name is used.')
  name: string?

  @description('Required. Data retention in days.')
  retention: int

  @description('Required. Workspace SKU.')
  sku: 'CapacityReservation' | 'Free' | 'LACluster' | 'PerGB2018' | 'PerNode' | 'Premium' | 'Standalone' | 'Standard'

  @description('Optional. Tags to apply to the workspace.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?
}

@export()
@description('Configuration object for the Application Insights component to be created or reused.')
type AppInsightsDefinitionType = {
  @description('Optional. Application Insights resource name.')
  name: string?

  @description('Required. Application type for Insights (e.g., web).')
  applicationType: 'web' | 'other'

  @description('Required. Resource kind.')
  kind: 'web' | 'other'

  @description('Optional. Disable IP masking (true) or keep enabled (false).')
  disableIpMasking: bool?

  @description('Optional. Tags to apply to the component.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?
}

@export()
@description('Configuration object for the Container App Environment to be created for GenAI services.')
type ContainerAppEnvDefinitionType = {
  @description('Optional. Container Apps Environment name.')
  name: string?

  @description('Optional. Tags to apply to the environment.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?

  @description('Required. Enable internal load balancer (true) to make the environment internal.')
  internalLoadBalancerEnabled: bool

  @description('Optional. Subnet name where the environment is deployed when internal.')
  subnetName: string?

  @description('Required. Enable zone redundancy for the environment.')
  zoneRedundancyEnabled: bool

  @description('Required. List of user-assigned managed identity resource IDs to attach (can be empty).')
  userAssignedManagedIdentityIds: string[]

  @description('Required. Workload profiles for the environment.')
  workloadProfiles: {
    @description('Required. Profile name.')
    name: string
    @description('Required. Workload profile type.')
    workloadProfileType: 'D4' | 'D8' | 'D16' | 'E4' | 'E8' | 'E16' | 'E32' | 'Consumption'
    @description('Optional. Minimum number of nodes for this profile.')
    minimumCount: int?
    @description('Optional. Maximum number of nodes for this profile.')
    maximumCount: int?
  }[]

  @description('Optional. Enable diagnostic settings for the environment.')
  enableDiagnosticSettings: bool?

  @description('Optional. Resource ID of a Log Analytics workspace for diagnostics.')
  logAnalyticsWorkspaceResourceId: string?

  @description('Optional. Role assignments to create on the environment.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type for the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]
}

@export()
@description('Configuration object for the Azure Container Registry to be created for GenAI services.')
type ContainerRegistryDefinitionType = {
  @description('Optional. Data plane proxy configuration.')
  dataPlaneProxy: {
    @description('Optional. Authentication mode for data plane proxy.')
    authenticationMode: string
    @description('Optional. Private Link delegation setting for data plane proxy.')
    privateLinkDelegation: string
  }?
  @description('Optional. Container Registry name.')
  name: string?
  @description('Optional. Enable local (admin) authentication.')
  localAuthEnabled: bool?
  @description('Optional. Enable purge protection for deleted artifacts.')
  purgeProtectionEnabled: bool?
  @description('Optional. Container Registry SKU.')
  sku: 'Basic' | 'Premium' | 'Standard'?
  @description('Optional. Soft delete retention period in days.')
  softDeleteRetentionInDays: int?
  @description('Optional. Tags to apply to the Container Registry.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?
}

@export()
@description('Definition of a single Container App to create.')
type ContainerAppDefinitionType = {
  @description('Optional. Container App resource name.')
  name: string?
  @description('Required.  Logical app identifier (used for Dapr and container name).')
  app_id: string
  @description('Required. Workload profile name to schedule to.')
  profile_name: string
  @description('Required. Minimum number of replicas.')
  min_replicas: int
  @description('Required. Maximum number of replicas.')
  max_replicas: int
  @description('Required.  Whether to expose through the environment’s external ingress.')
  external: bool?
}

@export()
@description('Configuration object for the Azure Cosmos DB account to be created for GenAI services.')
type GenAIAppCosmosDbDefinitionType = {
  @description('Optional. Cosmos DB account name.')
  name: string?

  @description('Optional. Map of secondary regions and failover properties.')
  secondaryRegions: {
    @description('Required. Arbitrary key for each secondary region entry.')
    *: {
      @description('Required. Secondary region location name.')
      location: string
      @description('Required. Whether zone redundancy is enabled in the region.')
      zoneRedundant: bool
      @description('Required. Failover priority for the region (0 is primary).')
      failoverPriority: int
    }
  }?

  @description('Optional. Enable public network access to the account.')
  publicNetworkAccessEnabled: bool?

  @description('Optional. Enable analytical storage.')
  analyticalStorageEnabled: bool?

  @description('Optional. Enable automatic failover.')
  automaticFailoverEnabled: bool?

  @description('Optional. Disable local authentication (keys).')
  localAuthenticationDisabled: bool?

  @description('Optional. Enable partition merge.')
  partitionMergeEnabled: bool?

  @description('Optional. Enable multiple write locations.')
  multipleWriteLocationsEnabled: bool?

  @description('Optional. Analytical storage configuration.')
  analyticalStorageConfig: {
    @description('Required. Schema type for analytical storage.')
    schemaType: string
  }?

  @description('Optional. Consistency policy configuration.')
  consistencyPolicy: {
    @description('Required. Maximum interval in seconds for Bounded Staleness.')
    maxIntervalInSeconds: int
    @description('Required. Maximum staleness prefix for Bounded Staleness.')
    maxStalenessPrefix: int
    @description('Required. Consistency level (e.g., Strong, Session).')
    consistencyLevel: string
  }?

  @description('Optional. Backup policy configuration.')
  backup: {
    @description('Required. Retention period in hours.')
    retentionInHours: int
    @description('Required. Backup interval in minutes.')
    intervalInMinutes: int
    @description('Required. Storage redundancy for backups.')
    storageRedundancy: string
    @description('Required. Backup type (e.g., Periodic/Continuous).')
    type: string
    @description('Optional. Backup tier (if applicable).')
    tier: string
  }?

  @description('Optional. Capabilities to enable on the Cosmos DB account.')
  capabilities: {
    @description('Required. Arbitrary key for each capability entry.')
    *: {
      @description('Required. Capability name.')
      name: string
    }
  }?

  @description('Optional. Capacity limits for the account.')
  capacity: {
    @description('Required. Total throughput limit (RU/s) for the account.')
    totalThroughputLimit: int
  }?

  @description('Optional. CORS rules to allow on the account.')
  corsRule: {
    @description('Required. Allowed headers for CORS.')
    allowedHeaders: string[]
    @description('Required. Allowed HTTP methods for CORS.')
    allowedMethods: string[]
    @description('Required. Allowed origins for CORS.')
    allowedOrigins: string[]
    @description('Required. Exposed headers for CORS.')
    exposedHeaders: string[]
    @description('Required. Max age for preflight cache (seconds).')
    maxAgeInSeconds: int
  }?
}

@export()
@description('Configuration object for the Azure Key Vault to be created for GenAI services.')
type KeyVaultDefinitionType = {
  @description('Optional. Key Vault name.')
  name: string?

  @description('Optional. Key Vault SKU (e.g., standard, premium).')
  sku: string?

  @description('Optional. AAD tenant ID for the vault.')
  tenantId: string?

  @description('Optional. Role assignments to create on the vault.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type for the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]?

  @description('Optional. Tags to apply to the Key Vault.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?
}

@export()
@description('Configuration object for the Azure Storage Account to be created for GenAI services.')
type StorageAccountDefinitionType = {
  @description('Optional. Storage account name.')
  name: string?

  @description('Optional. Storage account kind (e.g., StorageV2).')
  accountKind: string?

  @description('Optional. Storage account tier (Standard/Premium).')
  accountTier: string?

  @description('Optional. Replication type (e.g., LRS/ZRS/GRS).')
  accountReplicationType: string?

  @description('Optional. Endpoint types to enable (e.g., blob, dfs).')
  endpointTypes: string[]?

  @description('Optional. Access tier (Hot/Cool).')
  accessTier: string?

  @description('Optional. Enable public network access.')
  publicNetworkAccessEnabled: bool?

  @description('Optional. Enable shared access keys (account keys).')
  sharedAccessKeyEnabled: bool?

  @description('Optional. Role assignments to create on the account.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type for the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]?

  @description('Optional. Tags to apply to the storage account.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?
}

@export()
@description('Configuration object for the Azure AI Search service to be deployed.')
type KSAISearchDefinitionType = {
  @description('Optional. Search service name.')
  name: string?

  @description('Optional. Search SKU (e.g., basic/standard).')
  sku: string?

  @description('Optional. Enable local (admin keys) authentication.')
  localAuthenticationEnabled: bool?

  @description('Optional. Number of partitions.')
  partitionCount: int?

  @description('Optional. Enable public network access.')
  publicNetworkAccessEnabled: bool?

  @description('Optional. Number of replicas.')
  replicaCount: int?

  @description('Optional. Semantic search SKU (e.g., standard).')
  semanticSearchSku: string?

  @description('Optional. Tags to apply to the search service.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?

  @description('Optional. Role assignments to create on the search service.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type for the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]?

  @description('Optional. Enable module telemetry.')
  enableTelemetry: bool?
}

@export()
@description('Configuration object for the Bing Grounding service to be deployed.')
type KSGroundingWithBingDefinitionType = {
  @description('Optional. Bing Grounding resource name.')
  name: string?
  @description('Required. Bing Grounding resource SKU.')
  sku: string
  @description('Required. Tags to apply to the Bing Grounding resource.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }
}

@export()
@description('Configuration object for the Azure App Configuration store for GenAI app.')
type AppConfigurationDefinitionType = {
  @description('Optional. Data plane proxy configuration (auth and Private Link delegation).')
  dataPlaneProxy: {
    @description('Optional. Authentication mode for data plane proxy.')
    authenticationMode: string
    @description('Optional. Private Link delegation for data plane proxy.')
    privateLinkDelegation: string
  }?

  @description('Optional. App Configuration store name.')
  name: string?

  @description('Optional. Enable local (access keys) authentication.')
  localAuthEnabled: bool?

  @description('Optional. Enable purge protection.')
  purgeProtectionEnabled: bool?

  @description('Optional. SKU for App Configuration.')
  sku: string?

  @description('Optional. Soft delete retention (days).')
  softDeleteRetentionInDays: int?

  @description('Optional. Tags to apply to the App Configuration store.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }?

  @description('Optional. Role assignments to create on the store.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type for the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]?
}

import { lockType } from 'br/public:avm/utl/types/avm-common-types:0.6.1'

@export()
@description('Connection reference for BYOR resources inside AI Projects.')
type AiFoundryProjectConnectionRefType = {
  @description('Optional. Resource ID of an existing resource to connect to.')
  existingResourceId: string?
  @description('Optional. Key referencing a newly created resource within the deployment map.')
  newResourceMapKey: string?
}

@export()
@description('AI Project definition.')
type AiFoundryProjectType = {
  @description('Required. Project resource name.')
  name: string
  @description('Optional. Project SKU.')
  sku: string?
  @description('Required. Display name for the project.')
  displayName: string
  @description('Required. Description for the project.')
  desc: string
  @description('Optional. Whether to auto-create project connections (BYOR).')
  createProjectConnections: bool?
  @description('Optional. Cosmos DB connection reference.')
  cosmosDbConnection: AiFoundryProjectConnectionRefType?
  @description('Optional. AI Search connection reference.')
  aiSearchConnection: AiFoundryProjectConnectionRefType?
  @description('Optional. Key Vault connection reference.')
  keyVaultConnection: AiFoundryProjectConnectionRefType?
  @description('Optional. Storage Account connection reference.')
  storageAccountConnection: AiFoundryProjectConnectionRefType?
}

@export()
@description('AI model deployment definition.')
type AiModelDeploymentType = {
  @description('Required. Deployment name.')
  name: string
  @description('Optional. Name of the associated RAI policy to apply.')
  raiPolicyName: string?
  @description('Optional. Version upgrade option for this deployment.')
  versionUpgradeOption: string?
  @description('Required. Model identification (format/name/version).')
  model: {
    @description('Required. Model format (e.g., OpenAI, HF, ONNX).')
    format: string
    @description('Required. Model name.')
    name: string
    @description('Required. Model version.')
    version: string
  }
  @description('Required. Capacity configuration (family/size/tier/type/capacity).')
  scale: {
    @description('Required. Target capacity (number of instances).')
    capacity: int
    @description('Required. VM family or accelerator family.')
    family: string
    @description('Required. VM size or SKU size.')
    size: string
    @description('Required. Billing tier.')
    tier: string
    @description('Required. Resource type (dedicated/consumption/etc.).')
    type: string
  }
}

@export()
@description('AI Foundry account configuration.')
type AiFoundryConfigurationType = {
  @description('Optional. Account name for AI Foundry.')
  accountName: string?
  @description('Optional. Location for the account (defaults to RG location if omitted).')
  location: string?
  @description('Optional. Account SKU.')
  sku: (
    | 'F0'
    | 'S0')?
  @description('Optional. Create capability hosts (data plane services).')
  createCapabilityHosts: bool?
  @description('Optional. Allow project management operations.')
  allowProjectManagement: bool?

  @description('Optional. Networking configuration (subnet & private DNS zones).')
  networking: {
    @description('Optional. Subnet Resource ID for the Agent Service.')
    agentServiceSubnetResourceId: string?
    @description('Optional. Private DNS zone Resource ID for AI Services.')
    cognitiveServicesPrivateDnsZoneResourceId: string?
    @description('Optional. Private DNS zone Resource ID for OpenAI.')
    openAiPrivateDnsZoneResourceId: string?
    @description('Optional. Private DNS zone Resource ID for AI Services.')
    aiServicesPrivateDnsZoneResourceId: string?
  }?

  @description('Optional. Default project properties.')
  project: {
    @description('Optional. Default project name.')
    name: string?
    @description('Optional. Default project display name.')
    displayName: string?
    @description('Optional. Default project description.')
    desc: string?
  }?

  @description('Optional. Role assignments to create on the account.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]?

  @description('Optional. Consolidated list of Private DNS Zone resource IDs.')
  privateDnsZoneResourceIds: string[]?
}

@export()
@description('Configuration object for the Azure AI Foundry Account and Project and related resources.')
type AiFoundryDefinitionType = {
  @description('Optional. Base unique name used for related resources.')
  baseUniqueName: string?

  @description('Optional. Location/region for the AI Foundry resources.')
  location: string?

  @description('Optional. Enable telemetry for the pattern modules.')
  enableTelemetry: bool?

  @description('Optional. Create BYOR (bring-your-own resource) links where applicable.')
  createByor: bool?

  @description('Optional. Optional lock configuration for created resources.')
  lock: lockType?

  @description('Optional. Array of AI Projects to create (can be empty).')
  @minLength(0)
  aiProjects: AiFoundryProjectType[]?

  @description('Optional. AI Foundry account/project level configuration.')
  aiFoundryConfiguration: AiFoundryConfigurationType?

  @description('Optional. Model deployments to provision (can be empty).')
  @minLength(0)
  aiModelDeployments: AiModelDeploymentType[]?

  @description('Optional. Include associated resources (Search/Cosmos/Storage/KV) in the deployment.')
  includeAssociatedResources: bool?

  @description('Optional. Subnet resource ID where Private Endpoints should be created.')
  privateEndpointSubnetResourceId: string?

  @description('Optional. Key Vault configuration (reuse or create) for AI Foundry associated resources.')
  keyVaultConfiguration: {
    @description('Optional. Existing Key Vault resource ID to reuse.')
    existingResourceId: string?
    @description('Optional. Name for a new Key Vault (if creating).')
    name: string?
    @description('Optional. Private DNS Zone resource ID for Vault.')
    privateDnsZoneResourceId: string?
    @description('Optional. Role assignments to create on the vault.')
    roleAssignments: {
      @description('Optional. Role assignment name.')
      name: string?
      @description('Required. Principal (objectId) to assign.')
      principalId: string
      @description('Required. Role definition ID or built-in role name.')
      roleDefinitionIdOrName: string
      @description('Required. Principal type.')
      principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
      @description('Optional. Description for the assignment.')
      description: string?
      @description('Optional. Condition expression for the assignment.')
      condition: string?
      @description('Optional. Condition version (e.g., 2.0).')
      conditionVersion: '2.0'?
      @description('Optional. Delegated managed identity resource ID.')
      delegatedManagedIdentityResourceId: string?
    }[]?
  }?

  @description('Optional. Azure AI Search configuration (reuse or create) for AI Foundry associated resources.')
  aiSearchConfiguration: {
    @description('Optional. Existing Search resource ID to reuse.')
    existingResourceId: string?
    @description('Optional. Name for a new Search service (if creating).')
    name: string?
    @description('Optional. Private DNS Zone resource ID for Search.')
    privateDnsZoneResourceId: string?
    @description('Optional. Role assignments to create on the Search service.')
    roleAssignments: {
      @description('Optional. Role assignment name.')
      name: string?
      @description('Required. Principal (objectId) to assign.')
      principalId: string
      @description('Required. Role definition ID or built-in role name.')
      roleDefinitionIdOrName: string
      @description('Required. Principal type for the assignment.')
      principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
      @description('Optional. Description for the assignment.')
      description: string?
      @description('Optional. Condition expression for the assignment.')
      condition: string?
      @description('Optional. Condition version (e.g., 2.0).')
      conditionVersion: '2.0'?
      @description('Optional. Delegated managed identity resource ID.')
      delegatedManagedIdentityResourceId: string?
    }[]?
  }?

  @description('Optional. Storage Account configuration (reuse or create) for AI Foundry associated resources.')
  storageAccountConfiguration: {
    @description('Optional. Existing Storage Account resource ID to reuse.')
    existingResourceId: string?
    @description('Optional. Name for a new Storage Account (if creating).')
    name: string?
    @description('Optional. Private DNS Zone resource ID for Blob (if using Private Endpoints).')
    blobPrivateDnsZoneResourceId: string?
    @description('Optional. Role assignments to create on the Storage Account.')
    roleAssignments: {
      @description('Optional. Role assignment name.')
      name: string?
      @description('Required. Principal (objectId) to assign.')
      principalId: string
      @description('Required. Role definition ID or built-in role name.')
      roleDefinitionIdOrName: string
      @description('Required. Principal type for the assignment.')
      principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
      @description('Optional. Description for the assignment.')
      description: string?
      @description('Optional. Condition expression for the assignment.')
      condition: string?
      @description('Optional. Condition version (e.g., 2.0).')
      conditionVersion: '2.0'?
      @description('Optional. Delegated managed identity resource ID.')
      delegatedManagedIdentityResourceId: string?
    }[]?
  }?

  @description('Optional. Cosmos DB configuration (reuse or create) for AI Foundry associated resources.')
  cosmosDbConfiguration: {
    @description('Optional. Existing Cosmos DB account resource ID to reuse.')
    existingResourceId: string?
    @description('Optional. Name for a new Cosmos DB account (if creating).')
    name: string?
    @description('Optional. Private DNS Zone resource ID for Cosmos.')
    privateDnsZoneResourceId: string?
    @description('Optional. Role assignments to create on the Cosmos DB account.')
    roleAssignments: {
      @description('Optional. Role assignment name.')
      name: string?
      @description('Required. Principal (objectId) to assign.')
      principalId: string
      @description('Required. Role definition ID or built-in role name.')
      roleDefinitionIdOrName: string
      @description('Required. Principal type for the assignment.')
      principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
      @description('Optional. Description for the assignment.')
      description: string?
      @description('Optional. Condition expression for the assignment.')
      condition: string?
      @description('Optional. Condition version (e.g., 2.0).')
      conditionVersion: '2.0'?
      @description('Optional. Delegated managed identity resource ID.')
      delegatedManagedIdentityResourceId: string?
    }[]?
  }?
}

@export()
@description('Marketplace image reference.')
type VmImageReferenceType = {
  @description('Required. Publisher name.')
  publisher: string
  @description('Required. Offer name.')
  offer: string
  @description('Required. SKU name.')
  sku: string
  @description('Required. Image version (e.g., latest).')
  version: string
}

@export()
@description('Configuration object for the Jump VM to be created for managing the implementation services.')
type JumpVmDefinitionType = {
  @description('Optional. VM resource name.')
  name: string?
  @description('Required. VM size SKU (e.g., Standard_D2s_v5).')
  sku: string
  @description('Required. Admin username.')
  adminUsername: string
  @description('Optional. OS type for the VM.')
  osType: 'Windows' | 'Linux'?
  @description('Optional. Marketplace image reference for the VM.')
  imageReference: VmImageReferenceType?
  @description('Required. Name of the admin password secret in the Bastion Key Vault.')
  vmKeyVaultSecName: string
  @description('Required. Enable telemetry for helper scripts.')
  enableTelemetry: bool
  @description('Required. Tags to apply to the Jump VM.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }
}

@export()
@description('Linux Build VM configuration.')
type BuildVmDefinitionType = {
  @description('Optional. VM name.')
  name: string?
  @description('Required. VM size SKU (e.g., Standard_B2s).')
  sku: string
  @description('Required. Admin username to create (e.g., azureuser).')
  adminUsername: string
  @description('Optional. OS type for the VM.')
  osType: 'Linux' | 'Windows'?
  @description('Optional. Marketplace image reference for the VM.')
  imageReference: VmImageReferenceType?
  @description('Required. SSH public key for the admin user.')
  sshPublicKey: string
  @description('Required. Which agent to install.')
  runner: 'azdo' | 'github'
  @description('Optional. Azure DevOps settings (required when runner = azdo).')
  azdo: {
    @description('Required. Azure DevOps organization URL (e.g., https://dev.azure.com/contoso).')
    orgUrl: string
    @description('Required. Agent pool name.')
    pool: string
    @description('Optional. Agent name.')
    agentName: string?
    @description('Optional. Working folder.')
    workFolder: string?
  }?
  @description('Optional. GitHub settings (required when runner = github).')
  github: {
    @description('Required. GitHub owner (org or user).')
    owner: string
    @description('Required. Repository name.')
    repo: string
    @description('Optional. Runner labels (comma-separated).')
    labels: string?
    @description('Optional. Runner name.')
    agentName: string?
    @description('Optional. Working folder.')
    workFolder: string?
  }?
  @description('Optional. Tags to apply to the Build VM resource.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }
  @description('Optional. Enable AVM telemetry.')
  enableTelemetry: bool?
}

@export()
@description('Configuration object for the Azure Bastion service to be deployed.')
type BastionDefinitionType = {
  @description('Optional. Bastion host name.')
  name: string?
  @description('Required. Azure Bastion SKU.')
  sku: string
  @description('Optional. Tags to apply to the Bastion resource.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }
  @description('Required. Availability zones to use for Bastion (if supported).')
  zones: string[]
}

@export()
@description('Configuration object for Network Security Groups (NSGs) to be deployed.')
type NSGDefinitionsType = {
  @description('Optional. NSG resource name.')
  name: string?
  @description('Required. Security rules to configure in the NSG.')
  securityRules: {
    @description('Required. Arbitrary key for each NSG rule.')
    *: {
      @description('Required. Rule name.')
      name: string
      @description('Required. Priority of the rule (100–4096).')
      priority: int
      @description('Required. Access type (Allow or Deny).')
      access: string
      @description('Required. Direction of traffic (Inbound or Outbound).')
      direction: string
      @description('Required. Protocol (Tcp, Udp, or *).')
      protocol: string
      @description('Optional. Source address prefix.')
      sourceAddressPrefix: string
      @description('Optional. Source address prefixes.')
      sourceAddressPrefixes: string[]
      @description('Optional. Source application security group IDs.')
      sourceApplicationSecurityGroupIds: string[]
      @description('Optional. Source port range.')
      sourcePortRange: string
      @description('Optional. Source port ranges.')
      sourcePortRanges: string[]
      @description('Optional. Destination address prefix.')
      destinationAddressPrefix: string
      @description('Optional. Destination address prefixes.')
      destinationAddressPrefixes: string[]
      @description('Optional. Destination application security group IDs.')
      destinationApplicationSecurityGroupIds: string[]
      @description('Optional. Destination port range.')
      destinationPortRange: string
      @description('Optional. Destination port ranges.')
      destinationPortRanges: string[]
      @description('Optional. Rule description.')
      description: string
      @description('Optional. Operation timeouts.')
      timeouts: {
        @description('Optional. Create operation timeout (e.g., PT30M).')
        create: string
        @description('Optional. Read operation timeout (e.g., PT5M).')
        read: string
        @description('Optional. Update operation timeout (e.g., PT30M).')
        update: string
        @description('Optional. Delete operation timeout (e.g., PT30M).')
        delete: string
      }
    }
  }
}

@export()
@description('Single Private DNS Zone VNet link definition.')
type PrivateDnsZoneNetworkLinkType = {
  @description('Required. Name of the VNet link resource to create.')
  vnetLinkName: string
  @description('Required. Resource ID of the VNet to link.')
  vnetId: string
  @description('Optional. DNS resolution policy for the link.')
  resolutionPolicy: 'Default' | 'SecureOnly' | 'Classic'?
}

@export()
@description('Configuration for Private DNS Zones and VNet links.')
type PrivateDnsZoneDefinitionsType = {
  @description('Optional. Resource ID of the resource group that hosts existing Private DNS zones.')
  existingZonesResourceGroupResourceId: string?

  @description('Optional. Allow fallback to internet DNS resolution when Private DNS is unavailable.')
  allowInternetResolutionFallback: bool?

  @description('Required. VNet link definitions to associate with the zones (can be empty).')
  @minLength(0)
  networkLinks: PrivateDnsZoneNetworkLinkType[]
}

@export()
@description('Configuration object for the Web Application Firewall (WAF) Policy to be deployed.')
type WafPolicyDefinitionsType = {
  @description('Required. WAF policy resource name.')
  name: string

  @description('Required. WAF policy settings (state, mode, size limits).')
  policySettings: {
    @description('Required. WAF policy enabled state.')
    enabledState: 'Enabled' | 'Disabled'
    @description('Required. WAF mode (Prevention or Detection).')
    mode: 'Prevention' | 'Detection'
    @description('Required. Enable request body inspection.')
    requestBodyCheck: bool
    @description('Required. Maximum request body size (KB).')
    maxRequestBodySizeInKb: int
    @description('Required. File upload size limit (MB).')
    fileUploadLimitInMb: int
  }

  @description('Required. Managed rule sets and exclusions for the WAF policy.')
  managedRules: {
    @description('Optional. Exclusions for specific rules or variables.')
    exclusions: {
      @description('Required. Match variable to exclude (e.g., RequestHeaderNames).')
      matchVariable: string
      @description('Required. Selector value for the match variable.')
      selector: string
      @description('Required. Selector match operator (e.g., Equals, Contains).')
      selectorMatchOperator: string
      @description('Optional. Specific managed rule set exclusion details.')
      excludedRuleSet: {
        @description('Required. Rule set type (e.g., OWASP).')
        type: string
        @description('Required. Rule set version (e.g., 3.2).')
        version: string
        @description('Optional. Rule groups to exclude.')
        ruleGroup: string[]
      }
    }[]
    @description('Required. Managed rule sets to apply.')
    managedRuleSets: {
      @description('Required. Rule set type (e.g., OWASP).')
      type: string
      @description('Required. Rule set version.')
      version: string
      @description('Optional. Overrides for specific rule groups.')
      ruleGroupOverride: {
        @description('Required. Name of the rule group.')
        ruleGroupName: string
        @description('Required. Rule overrides within the group.')
        rule: {
          @description('Required. Rule ID.')
          id: string
          @description('Required. Action to take (e.g., Allow, Block, Log).')
          action: string
          @description('Required. Whether the rule is enabled.')
          enabled: bool
        }[]
      }[]
    }[]
  }

  @description('Optional. Tags to apply to the WAF Policy.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }
}

@export()
@description('Configuration object for the Azure Application Gateway to be deployed.')
type AppGatewayDefinitionType = {
  @description('Optional. Application Gateway name.')
  name: string?

  @description('Required. Enable HTTP/2 on the gateway.')
  http2Enable: bool

  @description('Optional. Create public frontend and public IP for the gateway.')
  createPublicFrontend: bool?

  @description('Optional. Authentication certificates to attach to the gateway.')
  authenticationCertificate: {
    @description('Required. Arbitrary key for each authentication certificate.')
    *: {
      @description('Required. Certificate name.')
      name: string
      @description('Required. Certificate data.')
      data: string
    }
  }

  @description('Required. SKU definition (name/tier/capacity).')
  sku: {
    @description('Required. SKU name (e.g., WAF_v2).')
    name: string
    @description('Required. SKU tier (e.g., WAF_v2).')
    tier: string
    @description('Required. Instance capacity when autoscale is disabled.')
    capacity: int
  }

  @description('Required. Autoscale configuration (min/max capacity).')
  autoscaleConfiguration: {
    @description('Required. Maximum autoscale capacity.')
    maxCapacity: int
    @description('Required. Minimum autoscale capacity.')
    minCapacity: int
  }

  @description('Required. SSL policy (protocols/ciphers).')
  sslPolicy: {
    @description('Required. Allowed cipher suites.')
    cipherSuites: string[]
    @description('Required. Disabled protocol versions.')
    disabledProtocols: string[]
    @description('Required. Minimum allowed TLS protocol version.')
    minProtocolVersion: string
    @description('Required. Policy name if using a predefined policy.')
    policyName: string
    @description('Required. Policy type (Predefined/Custom).')
    policyType: string
  }

  @description('Required. Backend address pools (FQDNs/IPs).')
  backendAddressPools: {
    @description('Required. Arbitrary key for each backend pool.')
    *: {
      @description('Required. Pool name.')
      name: string
      @description('Optional. Backend FQDNs.')
      fqdns: string[]
      @description('Optional. Backend IP addresses.')
      ipAddresses: string[]
    }
  }

  @description('Required. Backend HTTP settings collection.')
  backendHttpSettings: {
    @description('Required. Arbitrary key for each backend HTTP setting.')
    *: {
      @description('Required. Cookie-based affinity mode.')
      cookieBasedAffinity: string
      @description('Required. Setting name.')
      name: string
      @description('Required. Backend port for the setting.')
      port: int
      @description('Required. Protocol (Http/Https).')
      protocol: string
      @description('Optional. Custom affinity cookie name.')
      affinityCookieName: string
      @description('Optional. Host header to use when forwarding.')
      hostName: string
      @description('Optional. Path to append when forwarding.')
      path: string
      @description('Optional. Use backend address as host header (true/false).')
      pickHostNameFromBackendAddress: bool
      @description('Optional. Probe name to associate.')
      probeName: string
      @description('Required. Request timeout in seconds.')
      requestTimeout: int
      @description('Optional. Trusted root certificate names to use.')
      trustedRootCertificateNames: string[]
      @description('Optional. Authentication certificate names to present to backend.')
      authenticationCertificate: string[]
      @description('Optional. Connection draining settings (enable and drain timeout in seconds).')
      connectionDraining: {
        @description('Required. Enable connection draining for backend HTTP settings.')
        enabled: bool
        @description('Required. Drain timeout in seconds before terminating connections.')
        drainTimeoutSec: int
      }
    }
  }

  @description('Required. Frontend ports to expose.')
  frontendPorts: {
    @description('Required. Arbitrary key for each frontend port.')
    *: {
      @description('Required. Port name.')
      name: string
      @description('Required. Port number.')
      port: int
    }
  }

  @description('Required. HTTP listeners configuration.')
  httpListeners: {
    @description('Required. Arbitrary key for each HTTP listener.')
    *: {
      @description('Required. Listener name.')
      name: string
      @description('Required. Name of the frontend port to use.')
      frontendPortName: string
      @description('Optional. Name of the frontend IP configuration to use.')
      frontendIpConfigurationName: string
      @description('Optional. Resource ID of the associated WAF policy.')
      firewallPolicyId: string
      @description('Optional. Require SNI for TLS.')
      requireSni: bool
      @description('Optional. Host name for the listener.')
      hostName: string
      @description('Optional. Multiple host names for the listener.')
      hostNames: string[]
      @description('Optional. SSL certificate name to bind to the listener.')
      sslCertificateName: string
      @description('Optional. SSL profile name to use.')
      sslProfileName: string
      @description('Optional. Custom error configuration entries.')
      customErrorConfiguration: object[]
    }
  }

  @description('Required. Health probe configurations.')
  probeConfigurations: {
    @description('Required. Arbitrary key for each probe configuration.')
    *: {
      @description('Required. Probe name.')
      name: string
      @description('Optional. Host header to send in probe requests.')
      host: string
      @description('Required. Probe interval in seconds.')
      interval: int
      @description('Required. Probe timeout in seconds.')
      timeout: int
      @description('Required. Consecutive failures before marking unhealthy.')
      unhealthyThreshold: int
      @description('Required. Protocol for the probe (Http/Https/Tcp).')
      protocol: string
      @description('Optional. Backend port to probe.')
      port: int
      @description('Optional. Path to probe (for HTTP/S).')
      path: string
      @description('Optional. Use host name from backend HTTP settings.')
      pickHostNameFromBackendHttpSettings: bool
      @description('Optional. Minimum servers that must be healthy.')
      minimumServers: int
      @description('Optional. Match conditions for HTTP probe response.')
      match: object
    }
  }

  @description('Required. Redirect configurations.')
  redirectConfiguration: {
    @description('Required. Arbitrary key for each redirect configuration.')
    *: {
      @description('Optional. Include the path in the redirect.')
      includePath: bool
      @description('Optional. Include the query string in the redirect.')
      includeQueryString: bool
      @description('Required. Redirect configuration name.')
      name: string
      @description('Required. Redirect type (Permanent, Found, Temporary, SeeOther).')
      redirectType: string
      @description('Optional. Target listener name for listener redirect.')
      targetListenerName: string
      @description('Optional. Target URL for external redirect.')
      targetUrl: string
    }
  }

  @description('Required. Request routing rules.')
  requestRoutingRules: {
    @description('Required. Arbitrary key for each routing rule.')
    *: {
      @description('Required. Rule name.')
      name: string
      @description('Required. Rule type (Basic or PathBasedRouting).')
      ruleType: string
      @description('Required. HTTP listener name to attach to.')
      httpListenerName: string
      @description('Optional. Backend address pool name to route to.')
      backendAddressPoolName: string
      @description('Optional. Rule priority (1-20000).')
      priority: int
      @description('Optional. URL path map name for path-based rules.')
      urlPathMapName: string
      @description('Optional. Backend HTTP settings name to use.')
      backendHttpSettingsName: string
      @description('Optional. Redirect configuration name to use.')
      redirectConfigurationName: string
      @description('Optional. Rewrite rule set name to apply.')
      rewriteRuleSetName: string
    }
  }

  @description('Optional. Rewrite rule sets.')
  rewriteRuleSet: {
    @description('Required. Arbitrary key for each rewrite rule set.')
    *: {
      @description('Required. Rewrite rule set name.')
      name: string
      @description('Optional. Rewrite rules contained in this set.')
      rewriteRules: {
        @description('Required. Arbitrary key for each rewrite rule entry.')
        *: object
      }
    }
  }

  @description('Optional. SSL certificates.')
  sslCertificates: {
    @description('Required. Arbitrary key for each SSL certificate.')
    *: {
      @description('Required. Certificate name.')
      name: string
      @description('Optional. Base64-encoded PFX certificate data.')
      data: string
      @description('Optional. PFX password (if data provided).')
      password: string
      @description('Optional. Key Vault secret ID for the certificate.')
      keyVaultSecretId: string
    }
  }

  @description('Optional. SSL profiles.')
  sslProfile: {
    @description('Required. Arbitrary key for each SSL profile.')
    *: {
      @description('Required. SSL profile name.')
      name: string
      @description('Optional. Trusted client certificate names to require.')
      trustedClientCertificateNames: string[]
      @description('Optional. Verify client certificate issuer DN.')
      verifyClientCertIssuerDn: bool
      @description('Optional. Client certificate revocation check setting.')
      verifyClientCertificateRevocation: string
      @description('Optional. SSL policy for the profile.')
      sslPolicy: {
        @description('Optional. Allowed cipher suites.')
        cipherSuites: string[]
        @description('Optional. Disabled protocol versions.')
        disabledProtocols: string[]
        @description('Optional. Minimum TLS version.')
        minProtocolVersion: string
        @description('Optional. Predefined policy name.')
        policyName: string
        @description('Optional. Policy type (Predefined/Custom).')
        policyType: string
      }
    }
  }

  @description('Optional. Trusted client certificates.')
  trustedClientCertificate: {
    @description('Required. Arbitrary key for each trusted client certificate.')
    *: {
      @description('Required. Base64-encoded certificate data.')
      data: string
      @description('Required. Certificate name.')
      name: string
    }
  }

  @description('Optional. Trusted root certificates.')
  trustedRootCertificate: {
    @description('Required. Arbitrary key for each trusted root certificate.')
    *: {
      @description('Optional. Base64-encoded certificate data.')
      data: string
      @description('Optional. Key Vault secret ID for the certificate.')
      keyVaultSecretId: string
      @description('Required. Certificate name.')
      name: string
    }
  }

  @description('Optional. URL path map configurations.')
  urlPathMapConfigurations: {
    @description('Required. Arbitrary key for each URL path map configuration.')
    *: {
      @description('Required. URL path map name.')
      name: string
      @description('Optional. Default redirect configuration name.')
      defaultRedirectConfigurationName: string
      @description('Optional. Default rewrite rule set name.')
      defaultRewriteRuleSetName: string
      @description('Optional. Default backend HTTP settings name.')
      defaultBackendHttpSettingsName: string
      @description('Optional. Default backend address pool name.')
      defaultBackendAddressPoolName: string
      @description('Required. Path rules for this map.')
      pathRules: {
        @description('Required. Arbitrary key for each path rule.')
        *: {
          @description('Required. Path rule name.')
          name: string
          @description('Required. Paths to match (e.g., /images/*).')
          paths: string[]
          @description('Optional. Backend address pool name for the rule.')
          backendAddressPoolName: string
          @description('Optional. Backend HTTP settings name for the rule.')
          backendHttpSettingsName: string
          @description('Optional. Redirect configuration name for the rule.')
          redirectConfigurationName: string
          @description('Optional. Rewrite rule set name for the rule.')
          rewriteRuleSetName: string
        }
      }
    }
  }

  @description('Optional. Tags to apply to the Application Gateway.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }

  @description('Optional. Role assignments to create on the gateway.')
  roleAssignments: {
    @description('Optional. Role assignment name.')
    name: string?
    @description('Required. Principal (objectId) to assign.')
    principalId: string
    @description('Required. Role definition ID or built-in role name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type for the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description for the assignment.')
    description: string?
    @description('Optional. Condition expression for the assignment.')
    condition: string?
    @description('Optional. Condition version (e.g., 2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]
}

@export()
@description('Configuration object for the Azure API Management service to be deployed.')
type ApimDefinitionType = {
  @description('Optional. API Management service name.')
  name: string?

  @description('Required. Publisher email address.')
  publisherEmail: string

  @description('Required. Publisher display name.')
  publisherName: string

  @description('Optional. Minimum ARM API version to use for APIM operations.')
  minApiVersion: string?

  @description('Optional. Sender email address used by APIM system notifications.')
  notificationSenderEmail: string?

  @description('Optional. Additional regions for API Management.')
  additionalLocations: {
    @description('Required. Arbitrary key for each additional location entry.')
    *: {
      @description('Required. Location for the additional APIM instance.')
      location: string
      @description('Required. Capacity for the region.')
      capacity: int
      @description('Optional. Availability zones for the region.')
      zones: int[]
      @description('Optional. Public IP address resource ID to bind.')
      publicIpAddressId: string
      @description('Optional. Disable gateway in this region.')
      gatewayDisabled: bool
      @description('Optional. VNet configuration for the region.')
      virtualNetworkConfiguration: {
        @description('Required. Subnet resource ID used by APIM in this region.')
        subnetId: string
      }
    }
  }

  @description('Optional. Certificates for API Management endpoints.')
  certificate: {
    @description('Required. Arbitrary key for each certificate entry.')
    *: {
      @description('Required. Base64-encoded PFX certificate.')
      encodedCertificate: string
      @description('Required. Store name to import to (e.g., CertificateAuthority).')
      storeName: string
      @description('Optional. Certificate password.')
      certificatePassword: string
    }
  }

  @description('Required. Enable client certificate authentication for gateway.')
  clientCertificateEnabled: bool

  @description('Optional. Hostname configuration for all endpoints.')
  hostnameConfiguration: {
    @description('Optional. Hostname configuration map for the Management endpoint.')
    management: {
      @description('Required. Arbitrary key for each hostname binding.')
      *: {
        @description('Required. Host name to bind.')
        hostName: string
        @description('Optional. Key Vault secret ID for the certificate.')
        keyVaultId: string
        @description('Optional. Inline certificate as base64.')
        certificate: string
        @description('Optional. Password for the inline certificate (if provided).')
        certificatePassword: string
        @description('Optional. Negotiate client certificate on TLS.')
        negotiateClientCertificate: bool
        @description('Optional. Client ID of the Key Vault identity used for SSL.')
        sslKeyvaultIdentityClientId: string
        @description('Optional. Set this binding as default for the endpoint.')
        defaultSslBinding: bool
      }
    }

    @description('Optional. Hostname configuration map for the Developer Portal.')
    portal: {
      @description('Required. Arbitrary key for each hostname binding.')
      *: {
        @description('Required. Host name to bind.')
        hostName: string
        @description('Optional. Key Vault secret ID for the certificate.')
        keyVaultId: string
        @description('Optional. Inline certificate as base64.')
        certificate: string
        @description('Optional. Password for the inline certificate (if provided).')
        certificatePassword: string
        @description('Optional. Negotiate client certificate on TLS.')
        negotiateClientCertificate: bool
        @description('Optional. Client ID of the Key Vault identity used for SSL.')
        sslKeyvaultIdentityClientId: string
        @description('Optional. Set this binding as default for the endpoint.')
        defaultSslBinding: bool
      }
    }

    @description('Optional. Hostname configuration map for the Legacy Developer Portal (deprecated in some SKUs).')
    developerPortal: {
      @description('Required. Arbitrary key for each hostname binding.')
      *: {
        @description('Required. Host name to bind.')
        hostName: string
        @description('Optional. Key Vault secret ID for the certificate.')
        keyVaultId: string
        @description('Optional. Inline certificate as base64.')
        certificate: string
        @description('Optional. Password for the inline certificate (if provided).')
        certificatePassword: string
        @description('Optional. Negotiate client certificate on TLS.')
        negotiateClientCertificate: bool
        @description('Optional. Client ID of the Key Vault identity used for SSL.')
        sslKeyvaultIdentityClientId: string
        @description('Optional. Set this binding as default for the endpoint.')
        defaultSslBinding: bool
      }
    }

    @description('Optional. Hostname configuration map for the Gateway/Proxy endpoint.')
    proxy: {
      @description('Required. Arbitrary key for each hostname binding.')
      *: {
        @description('Required. Host name to bind.')
        hostName: string
        @description('Optional. Key Vault secret ID for the certificate.')
        keyVaultId: string
        @description('Optional. Inline certificate as base64.')
        certificate: string
        @description('Optional. Password for the inline certificate (if provided).')
        certificatePassword: string
        @description('Optional. Negotiate client certificate on TLS.')
        negotiateClientCertificate: bool
        @description('Optional. Client ID of the Key Vault identity used for SSL.')
        sslKeyvaultIdentityClientId: string
        @description('Optional. Set this binding as default for the endpoint.')
        defaultSslBinding: bool
      }
    }

    @description('Optional. Hostname configuration map for the SCM endpoint.')
    scm: {
      @description('Required. Arbitrary key for each hostname binding.')
      *: {
        @description('Required. Host name to bind.')
        hostName: string
        @description('Optional. Key Vault secret ID for the certificate.')
        keyVaultId: string
        @description('Optional. Inline certificate as base64.')
        certificate: string
        @description('Optional. Password for the inline certificate (if provided).')
        certificatePassword: string
        @description('Optional. Negotiate client certificate on TLS.')
        negotiateClientCertificate: bool
        @description('Optional. Client ID of the Key Vault identity used for SSL.')
        sslKeyvaultIdentityClientId: string
        @description('Optional. Set this binding as default for the endpoint.')
        defaultSslBinding: bool
      }
    }
  }

  @description('Optional. Protocol options.')
  protocols: {
    @description('Optional. Enable HTTP/2 for API traffic.')
    enableHttp2: bool
  }

  @description('Required. Sign-in configuration for the developer portal.')
  signIn: {
    @description('Required. Enable sign-in on developer portal.')
    enabled: bool
  }

  @description('Required. Sign-up configuration for the developer portal.')
  signUp: {
    @description('Required. Enable sign-up on developer portal.')
    enabled: bool

    @description('Required. Terms of Service configuration for sign-up.')
    termsOfService: {
      @description('Required. User must consent to ToS.')
      consentRequired: bool
      @description('Required. Terms of Service enabled.')
      enabled: bool
      @description('Required. Text shown for Terms of Service.')
      text: string
    }
  }

  @description('Optional. Role assignments to create on the API Management service.')
  roleAssignments: {
    @description('Optional. Name of the role assignment.')
    name: string?
    @description('Required. Principal ID to assign.')
    principalId: string
    @description('Required. Role definition ID or name.')
    roleDefinitionIdOrName: string
    @description('Required. Principal type of the assignment.')
    principalType: 'Device' | 'ForeignGroup' | 'Group' | 'ServicePrincipal' | 'User'
    @description('Optional. Description of the assignment.')
    description: string?
    @description('Optional. Condition for the assignment.')
    condition: string?
    @description('Optional. Condition version (2.0).')
    conditionVersion: '2.0'?
    @description('Optional. Delegated managed identity resource ID.')
    delegatedManagedIdentityResourceId: string?
  }[]

  @description('Optional. SKU for API Management (Developer/Basic/Standard/Premium/Consumption/V2 variants).')
  skuRoot: 'Basic' | 'BasicV2' | 'Consumption' | 'Developer' | 'Premium' | 'Standard' | 'StandardV2' | null

  @description('Required. Capacity for the chosen SKU.')
  skuCapacity: int

  @description('Optional. Tags to apply to the API Management service.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }

  @description('Required. Tenant access configuration for the management plane.')
  tenantAccess: {
    @description('Required. Enable tenant access for the management plane.')
    enabled: bool
  }
}

@export()
@description('Configuration object for the Azure Firewall to be deployed.')
type FirewallDefinitionType = {
  @description('Optional. Azure Firewall name.')
  name: string?

  @description('Required. Azure Firewall SKU (e.g., AZFW_VNet).')
  sku: string

  @description('Required. Azure Firewall tier (Standard/Premium/Basic).')
  tier: 'Basic' | 'Premium' | 'Standard' | null

  @description('Required. Availability zones to use (if any).')
  zones: int[]

  @description('Optional. Tags to apply to the firewall.')
  tags: {
    @description('Required. Arbitrary key for each tag.')
    *: string
  }
}

@export()
type FirewallPolicyRuleType = {
  @description('Required. Rule name.')
  name: string
  @description('Optional. Rule description.')
  description: string
  @description('Required. Destination IP addresses.')
  destinationAddresses: string[]
  @description('Required. Destination ports.')
  destinationPorts: string[]
  @description('Required. Source IP addresses.')
  sourceAddresses: string[]
  @description('Required. Allowed protocols (e.g., TCP, UDP, ICMP, Any).')
  protocols: string[]
}

@export()
@description('Definition of a Firewall Policy Rule Collection Input.')
type FirewallPolicyRuleCollectionInput = {
  @description('Required. Name of the rule collection.')
  name: string

  @description('Required. Action to apply on the rule collection (Allow or Deny).')
  action: 'Allow' | 'Deny'

  @description('Required. List of rules contained in this rule collection.')
  rules: FirewallPolicyRuleType[]
}

@export()
@description('Definition of a Firewall Policy Rule Collection Group Input.')
type FirewallPolicyRcgInput = {
  @description('Required. Name of the Rule Collection Group.')
  name: string

  @description('Required. Priority of the Rule Collection Group (lower value = higher priority).')
  priority: int

  @description('Required. Rule collections that belong to this group.')
  collections: FirewallPolicyRuleCollectionInput[]
}

@export()
@description('Configuration object for the Azure Firewall Policy (rule collection groups).')
type FirewallPolicyDefinitionType = {
  @description('Optional. Name of the Network Rule Collection Group.')
  networkPolicyRuleCollectionGroupName: string?

  @description('Optional. Priority for the Network Rule Collection Group.')
  networkPolicyRuleCollectionGroupPriority: int?

  @description('Required. Network rules to include in the policy (can be empty).')
  @minLength(0)
  networkRules: FirewallPolicyRuleType[]

  @description('Optional. List of custom Rule Collection Groups with collections and rules.')
  ruleCollectionGroups: FirewallPolicyRcgInput[]?
}

@export()
@description('Configuration object for VNet peering with a hub network.')
type HuVnetPeeringDefinitionType = {
  @description('Required. Resource ID of the hub (peer) VNet.')
  peerVnetResourceId: string

  @description('Required. Hub firewall private IP address for routing (if applicable).')
  firewallIpAddress: string

  @description('Optional. Name of the peering from spoke to hub.')
  name: string?

  @description('Required. Allow forwarded traffic across the peering.')
  allowForwardedTraffic: bool

  @description('Required. Allow gateway transit across the peering.')
  allowGatewayTransit: bool

  @description('Required. Allow virtual network access across the peering.')
  allowVirtualNetworkAccess: bool

  @description('Required. Create reverse peering from hub back to this VNet.')
  createReversePeering: bool

  @description('Required. Reverse peering: allow forwarded traffic.')
  reverseAllowForwardedTraffic: bool

  @description('Required. Reverse peering: allow gateway transit.')
  reverseAllowGatewayTransit: bool

  @description('Required. Reverse peering: allow VNet access.')
  reverseAllowVirtualNetworkAccess: bool

  @description('Required. Name of the reverse peering (hub->spoke).')
  reverseName: string

  @description('Required. Reverse peering: use remote gateways.')
  reverseUseRemoteGateways: bool

  @description('Required. Use remote gateways on the spoke peering.')
  useRemoteGateways: bool
}
