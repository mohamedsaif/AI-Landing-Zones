///////////////////////////////////////////////////////////////////////////////////////////////////
// main.bicep
//
// Purpose: Landing Zone for GenAI app resources + AI Foundry pattern, network-isolated by default.
//
// How to read this file:
//   1  PARAMETERS
//       1.1 Imports
//       1.2 General configuration (location, tags, token)
//       1.3 Reuse existing services (resourceIds)
//       1.4 Deploy Toggles
//       1.5 Service definitions (VNet, Observability, Containers, Data/Security, App Config, PDNS IDs,
//           AI Foundry, Gateways, APIM, Firewall, Hub Peering)
//   2  VARIABLES (globals)
//   3  RESOURCES (grouped by domain)
//       3.1 Networking (VNet)
//       3.2 Deploy/has flags + subnet helpers
//       3.3 Private DNS Zones
//       3.4 Private Endpoints (helpers + per-service)
//       3.5 Existing resources (APIM, AGW, Firewall)
//       3.6 Observability (LAW, App Insights)
//       3.7 Container Apps Environment
//       3.8 Container Apps
//       3.9  App Services Backing Services (ACR, Cosmos, KV, KV for AF, Storage, Search, App Config)
//       3.10 AI Foundry (AVM pattern)
//       3.11 Gateways (WAF policy, App Gateway, Azure Firewall, APIM)
//       3.12 Hub/Spoke Peering
//       3.13 Grounding with Bing Search
//   4  OUTPUTS
//
///////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// 1. PARAMETERS
//////////////////////////////////////////////////////////////////////////

// 1.1 Imports
import * as types from 'common/types.bicep'

// 1.2 General Configuration (location, tags, naming token, global flags)
@description('Required.  Azure region for AI Foundry resources. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('Optional.  Tags applied to all deployed resources.')
param tags object = {}

@description('Optional.  Deterministic token for resource names; auto-generated if not provided.')
param resourceToken string = toLower(uniqueString(subscription().id, resourceGroup().name, location))

@description('Optional.  Base name to seed resource names; defaults to a 12-char token.')
param baseName string = substring(resourceToken, 0, 12)

@description('Optional.  Enable module telemetry. See https://aka.ms/avm/telemetryinfo.')
param enableTelemetry bool = true

@description('Optional. Enable network isolation posture (Private Endpoints + Private DNS).')
param networkIsolation bool = true

@description('Optional.  Enable platform landing zone integration.')
param flagPlatformLandingZone bool = false

@description('Optional.  Deploy GenAI app services; defaults to true.')
param deployGenAiAppBackingServices bool = true

// 1.3 Reuse Existing Services (resource IDs to reuse, leave empty to create)
@description('Optional.  Existing resource IDs to reuse; leave empty to create new resources.')
param resourceIds types.ResourceIdsType = {
  virtualNetworkResourceId: ''
  logAnalyticsWorkspaceResourceId: ''
  appInsightsResourceId: ''
  containerEnvResourceId: ''
  containerRegistryResourceId: ''
  dbAccountResourceId: ''
  keyVaultResourceId: ''
  storageAccountResourceId: ''
  searchServiceResourceId: ''
  appConfigResourceId: ''
  apimServiceResourceId: ''
  applicationGatewayResourceId: ''
  bastionHostResourceId: ''
  firewallResourceId: ''
  groundingServiceResourceId: ''
}

// 1.4 Deploy Toggles (per-service on/off; reuse still works via resourceIds)
@description('Optional.  Per-service deployment toggles; set false to skip creating a service. Reuse still works via resourceIds.')
param deployToggles types.DeployTogglesType = {
  logAnalytics: true
  appInsights: true

  containerEnv: true
  containerRegistry: true
  containerApps: true

  cosmosDb: true
  keyVault: true
  storageAccount: true
  searchService: true
  groundingWithBingSearch: true
  appConfig: true

  apiManagement: true
  applicationGateway: true
  firewall: true

  buildVm: true
  jumpVm: true
  virtualNetwork: true
  wafPolicy: true
}

// 1.5 Service Definitions
// 1.5.1 Virtual Network
@description('Required.  Virtual Network configuration (created when not reusing an existing VNet).')
param vnetDefinition types.VNetDefinitionType = {
  name: ''
  addressSpace: '192.168.0.0/16'
  dnsServers: []
  subnets: [
    {
      enabled: true
      name: 'agent-subnet'
      addressPrefix: '192.168.0.0/24'
      delegation: 'Microsoft.app/environments'
      serviceEndpoints: ['Microsoft.CognitiveServices']
    }
    {
      enabled: true
      name: 'pe-subnet'
      addressPrefix: '192.168.1.0/24'
      serviceEndpoints: ['Microsoft.AzureCosmosDB']
      privateEndpointNetworkPolicies: 'Disabled'
    }
    {
      enabled: true
      name: 'gateway-subnet'
      addressPrefix: '192.168.2.0/26'
    }
    {
      enabled: true
      name: 'AzureBastionSubnet'
      addressPrefix: '192.168.2.64/26'
    }
    {
      enabled: true
      name: 'AzureFirewallSubnet'
      addressPrefix: '192.168.2.128/26'
    }
    {
      enabled: true
      name: 'AppGatewaySubnet'
      addressPrefix: '192.168.3.0/24'
    }
    {
      enabled: true
      name: 'jumpbox-subnet'
      addressPrefix: '192.168.4.0/27'
    }
    {
      enabled: true
      name: 'aca-environment-subnet'
      addressPrefix: '192.168.4.64/27'
      delegation: 'Microsoft.app/environments'
      serviceEndpoints: ['Microsoft.AzureCosmosDB']
    }
    {
      enabled: true
      name: 'devops-build-agents-subnet'
      addressPrefix: '192.168.4.96/27'
    }
  ]

  // vnetPeeringConfiguration: {
  //   peerVnetResourceId: ''
  //   firewallIpAddress: ''
  //   name: ''
  //   allowForwardedTraffic: true
  //   allowGatewayTransit: false
  //   allowVirtualNetworkAccess: true
  //   createReversePeering: true
  //   reverseAllowForwardedTraffic: true
  //   reverseAllowGatewayTransit: false
  //   reverseAllowVirtualNetworkAccess: true
  //   reverseName: ''
  //   reverseUseRemoteGateways: false
  //   useRemoteGateways: false
  // }

  // vwanHubPeeringConfiguration: {
  //   peerVwanHubResourceId: ''
  // }

  tags: {}
}

// 1.5.2 Log Analytics Workspace
@description('Conditional.  Log Analytics Workspace configuration (required if you deploy App Insights and are not reusing an existing workspace).')
param logAnalyticsDefinition types.LogAnalyticsWorkspaceDefinitionType = {
  name: ''
  retention: 30
  sku: 'PerGB2018'
  tags: {}
}

// 1.5.3 Application Insights
@description('Conditional.  Application Insights configuration (used when App Insights is deployed).')
param appInsightsDefinition types.AppInsightsDefinitionType = {
  name: ''
  applicationType: 'web'
  kind: 'web'
  disableIpMasking: false
  tags: {}
}

// 1.5.4 Container App Environment
@description('Conditional.  Container App Environment configuration (used when Container Apps are deployed).')
param containerAppEnvDefinition types.ContainerAppEnvDefinitionType = {
  name: ''
  tags: {}
  subnetName: 'aca-environment-subnet'
  internalLoadBalancerEnabled: true
  zoneRedundancyEnabled: true
  userAssignedManagedIdentityIds: []
  workloadProfiles: [
    {
      name: 'Consumption'
      workloadProfileType: 'Consumption'
    }
    {
      workloadProfileType: 'D4'
      name: 'default'
      minimumCount: 1
      maximumCount: 3
    }
  ]
  enableDiagnosticSettings: true
  logAnalyticsWorkspaceResourceId: ''
  roleAssignments: []
}

// 1.5.5 Container Apps
@description('Optional. List of Container Apps to create.')
param containerAppsList types.ContainerAppDefinitionType[] = [
  {
    name: ''
    app_id: 'hello-world'
    profile_name: 'default'
    min_replicas: 1
    max_replicas: 1
    external: true
  }
]

// 1.5.6 Container Registry
@description('Conditional.  Container Registry configuration (used when ACR is deployed).')
param containerRegistryDefinition types.ContainerRegistryDefinitionType = {
  name: ''
  sku: 'Premium'
  tags: {}
}

// 1.5.7 Cosmos DB Account (GenAI app scope)
@description('Conditional.  Cosmos DB account configuration for the GenAI app (used when Cosmos DB is deployed).')
param cosmosDbDefinition types.GenAIAppCosmosDbDefinitionType = {
  name: ''
  publicNetworkAccessEnabled: false
  automaticFailoverEnabled: true
}

// 1.5.8 Key Vault (GenAI app scope)
@description('Conditional.  Key Vault configuration for the GenAI app (used when KV is deployed).')
param keyVaultDefinition types.KeyVaultDefinitionType = {
  name: ''
  sku: 'standard'
  tenantId: subscription().tenantId
  roleAssignments: []
  tags: {}
}

// 1.5.9 Storage Account (GenAI app scope)
@description('Conditional.  Storage Account configuration for the GenAI app (used when Storage is deployed).')
param storageAccountDefinition types.StorageAccountDefinitionType = {
  name: ''
  accountKind: 'StorageV2'
  accountTier: 'Standard'
  accountReplicationType: 'GRS'
  tags: {}
}

// 1.5.10 AI Search (GenAI app scope)
@description('Conditional.  Azure AI Search configuration for the GenAI app (used when Search is deployed).')
param searchDefinition types.KSAISearchDefinitionType = {
  name: ''
  sku: 'standard'
  publicNetworkAccessEnabled: false
  replicaCount: 2
  partitionCount: 1
  localAuthenticationEnabled: true
  semanticSearchSku: 'standard'
  tags: {}
}

// 1.5.11 App Configuration
@description('Conditional.  App Configuration store settings (used when App Configuration is deployed).')
param appConfigurationDefinition types.AppConfigurationDefinitionType = {
  name: ''
  sku: 'standard'
  localAuthEnabled: false
  purgeProtectionEnabled: true
  softDeleteRetentionInDays: 7
  tags: {}
  roleAssignments: []
}

// 1.5.12 Private DNS
// 1.5.12a Private DNS Zone IDs (optional reuse)
@description('Conditional.  Existing Private DNS Zone resource IDs per service; provide to reuse, or leave empty to create.')
param privateDnsZoneIds object = {
  cognitiveservices: ''
  openai: ''
  aiServices: ''
  search: ''
  cosmosSql: ''
  blob: ''
  keyVault: ''
  appConfig: ''
  containerApps: ''
  acr: ''
  appInsights: ''
}

// 1.5.12b Private DNS Zones (creation + VNet links)
@description('Conditional.  Private DNS Zones and VNet links configuration (used when creating zones).')
param privateDnsZones types.PrivateDnsZoneDefinitionsType = {
  existingZonesResourceGroupResourceId: ''
  allowInternetResolutionFallback: false
  networkLinks: [
    // Example (remove if not needed):
    // {
    //   vnetLinkName: 'link-to-spoke'
    //   vnetId: '/subscriptions/<subId>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>'
    //   resolutionPolicy: 'Default'
    // }
  ]
}

// 1.5.13 AI Foundry
@description('Optional.  AI Foundry project configuration (account/project, networking, associated resources, and deployments).')
param aiFoundryDefinition types.AiFoundryDefinitionType?

// 1.5.14 Grounding with Bing
@description('Optional.  Grounding with Bing Configuration.')
param groundingWithBingDefinition types.KSGroundingWithBingDefinitionType = {
  name: ''
  sku: 'G1'
  tags: {}
}

// 1.5.15 WAF Policy
@description('Conditional.  Web Application Firewall (WAF) policy configuration (required when Application Gateway with WAF is deployed).')
param wafPolicyDefinition types.WafPolicyDefinitionsType = {
  name: ''
  policySettings: {
    enabledState: 'Enabled'
    mode: 'Prevention'
    requestBodyCheck: true
    maxRequestBodySizeInKb: 128
    fileUploadLimitInMb: 100
  }
  managedRules: {
    exclusions: []
    managedRuleSets: [
      {
        type: 'OWASP'
        version: '3.2'
        ruleGroupOverride: []
      }
    ]
  }
  tags: {}
}

// 1.5.16 Application Gateway
@description('Conditional.  Application Gateway configuration (used when AGW is deployed).')
param appGatewayDefinition types.AppGatewayDefinitionType = {
  name: ''
  http2Enable: true
  authenticationCertificate: {}
  sku: { name: 'WAF_v2', tier: 'WAF_v2', capacity: 0 } // capacity 0 when autoscale is used
  autoscaleConfiguration: { minCapacity: 2, maxCapacity: 10 }
  backendAddressPools: {
    defaultPool: { name: 'defaultPool', fqdns: [], ipAddresses: [] }
  }
  backendHttpSettings: {
    defaultSetting: {
      cookieBasedAffinity: 'Disabled'
      name: 'defaultSetting'
      port: 80
      protocol: 'Http'
      affinityCookieName: ''
      hostName: ''
      path: ''
      pickHostNameFromBackendAddress: false
      probeName: ''
      requestTimeout: 30
      trustedRootCertificateNames: []
      authenticationCertificate: []
      connectionDraining: { enabled: false, drainTimeoutSec: 0 }
    }
  }
  frontendPorts: { port80: { name: 'port80', port: 80 } }
  httpListeners: {
    defaultListener: {
      name: 'defaultListener'
      frontendPortName: 'port80'
      frontendIpConfigurationName: 'privateFrontend'
      firewallPolicyId: ''
      requireSni: false
      hostName: ''
      hostNames: []
      sslCertificateName: ''
      sslProfileName: ''
      customErrorConfiguration: []
    }
  }
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
      name: 'defaultRule'
      ruleType: 'Basic'
      httpListenerName: 'defaultListener'
      backendAddressPoolName: ''
      priority: 100
      urlPathMapName: ''
      backendHttpSettingsName: ''
      redirectConfigurationName: 'defaultRedirect'
      rewriteRuleSetName: ''
    }
  }
  rewriteRuleSet: {}
  sslCertificates: {}
  sslPolicy: {
    cipherSuites: []
    disabledProtocols: []
    minProtocolVersion: 'TLSv1_2'
    policyName: ''
    policyType: 'Custom'
  }
  sslProfile: {}
  trustedClientCertificate: {}
  trustedRootCertificate: {}
  urlPathMapConfigurations: {}
  tags: {}
  roleAssignments: []
  createPublicFrontend: true
}

// 1.5.17 API Management
@description('Conditional.  API Management configuration (used when APIM is deployed).')
param apimDefinition types.ApimDefinitionType = {
  name: ''
  publisherEmail: 'admin@example.com'
  publisherName: 'Contoso'
  additionalLocations: {}
  certificate: {}
  clientCertificateEnabled: false
  hostnameConfiguration: { management: {}, portal: {}, developerPortal: {}, proxy: {}, scm: {} }
  minApiVersion: '2019-12-01'
  notificationSenderEmail: 'apimgmt-noreply@azure.com'
  protocols: { enableHttp2: true }
  roleAssignments: []
  signIn: { enabled: true }
  signUp: { enabled: false, termsOfService: { consentRequired: false, enabled: false, text: '' } }
  skuRoot: 'Developer'
  skuCapacity: 1
  tags: {}
  tenantAccess: { enabled: true }
}

// 1.5.18 Azure Firewall
@description('Conditional.  Azure Firewall configuration (used when Firewall is deployed).')
param firewallDefinition types.FirewallDefinitionType = {
  name: ''
  sku: 'AZFW_VNet'
  tier: 'Standard'
  zones: []
  tags: {}
}

// 1.5.19 Azure Firewall Policy
@description('Optional.  Azure Firewall Policy configuration (only used if your deployment wires a policy).')
param firewallPolicyDefinition types.FirewallPolicyDefinitionType = {
  networkPolicyRuleCollectionGroupName: null
  networkPolicyRuleCollectionGroupPriority: 100
  networkRules: []
}

// 1.5.20 Hub VNet Peering
@description('Conditional.  Hub VNet peering configuration (required only when establishing hub-spoke peering).')
param hubVnetPeeringDefinition types.HuVnetPeeringDefinitionType = {
  name: ''
  peerVnetResourceId: ''
  firewallIpAddress: ''
  allowForwardedTraffic: true
  allowGatewayTransit: false
  allowVirtualNetworkAccess: true
  createReversePeering: true
  reverseAllowForwardedTraffic: true
  reverseAllowGatewayTransit: false
  reverseAllowVirtualNetworkAccess: true
  reverseName: ''
  reverseUseRemoteGateways: false
  useRemoteGateways: false
}

// 1.5.21 Build VM configuration
@description('Optional.  Build VM configuration to support CI/CD workers (Linux).')
param buildVmDefinition types.BuildVmDefinitionType = {
  name: ''
  sku: 'Standard_D2s_v5'
  adminUsername: 'azureuser'
  sshPublicKey: ''
  runner: 'azdo'
  azdo: {
    orgUrl: 'https://dev.azure.com/<org>'
    pool: 'Default'
  }
  tags: {}
  enableTelemetry: enableTelemetry
}

// 1.5.22 Jump VM configuration (Windows, Bastion-accessed)
@description('Optional.  Jump (bastion) VM configuration (Windows).')
param jumpVmDefinition types.JumpVmDefinitionType = {
  name: ''
  sku: 'Standard_D2s_v5'
  adminUsername: 'azureuser'
  vmKeyVaultSecName: 'jump-admin-password'
  tags: {}
  enableTelemetry: enableTelemetry
}

// 1.5.23 Dedicated Key Vault for JumpVM password (public network access for convenience with Bastion operators)
@description('Conditional.  Dedicated Key Vault for JumpVM secrets (public network).')
param bastionKeyVaultDefinition types.KeyVaultDefinitionType = {
  name: ''
  sku: 'standard'
  tenantId: subscription().tenantId
  roleAssignments: []
  tags: {}
}

// 1.6 Secrets/Tokens
@secure()
@description('Conditional. Required when deploying Jump VM. Local admin password to set on the Windows JumpVM.')
param jumpVmAdminPassword string = ''

@secure()
@description('Optional. PAT used to register the Azure DevOps agent (when runner = azdo).')
param azdoPat string = ''

@secure()
@description('Optional. PAT used to request a GitHub runner registration token (when runner = github).')
param githubPat string = ''


//////////////////////////////////////////////////////////////////////////
// 2. VARIABLES 
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// 2. VARIABLES 
//////////////////////////////////////////////////////////////////////////

// ── 2.1 Tags & naming helpers
// Merge top-level tags once; used across modules
var _tags = union(tags, vnetDefinition.tags! ?? {})

// CAF-style abbreviations (drives consistent resource naming)
var _abbrs = loadJsonContent('./common/abbreviations.json')

// Name prefixes derived from abbreviations (some cannot contain hyphen)
var _acr = _abbrs.containers.containerRegistry // no hyphen allowed in ACR
var _bing = '${_abbrs.ai.bing}-'
var _ca = '${_abbrs.containers.containerApp}-'
var _cae = '${_abbrs.containers.containerAppsEnvironment}-'
var _afw = '${_abbrs.networking.firewall}-'
var _afwp = '${_abbrs.networking.firewallPolicy}-'
var _agw = '${_abbrs.networking.applicationGateway}-'
var _pe = '${_abbrs.networking.privateEndpoint}-'
var _pip = '${_abbrs.networking.publicIPAddress}-'
var _vnet = '${_abbrs.networking.virtualNetwork}-'
var _ai = '${_abbrs.managementGovernance.applicationInsights}-'
var _apim = '${_abbrs.integration.apiManagement}-'
var _appcs = '${_abbrs.configuration.appConfiguration}-'
var _law = '${_abbrs.managementGovernance.logAnalyticsWorkspace}-'
var _cos = '${_abbrs.databases.cosmosDbAccount}-'
var _kv = '${_abbrs.security.keyVault}-'
var _srch = '${_abbrs.ai.aiSearch}-'
var _st = _abbrs.storage.storageAccount // no hyphen allowed in Storage
var _vm = '${_abbrs.compute.virtualMachine}-'
var _waf = '${_abbrs.networking.webApplicationFirewallPolicy}-'


// ── 2.2 Common names & defaults (env, images, flags)
var _containerDummyImageName = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
var _containerEnvName = empty(containerAppEnvDefinition.name!) ? '${_cae}${baseName}' : containerAppEnvDefinition.name!
var _agwCreatePublicFrontend = bool(appGatewayDefinition.createPublicFrontend! ?? true)


// ── 2.3 Virtual network & subnets (reuse/new) + peering helpers
// Parse existing VNet Id (if provided)
var _vnetIdSegments = empty(resourceIds.virtualNetworkResourceId) ? [''] : split(resourceIds.virtualNetworkResourceId, '/')
var _existingVNetSubscriptionId = length(_vnetIdSegments) >= 3 ? _vnetIdSegments[2] : ''
var _existingVNetResourceGroupName = length(_vnetIdSegments) >= 5 ? _vnetIdSegments[4] : ''
var _existingVNetName = length(_vnetIdSegments) >= 1 ? last(_vnetIdSegments) : ''

// Effective VNet name (create path)
var _vnetName = empty(vnetDefinition.name!) ? '${_vnet}${baseName}' : vnetDefinition.name!

// Optional peering configuration (read safely without try/?.)
var _hasPeerCfg = contains(vnetDefinition, 'vnetPeeringConfiguration') && !empty(vnetDefinition.vnetPeeringConfiguration!)

// Read values with defaults
#disable-next-line BCP318
var _peerCfgName = _hasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'name') && !empty(vnetDefinition.vnetPeeringConfiguration!.name!)
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.name!
  : ''
#disable-next-line BCP318
var _peerCfgVnetId = _hasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'peerVnetResourceId') && !empty(vnetDefinition.vnetPeeringConfiguration!.peerVnetResourceId)
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.peerVnetResourceId!
  : ''
var _peerAllowVna = _hasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'allowVirtualNetworkAccess')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.allowVirtualNetworkAccess
  : true
var _peerAllowFwd = _hasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'allowForwardedTraffic')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.allowForwardedTraffic
  : true
var _peerAllowGw = _hasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'allowGatewayTransit')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.allowGatewayTransit
  : false
var _peerUseRgw = _hasPeerCfg && contains(vnetDefinition.vnetPeeringConfiguration!, 'useRemoteGateways')
  #disable-next-line BCP318
  ? vnetDefinition.vnetPeeringConfiguration!.useRemoteGateways
  : false

// Final peering helpers
var _hasPeer = !empty(_peerCfgVnetId)
var _peerName = empty(_peerCfgName) ? '${_vnetName}-to-peer' : _peerCfgName

// Whether we will deploy the VNet (vs reuse)
var _deployVnet = empty(resourceIds.virtualNetworkResourceId) && deployToggles.virtualNetwork

// VNet resourceId that works for both reuse/new
#disable-next-line BCP318
var _vnetResourceId = !empty(resourceIds.virtualNetworkResourceId)
  ? existingVNet.id
  : (_deployVnet ? virtualNetwork!.outputs.resourceId : '')

// Subnets used across modules (computed once)
var _peSubnetName = 'pe-subnet'
var _peSubnetId = empty(resourceIds.virtualNetworkResourceId)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', _vnetName, _peSubnetName)
  : '${existingVNet.id}/subnets/${_peSubnetName}'

var _agentSubnetName = 'agent-subnet'
var _agentSubnetId = empty(resourceIds.virtualNetworkResourceId)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', _vnetName, _agentSubnetName)
  : '${existingVNet.id}/subnets/${_agentSubnetName}'

var _agwSubnetName = 'AppGatewaySubnet'
var _agwSubnetId = empty(resourceIds.virtualNetworkResourceId)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', _vnetName, _agwSubnetName)
  : '${existingVNet.id}/subnets/${_agwSubnetName}'

var _acaInfraSubnetId = empty(resourceIds.virtualNetworkResourceId)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', _vnetName, containerAppEnvDefinition.subnetName!)
  : '${existingVNet.id}/subnets/${containerAppEnvDefinition.subnetName!}'

// Compute subnets (Jump/Build)
var _jumpSubnetName = 'jumpbox-subnet'
var _buildSubnetName = 'devops-build-agents-subnet'
var _jumpSubnetId = empty(resourceIds.virtualNetworkResourceId)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', _vnetName, _jumpSubnetName)
  : '${existingVNet.id}/subnets/${_jumpSubnetName}'
var _buildSubnetId = empty(resourceIds.virtualNetworkResourceId)
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', _vnetName, _buildSubnetName)
  : '${existingVNet.id}/subnets/${_buildSubnetName}'


// ── 2.4 Existing resource parsing (IDs → subscription/rg/name)
var _apimIdSegments = empty(resourceIds.apimServiceResourceId) ? [''] : split(resourceIds.apimServiceResourceId, '/')
var _apimSub = length(_apimIdSegments) >= 3 ? _apimIdSegments[2] : ''
var _apimRg = length(_apimIdSegments) >= 5 ? _apimIdSegments[4] : ''
var _apimNameExisting = length(_apimIdSegments) >= 1 ? last(_apimIdSegments) : ''

var _agwIdSegments = empty(resourceIds.applicationGatewayResourceId) ? [''] : split(resourceIds.applicationGatewayResourceId, '/')
var _agwSub = length(_agwIdSegments) >= 3 ? _agwIdSegments[2] : ''
var _agwRg = length(_agwIdSegments) >= 5 ? _agwIdSegments[4] : ''
var _agwNameExisting = length(_agwIdSegments) >= 1 ? last(_agwIdSegments) : ''

var _afwIdSegments = empty(resourceIds.firewallResourceId) ? [''] : split(resourceIds.firewallResourceId, '/')
var _afwSub = length(_afwIdSegments) >= 3 ? _afwIdSegments[2] : ''
var _afwRg = length(_afwIdSegments) >= 5 ? _afwIdSegments[4] : ''
var _afwNameExisting = length(_afwIdSegments) >= 1 ? last(_afwIdSegments) : ''

var _lawIdSegments = empty(resourceIds.logAnalyticsWorkspaceResourceId) ? [''] : split(resourceIds.logAnalyticsWorkspaceResourceId, '/')
var _existingLawSubscriptionId = length(_lawIdSegments) >= 3 ? _lawIdSegments[2] : ''
var _existingLawResourceGroupName = length(_lawIdSegments) >= 5 ? _lawIdSegments[4] : ''
var _existingLawName = length(_lawIdSegments) >= 1 ? last(_lawIdSegments) : ''

var _aiIdSegments = empty(resourceIds.appInsightsResourceId) ? [''] : split(resourceIds.appInsightsResourceId, '/')
var _existingAISubscriptionId = length(_aiIdSegments) >= 3 ? _aiIdSegments[2] : ''
var _existingAIResourceGroupName = length(_aiIdSegments) >= 5 ? _aiIdSegments[4] : ''
var _existingAIName = length(_aiIdSegments) >= 1 ? last(_aiIdSegments) : ''

var _envIdSegments = empty(resourceIds.containerEnvResourceId) ? [''] : split(resourceIds.containerEnvResourceId, '/')
var _existingEnvSubscriptionId = length(_envIdSegments) >= 3 ? _envIdSegments[2] : ''
var _existingEnvResourceGroup = length(_envIdSegments) >= 5 ? _envIdSegments[4] : ''
var _existingEnvName = length(_envIdSegments) >= 1 ? last(_envIdSegments) : ''

var _acrIdSegments = empty(resourceIds.containerRegistryResourceId) ? [''] : split(resourceIds.containerRegistryResourceId, '/')
var _existingAcrSub = length(_acrIdSegments) >= 3 ? _acrIdSegments[2] : ''
var _existingAcrRg = length(_acrIdSegments) >= 5 ? _acrIdSegments[4] : ''
var _existingAcrName = length(_acrIdSegments) >= 1 ? last(_acrIdSegments) : ''

var _cosmosIdSegments = empty(resourceIds.dbAccountResourceId) ? [''] : split(resourceIds.dbAccountResourceId, '/')
var _existingCosmosSub = length(_cosmosIdSegments) >= 3 ? _cosmosIdSegments[2] : ''
var _existingCosmosRg = length(_cosmosIdSegments) >= 5 ? _cosmosIdSegments[4] : ''
var _existingCosmosName = length(_cosmosIdSegments) >= 1 ? last(_cosmosIdSegments) : ''

var _kvIdSegments = empty(resourceIds.keyVaultResourceId) ? [''] : split(resourceIds.keyVaultResourceId, '/')
var _existingKvSub = length(_kvIdSegments) >= 3 ? _kvIdSegments[2] : ''
var _existingKvRg = length(_kvIdSegments) >= 5 ? _kvIdSegments[4] : ''
var _existingKvName = length(_kvIdSegments) >= 1 ? last(_kvIdSegments) : ''

var _saIdSegments = empty(resourceIds.storageAccountResourceId) ? [''] : split(resourceIds.storageAccountResourceId, '/')
var _existingSaSub = length(_saIdSegments) >= 3 ? _saIdSegments[2] : ''
var _existingSaRg = length(_saIdSegments) >= 5 ? _saIdSegments[4] : ''
var _existingSaName = length(_saIdSegments) >= 1 ? last(_saIdSegments) : ''

var _searchIdSegments = empty(resourceIds.searchServiceResourceId) ? [''] : split(resourceIds.searchServiceResourceId, '/')
var _existingSearchSub = length(_searchIdSegments) >= 3 ? _searchIdSegments[2] : ''
var _existingSearchRg = length(_searchIdSegments) >= 5 ? _searchIdSegments[4] : ''
var _existingSearchName = length(_searchIdSegments) >= 1 ? last(_searchIdSegments) : ''

var _appcsIdSegments = empty(resourceIds.appConfigResourceId) ? [''] : split(resourceIds.appConfigResourceId, '/')
var _existingAppcsSub = length(_appcsIdSegments) >= 3 ? _appcsIdSegments[2] : ''
var _existingAppcsRg = length(_appcsIdSegments) >= 5 ? _appcsIdSegments[4] : ''
var _existingAppcsName = length(_appcsIdSegments) >= 1 ? last(_appcsIdSegments) : ''


// ── 2.5 Service defaults for create path (compact objects)
var _cosmosDef = cosmosDbDefinition ?? { name: '' }
var _storageAccountDef = storageAccountDefinition ?? { name: '', publicNetworkAccessEnabled: false, tags: {} }
var _searchDef = searchDefinition ?? { name: '', tags: {} }


// ── 2.6 Effective names/SKUs (create path) + friendly names
var _acrEffectiveSku = !empty(containerRegistryDefinition.sku!) ? containerRegistryDefinition.sku! : 'Premium'
var _acrNameEffective = !empty(containerRegistryDefinition.name!) ? containerRegistryDefinition.name! : '${_acr}${baseName}'

var _appConfigName = empty((appConfigurationDefinition ?? { name: '' }).name!)
  ? '${_appcs}${baseName}'
  : (appConfigurationDefinition.name!)

var _wafName = empty(wafPolicyDefinition.name!) ? '${_waf}${baseName}' : wafPolicyDefinition.name!
var _agwName = empty(appGatewayDefinition.name!) ? '${_agw}${baseName}' : appGatewayDefinition.name!

// Convenience alias for downstream modules
var agwName = _agwName
var agwId = resourceId('Microsoft.Network/applicationGateways', agwName)
var agwSubnet = _agwSubnetId

var _afwPolicyName = '${_afwp}${baseName}'
var _afwName = empty(firewallDefinition.name!) ? '${_afw}${baseName}' : firewallDefinition.name!
var _apimName = empty(apimDefinition.name!) ? '${_apim}${baseName}' : apimDefinition.name!
var _bastionKvName = empty(bastionKeyVaultDefinition.name!) ? '${_kv}${baseName}-jump' : bastionKeyVaultDefinition.name!
var _bingNameEffective = empty(groundingWithBingDefinition.name!) ? '${_bing}${baseName}' : groundingWithBingDefinition.name!


// ── 2.7 Deployment switches & “has” state (create vs reuse)
var _deploySa = empty(resourceIds.storageAccountResourceId) && deployGenAiAppBackingServices && deployToggles.storageAccount
var _deployCosmos = empty(resourceIds.dbAccountResourceId) && deployGenAiAppBackingServices && deployToggles.cosmosDb
var _deploySearch = empty(resourceIds.searchServiceResourceId) && deployGenAiAppBackingServices && deployToggles.searchService
var _deployKv = empty(resourceIds.keyVaultResourceId) && deployGenAiAppBackingServices && deployToggles.keyVault
var _deployContainerAppEnv = empty(resourceIds.containerEnvResourceId) && deployGenAiAppBackingServices && deployToggles.containerEnv
var _deployContainerApps = deployGenAiAppBackingServices && _hasContainerEnv && deployToggles.containerApps && length(containerAppsList) > 0
var _deployAppConfig = empty(resourceIds.appConfigResourceId) && deployGenAiAppBackingServices && deployToggles.appConfig
var _deployAcr = empty(resourceIds.containerRegistryResourceId) && deployGenAiAppBackingServices && deployToggles.containerRegistry
var _deployApim = empty(resourceIds.apimServiceResourceId) && deployToggles.apiManagement
var _deployAppGateway = empty(resourceIds.applicationGatewayResourceId) && deployToggles.applicationGateway
var _deployFirewall = empty(resourceIds.firewallResourceId) && deployToggles.firewall

var _isPlatformLz = flagPlatformLandingZone
var _deployPdnsAndPe = networkIsolation && !_isPlatformLz
var _deployBuildVm = deployToggles.buildVm && !_isPlatformLz
var _deployJumpVm = deployToggles.jumpVm && !_isPlatformLz && !empty(jumpVmAdminPassword)

// Observability coupling (App Insights requires LAW)
var _deployLogAnalytics = empty(resourceIds.logAnalyticsWorkspaceResourceId) && deployToggles.logAnalytics
var _hasLogAnalytics = (!empty(resourceIds.logAnalyticsWorkspaceResourceId)) || (_deployLogAnalytics)
var _deployAppInsights = empty(resourceIds.appInsightsResourceId) && deployToggles.appInsights && _hasLogAnalytics
var _hasAppInsights = (!empty(resourceIds.appInsightsResourceId)) || (_deployAppInsights)

// Decide if Bing module runs (create or reuse+connect)
var _invokeBingModule = (!empty(resourceIds.groundingServiceResourceId)) || (deployToggles.groundingWithBingSearch && empty(resourceIds.groundingServiceResourceId))

// “Has” state for GenAI app stack (create or reuse)
var _hasStorage = (!empty(resourceIds.storageAccountResourceId)) || (_deploySa)
var _hasCosmos = (!empty(resourceIds.dbAccountResourceId)) || (_deployCosmos)
var _hasSearch = (!empty(resourceIds.searchServiceResourceId)) || (_deploySearch)
var _hasKv = (!empty(resourceIds.keyVaultResourceId)) || (_deployKv)
var _hasContainerEnv = (!empty(resourceIds.containerEnvResourceId)) || (_deployContainerAppEnv)
var _hasAppConfig = (!empty(resourceIds.appConfigResourceId)) || (_deployAppConfig)
var _hasAcr = (!empty(resourceIds.containerRegistryResourceId)) || (_deployAcr)


// ── 2.8 Observability effective values (LAW Id, AI connection)
var _laIdEffective = !empty(resourceIds.logAnalyticsWorkspaceResourceId)
  ? resourceIds.logAnalyticsWorkspaceResourceId
  : (_deployLogAnalytics ? logAnalytics!.outputs.resourceId : '')
var _laCustomerIdEffective = !empty(resourceIds.logAnalyticsWorkspaceResourceId)
  ? reference(resourceIds.logAnalyticsWorkspaceResourceId, '2022-10-01', 'Full').properties.customerId
  : (_deployLogAnalytics ? logAnalytics!.outputs.logAnalyticsWorkspaceId : '')
var _laSharedKeyEffective = !empty(resourceIds.logAnalyticsWorkspaceResourceId)
  ? listKeys(resourceIds.logAnalyticsWorkspaceResourceId, '2020-08-01').primarySharedKey
  #disable-next-line BCP318
  : (_deployLogAnalytics ? logAnalytics.outputs.primarySharedKey : '')


// ── 2.9 Effective resourceIds for dependent modules (env, ACR, App Config)
var _containerEnvIdEffective = !empty(resourceIds.containerEnvResourceId)
  ? resourceIds.containerEnvResourceId
  #disable-next-line BCP318
  : containerEnv.outputs.resourceId

var _acrResourceId = !empty(resourceIds.containerRegistryResourceId)
  ? existingAcr.id
  : (_deployAcr ? resourceId('Microsoft.ContainerRegistry/registries', _acrNameEffective) : '')

var _appConfigResourceId = !empty(resourceIds.appConfigResourceId)
  ? resourceIds.appConfigResourceId
  : (_deployAppConfig ? resourceId('Microsoft.AppConfiguration/configurationStores', _appConfigName) : '')


// ── 2.10 AI Foundry inputs & derived values
var _afDefaults = {
  baseUniqueName: ''
  location: location
  enableTelemetry: enableTelemetry
  aiProjects: []
  aiModelDeployments: [
    {
      name: 'chat'
      raiPolicyName: ''
      versionUpgradeOption: ''
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
    {
      name: 'text-embedding'
      raiPolicyName: ''
      versionUpgradeOption: ''
      model: {
        format: 'OpenAI'
        name: 'text-embedding-3-large'
        version: '1'
      }
      scale: {
        capacity: 1
        family: ''
        size: ''
        tier: ''
        type: 'Standard'
      }
    }
  ]
  lock: { kind: 'None', name: '' }
  includeAssociatedResources: true
  privateEndpointSubnetResourceId: ''
  aiFoundryConfiguration: {
    accountName: ''
    location: location
    sku: 'S0'
    createCapabilityHosts: false
    allowProjectManagement: true
    networking: {
      agentServiceSubnetResourceId: ''
      cognitiveServicesPrivateDnsZoneResourceId: ''
      openAiPrivateDnsZoneResourceId: ''
      aiServicesPrivateDnsZoneResourceId: ''
    }
    project: { name: '', displayName: '', desc: 'This is the default project for AI Foundry.' }
    roleAssignments: []
  }
  aiSearchConfiguration: {
    existingResourceId: ''
    name: 'srch-${baseName}-af'
    privateDnsZoneResourceId: ''
    roleAssignments: []
  }
  keyVaultConfiguration: {
    existingResourceId: ''
    name: 'kv-${baseName}-af'
    privateDnsZoneResourceId: ''
    roleAssignments: []
  }
  storageAccountConfiguration: {
    existingResourceId: ''
    name: 'st${baseName}af'
    blobPrivateDnsZoneResourceId: ''
    roleAssignments: []
  }
  cosmosDbConfiguration: {
    existingResourceId: ''
    name: 'cos${baseName}af'
    privateDnsZoneResourceId: ''
    roleAssignments: []
  }
}

var _afParam = union(_afDefaults, aiFoundryDefinition ?? {})

// Safe defaults from _afParam 
var _afBaseUniqueName = contains(_afParam!, 'baseUniqueName') && !empty(_afParam!.baseUniqueName!) ? _afParam.baseUniqueName! : ''
var _afLocation = contains(_afParam, 'location') && !empty(_afParam.location!) ? _afParam.location! : location
var _afConfigObj = contains(_afParam, 'aiFoundryConfiguration') ? _afParam.aiFoundryConfiguration! : {}
var _afAgentSvcEnabled = bool((_afConfigObj.?createCapabilityHosts ?? false))
var _afPeSubnetParam = contains(_afParam, 'privateEndpointSubnetResourceId') && !empty(_afParam.privateEndpointSubnetResourceId!) ? _afParam.privateEndpointSubnetResourceId! : ''
var _afSearchCfg = contains(_afParam, 'aiSearchConfiguration') ? _afParam.aiSearchConfiguration! : {}
var _afCosmosCfg = contains(_afParam, 'cosmosDbConfiguration') ? _afParam.cosmosDbConfiguration! : {}
var _afKvCfg = contains(_afParam, 'keyVaultConfiguration') ? _afParam.keyVaultConfiguration! : {}
var _afStorageCfg = contains(_afParam, 'storageAccountConfiguration') ? _afParam.storageAccountConfiguration! : {}

// Source entries and mapped AVM model deployments
var _afModelEntries = _afParam.aiModelDeployments
var _afModelDeployments = [
  for (md, idx) in _afModelEntries: union(
    {
      name: empty(md.name) ? 'model-${idx}' : string(md.name)
      model: { format: md.model.format, name: md.model.name, version: md.model.version }
      sku: { capacity: int(md.scale.capacity), name: empty(md.scale.type) ? 'Standard' : string(md.scale.type) }
    },
    empty(md.raiPolicyName!) ? {} : { raiPolicyName: md.raiPolicyName! },
    empty(md.versionUpgradeOption!) ? {} : { versionUpgradeOption: md.versionUpgradeOption! }
  )
]

// Ask AVM to create AF-associated deps only if Agent Service is enabled
var _afWantsDeps = _afAgentSvcEnabled && (_afParam.includeAssociatedResources! ?? true)


// ── 2.11 Private DNS decisions (reuse/create) + AF PDNS bindings
// Which PDNS zones are being reused vs. created here?
var _useExistingPdz = {
  cognitiveservices: !empty(privateDnsZoneIds.cognitiveservices)
  openai: !empty(privateDnsZoneIds.openai)
  aiServices: !empty(privateDnsZoneIds.aiServices)
  search: !empty(privateDnsZoneIds.search)
  cosmosSql: !empty(privateDnsZoneIds.cosmosSql)
  blob: !empty(privateDnsZoneIds.blob)
  keyVault: !empty(privateDnsZoneIds.keyVault)
  appConfig: !empty(privateDnsZoneIds.appConfig)
  containerApps: !empty(privateDnsZoneIds.containerApps)
  acr: !empty(privateDnsZoneIds.acr)
  appInsights: !empty(privateDnsZoneIds.appInsights)
}

// Whether AF/app stacks require specific PDNS zones
var _foundryNeedsCosmosPdns = _afWantsDeps && _afAgentSvcEnabled
var _foundryNeedsBlobPdns = _afWantsDeps && _afAgentSvcEnabled
var _foundryNeedsSearchPdns = _afWantsDeps && _afAgentSvcEnabled
var _foundryNeedsKvPdns = _afWantsDeps && _afAgentSvcEnabled

var _appNeedsCosmosPdns = _hasCosmos
var _appNeedsBlobPdns = _hasStorage
var _appNeedsSearchPdns = _hasSearch
var _appNeedsKvPdns = _hasKv

var _needCosmosPdns = _appNeedsCosmosPdns || _foundryNeedsCosmosPdns
var _needBlobPdns = _appNeedsBlobPdns || _foundryNeedsBlobPdns
var _needSearchPdns = _appNeedsSearchPdns || _foundryNeedsSearchPdns
var _needKvPdns = _appNeedsKvPdns || _foundryNeedsKvPdns

// Map caller-provided VNet links to AVM shape once
var _pdnsLinksFromParam = [
  for l in privateDnsZones.networkLinks: {
    name: l.vnetLinkName
    registrationEnabled: false
    virtualNetworkResourceId: l.vnetId
  }
]

// AF networking & PDNS bindings (only when not platform-managed)
var _afNetworkingConfig = !flagPlatformLandingZone && _afAgentSvcEnabled
  ? {
      networking: {
        agentServiceSubnetResourceId: _agentSubnetId
        aiServicesPrivateDnsZoneResourceId: !_useExistingPdz.aiServices
          #disable-next-line BCP318
          ? privateDnsZoneAiService.outputs.resourceId
          : privateDnsZoneIds.aiServices
        cognitiveServicesPrivateDnsZoneResourceId: !_useExistingPdz.cognitiveservices
          #disable-next-line BCP318
          ? privateDnsZoneCogSvcs.outputs.resourceId
          : privateDnsZoneIds.cognitiveservices
        openAiPrivateDnsZoneResourceId: !_useExistingPdz.openai
          #disable-next-line BCP318
          ? privateDnsZoneOpenAi.outputs.resourceId
          : privateDnsZoneIds.openai
      }
    }
  : {}

var _afAiSearchPdzBinding = !flagPlatformLandingZone
  ? {
      privateDnsZoneResourceId: !_useExistingPdz.search
        #disable-next-line BCP318
        ? privateDnsZoneSearch.outputs.resourceId
        : privateDnsZoneIds.search
    }
  : {}

var _afCosmosPdzBinding = !flagPlatformLandingZone
  ? {
      privateDnsZoneResourceId: !_useExistingPdz.cosmosSql
        #disable-next-line BCP318
        ? privateDnsZoneCosmos.outputs.resourceId
        : privateDnsZoneIds.cosmosSql
    }
  : {}

var _afKvPdzBinding = !flagPlatformLandingZone
  ? {
      privateDnsZoneResourceId: !_useExistingPdz.keyVault
        #disable-next-line BCP318
        ? privateDnsZoneKeyVault.outputs.resourceId
        : privateDnsZoneIds.keyVault
    }
  : {}

var _afBlobPdzBinding = !flagPlatformLandingZone
  ? {
      blobPrivateDnsZoneResourceId: !_useExistingPdz.blob
        #disable-next-line BCP318
        ? privateDnsZoneBlob.outputs.resourceId
        : privateDnsZoneIds.blob
    }
  : {}

// ── 2.12 WAF/AGW/Firewall policy helpers
var _policySettingsForModule = {
  state: wafPolicyDefinition.policySettings.enabledState
  mode: wafPolicyDefinition.policySettings.mode
  requestBodyCheck: wafPolicyDefinition.policySettings.requestBodyCheck
  maxRequestBodySizeInKb: wafPolicyDefinition.policySettings.maxRequestBodySizeInKb
  fileUploadLimitInMb: wafPolicyDefinition.policySettings.fileUploadLimitInMb
}

// Whether to deploy a WAF policy for AGW
var _deployWafPolicy = _deployAppGateway && deployToggles.wafPolicy

// If deploying WAF policy, cache its resourceId for AGW wiring
var _wafPolicyResourceId = _deployWafPolicy ? wafPolicy!.outputs.resourceId : ''

// Public IP name for AGW (only used if public frontend is enabled)
var _agwPipName = '${_pip}${_agw}${baseName}'

// Firewall policy wiring and rules (optional)
var _deployAfwPolicy = _deployFirewall && (length(firewallPolicyDefinition.networkRules) > 0 || !empty(firewallPolicyDefinition.networkPolicyRuleCollectionGroupName!))
var _rcgName = empty(firewallPolicyDefinition.networkPolicyRuleCollectionGroupName!) ? 'networkRules' : firewallPolicyDefinition.networkPolicyRuleCollectionGroupName!
var _rcgPriority = firewallPolicyDefinition.networkPolicyRuleCollectionGroupPriority! ?? 100
var _networkRulesForModule = [
  for r in firewallPolicyDefinition.networkRules: {
    name: r.name
    ruleType: 'NetworkRule'
    ...(empty(r.description) ? {} : { description: r.description })
    sourceAddresses: r.sourceAddresses
    destinationAddresses: r.destinationAddresses
    destinationPorts: r.destinationPorts
    ipProtocols: r.protocols
  }
]


// ── 2.13 Compute helpers (Jump VM, Build VM)
// Jump VM OS/image and computerName normalization
var _jumpVmOsType = contains(jumpVmDefinition, 'osType') && !empty(jumpVmDefinition.osType!) ? jumpVmDefinition.osType! : 'Windows'
var _defaultJumpWindows = { publisher: 'MicrosoftWindowsServer', offer: 'WindowsServer', sku: '2022-datacenter-azure-edition', version: 'latest' }
var _jumpVmImageRef = contains(jumpVmDefinition, 'imageReference') && !empty(string(jumpVmDefinition.imageReference!)) ? jumpVmDefinition.imageReference! : _defaultJumpWindows

var _rawJumpName = empty(jumpVmDefinition.name!) ? '${_vm}${baseName}jmp' : replace(replace(replace(jumpVmDefinition.name!, ' ', ''), '_', ''), '.', '')
var _maxComputerNameLength = 15
var _jumpNameLen = min(_maxComputerNameLength, length(_rawJumpName))
var _jumpComputerName = toLower(substring(_rawJumpName, 0, _jumpNameLen))

// Build VM OS/image and cloud-init templating
var _buildVmOsType = contains(buildVmDefinition, 'osType') && !empty(buildVmDefinition.osType!) ? buildVmDefinition.osType! : 'Linux'
var _defaultBuildUbuntu = { publisher: 'Canonical', offer: '0001-com-ubuntu-server-jammy', sku: '22_04-lts', version: 'latest' }
var _buildVmImageRef = contains(buildVmDefinition, 'imageReference') && !empty(string(buildVmDefinition.imageReference!)) ? buildVmDefinition.imageReference! : _defaultBuildUbuntu

// Normalize entire build VM object so nested props always exist
var _buildVmNormalized = union({ azdo: { orgUrl: '', pool: '', agentName: '', workFolder: '' }, github: { owner: '', repo: '', labels: '', agentName: '', workFolder: '' } }, buildVmDefinition)

// Render cloud-init from template with placeholders
var _t0 = loadTextContent('./common/build-cloudinit.yaml')
var _t1 = replace(_t0, '{0}', string(_buildVmNormalized.runner))
var _t2 = replace(_t1, '{1}', string(_buildVmNormalized.azdo.orgUrl))
var _t3 = replace(_t2, '{2}', string(_buildVmNormalized.azdo.pool))
var _t4 = replace(_t3, '{3}', string(_buildVmNormalized.azdo.agentName))
var _t5 = replace(_t4, '{4}', string(_buildVmNormalized.azdo.workFolder))
var _t6 = replace(_t5, '{5}', string(_buildVmNormalized.github.owner))
var _t7 = replace(_t6, '{6}', string(_buildVmNormalized.github.repo))
var _t8 = replace(_t7, '{7}', string(_buildVmNormalized.github.labels))
var _t9 = replace(_t8, '{8}', string(_buildVmNormalized.github.agentName))
var _t10 = replace(_t9, '{9}', string(_buildVmNormalized.github.workFolder))
var _t11 = replace(_t10, '{10}', string(azdoPat))
var _t12 = replace(_t11, '{11}', string(githubPat))
var _t13 = replace(_t12, '{12}', string(_buildVmNormalized.adminUsername))
var _t14 = replace(_t13, '{13}', string(_buildVmNormalized.sshPublicKey))
var _t15 = replace(_t14, '{14}', string(baseName))
var _buildCloudInit = _t15


// ── 2.14 Hub VNet (peer) parsing for reverse peering
var _peerVnetId = hubVnetPeeringDefinition.peerVnetResourceId
var _peerParts = split(_peerVnetId, '/')
var _peerSub = length(_peerParts) >= 3 ? _peerParts[2] : ''
var _peerRg = length(_peerParts) >= 5 ? _peerParts[4] : ''
var _peerVnetName = length(_peerParts) >= 9 ? _peerParts[8] : ''

//////////////////////////////////////////////////////////////////////////
// 3. RESOURCES
//////////////////////////////////////////////////////////////////////////

#disable-next-line no-deployments-resources
resource avmTelemetry 'Microsoft.Resources/deployments@2024-03-01' = if (enableTelemetry) {
  name: '46d3xbcp.ptn.aiml-landingzone.${replace('-..--..-', '.', '-')}.${substring(uniqueString(deployment().name, location), 0, 4)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
      outputs: {
        telemetry: {
          type: 'String'
          value: 'For more information, see https://aka.ms/avm/TelemetryInfo'
        }
      }
    }
  }
}

// ──────────────────────────────────────────────────────────────────────
// 3.1 Networking — VNet (reuse or create)
// ─────────────────────────────────────────────────────────────────────-

resource existingVNet 'Microsoft.Network/virtualNetworks@2024-07-01' existing = if (!empty(resourceIds.virtualNetworkResourceId)) {
  name: _existingVNetName
  scope: resourceGroup(_existingVNetSubscriptionId, _existingVNetResourceGroupName)
}

module virtualNetwork 'br/public:avm/res/network/virtual-network:0.7.0' = if (_deployVnet) {
  name: 'virtualNetworkDeployment'
  params: {
    name: _vnetName
    location: location
    tags: _tags
    addressPrefixes: [vnetDefinition.addressSpace]
    dnsServers: vnetDefinition.dnsServers!
    enableTelemetry: enableTelemetry
    subnets: [
      for s in vnetDefinition.subnets: {
        name: s.name
        addressPrefix: s.addressPrefix
        ...(contains(s, 'delegation') && !empty(s.delegation!) ? { delegation: s.delegation! } : {})
        ...(contains(s, 'serviceEndpoints') && !empty(s.serviceEndpoints!)
          ? { serviceEndpoints: s.serviceEndpoints! }
          : {})
      }
    ]
    peerings: _hasPeer
      ? [
          {
            name: _peerName
            remoteVirtualNetworkResourceId: _peerCfgVnetId
            allowVirtualNetworkAccess: _peerAllowVna
            allowForwardedTraffic: _peerAllowFwd
            allowGatewayTransit: _peerAllowGw
            useRemoteGateways: _peerUseRgw
          }
        ]
      : []
  }
}


// ──────────────────────────────────────────────────────────────────────
// 3.3 Private DNS Zones (create when isolated AND per-zone ID not provided)
// ─────────────────────────────────────────────────────────────────────-


// Cognitiveservices
module privateDnsZoneCogSvcs 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.cognitiveservices) {
  name: 'dep-cogsvcs-private-dns-zone'
  params: {
    name: 'privatelink.cognitiveservices.azure.com'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-cogsvcs-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// OpenAI
module privateDnsZoneOpenAi 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.openai) {
  name: 'dep-openai-private-dns-zone'
  params: {
    name: 'privatelink.openai.azure.com'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-openai-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// AI Services
module privateDnsZoneAiService 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.aiServices) {
  name: 'dep-aiservices-private-dns-zone'
  params: {
    name: 'privatelink.services.ai.azure.com'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-aiservices-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// Search (needed by GenAI app and/or AF)
module privateDnsZoneSearch 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.search && _needSearchPdns) {
  name: 'dep-search-std-private-dns-zone'
  params: {
    name: 'privatelink.search.windows.net'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-search-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// Cosmos (SQL) (needed by GenAI app and/or AF)
module privateDnsZoneCosmos 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.cosmosSql && _needCosmosPdns) {
  name: 'dep-cosmos-std-private-dns-zone'
  params: {
    name: 'privatelink.documents.azure.com'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-cosmos-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// Blob (needed by GenAI app and/or AF)
module privateDnsZoneBlob 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.blob && _needBlobPdns) {
  name: 'dep-blob-std-private-dns-zone'
  params: {
    name: 'privatelink.blob.${environment().suffixes.storage}'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-blob-std-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// Key Vault (tie creation to whether ANY stack needs KV)
module privateDnsZoneKeyVault 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.keyVault && _needKvPdns) {
  name: 'kv-private-dns-zone'
  params: {
    name: 'privatelink.vaultcore.azure.net'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-kv-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// App Configuration
module privateDnsZoneAppConfig 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.appConfig && _hasAppConfig) {
  name: 'appconfig-private-dns-zone'
  params: {
    name: 'privatelink.azconfig.io'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-appcfg-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// Container Apps (regional PDNS zone)
module privateDnsZoneContainerApps 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.containerApps && _hasContainerEnv) {
  name: 'dep-containerapps-env-private-dns-zone'
  params: {
    name: 'privatelink.${location}.azurecontainerapps.io'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-containerapps-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// Container Registry PDNS
module privateDnsZoneAcr 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.acr && _hasAcr) {
  name: 'acr-private-dns-zone'
  params: {
    name: 'privatelink.azurecr.io'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-acr-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// App Insights PDNS
module privateDnsZoneInsights 'br/public:avm/res/network/private-dns-zone:0.8.0' = if (_deployPdnsAndPe && !_useExistingPdz.appInsights && _hasAppInsights) {
  name: 'ai-private-dns-zone'
  params: {
    name: 'privatelink.applicationinsights.azure.com'
    location: 'global'
    tags: _tags
    enableTelemetry: enableTelemetry
    virtualNetworkLinks: length(_pdnsLinksFromParam) > 0
      ? _pdnsLinksFromParam
      : [
          {
            name: '${_vnetName}-ai-link'
            registrationEnabled: false
            virtualNetworkResourceId: _vnetResourceId
          }
        ]
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.4 Private Endpoints (helpers + per-service)
// ─────────────────────────────────────────────────────────────────────-


// App Configuration
module privateEndpointAppConfig 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasAppConfig) {
  name: 'appconfig-private-endpoint'
  params: {
    name: '${_pe}${_appcs}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'appConfigConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.appConfigResourceId)
            ? configurationStore!.outputs.resourceId
            : existingAppConfig.id
          groupIds: ['configurationStores']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'appConfigDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'appConfigARecord'
          privateDnsZoneResourceId: !_useExistingPdz.appConfig
            ? privateDnsZoneAppConfig!.outputs.resourceId
            : privateDnsZoneIds.appConfig
        }
      ]
    }
  }
}

// Container Apps Environment
module privateEndpointContainerAppsEnv 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasContainerEnv) {
  name: 'containerapps-env-private-endpoint'
  params: {
    name: '${_pe}${_cae}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'ccaConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.containerEnvResourceId)
            ? containerEnv!.outputs.resourceId
            : existingContainerEnv.id
          groupIds: ['managedEnvironments']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'ccaDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'ccaARecord'
          privateDnsZoneResourceId: !_useExistingPdz.containerApps
            ? privateDnsZoneContainerApps!.outputs.resourceId
            : privateDnsZoneIds.containerApps
        }
      ]
    }
  }
}

// Azure Container Registry
module privateEndpointAcr 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasAcr) {
  name: 'acr-private-endpoint'
  params: {
    name: '${_pe}${_acr}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'acrConnection'
        properties: {
          privateLinkServiceId: _acrResourceId
          groupIds: ['registry']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'acrDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'acrARecord'
          #disable-next-line BCP318
          privateDnsZoneResourceId: !_useExistingPdz.acr ? privateDnsZoneAcr.outputs.resourceId : privateDnsZoneIds.acr
        }
      ]
    }
  }
  dependsOn: [
    #disable-next-line BCP321
    (_deployAcr) ? registry : null
  ]
}

// Storage (blob)
module privateEndpointStorageBlob 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasStorage) {
  name: 'blob-private-endpoint'
  params: {
    name: '${_pe}${_st}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'blobConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.storageAccountResourceId)
            #disable-next-line BCP318
            ? storageAccount.outputs.resourceId
            : existingStorage.id
          groupIds: ['blob']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'blobDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'blobARecord'
          privateDnsZoneResourceId: !_useExistingPdz.blob
            #disable-next-line BCP318
            ? privateDnsZoneBlob.outputs.resourceId
            : privateDnsZoneIds.blob
        }
      ]
    }
  }
}

// Cosmos DB (SQL)
module privateEndpointCosmos 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasCosmos) {
  name: 'cosmos-private-endpoint'
  params: {
    name: '${_pe}${_cos}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'cosmosConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.dbAccountResourceId)
            #disable-next-line BCP318
            ? databaseAccount.outputs.resourceId
            : existingCosmos.id
          groupIds: ['Sql']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'cosmosDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'cosmosARecord'
          privateDnsZoneResourceId: !_useExistingPdz.cosmosSql
            #disable-next-line BCP318
            ? privateDnsZoneCosmos.outputs.resourceId
            : privateDnsZoneIds.cosmosSql
        }
      ]
    }
  }
}

// Azure AI Search
module privateEndpointSearch 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasSearch) {
  name: 'search-private-endpoint'
  params: {
    name: '${_pe}${_srch}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'searchConnection'
        properties: {
          privateLinkServiceId: empty(resourceIds.searchServiceResourceId)
            #disable-next-line BCP318
            ? searchService.outputs.resourceId
            : existingSearch.id
          groupIds: ['searchService']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'searchDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'searchARecord'
          privateDnsZoneResourceId: !_useExistingPdz.search
            #disable-next-line BCP318
            ? privateDnsZoneSearch.outputs.resourceId
            : privateDnsZoneIds.search
        }
      ]
    }
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.searchServiceResourceId)) ? searchService : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
    #disable-next-line BCP321
    (_deployPdnsAndPe && !_useExistingPdz.search && _needSearchPdns) ? privateDnsZoneSearch : null
  ]
}

// Key Vault (GenAI)
module privateEndpointKeyVault 'br/public:avm/res/network/private-endpoint:0.11.0' = if (_deployPdnsAndPe && _hasKv) {
  name: 'kv-private-endpoint'
  params: {
    name: '${_pe}${_kv}${baseName}'
    location: location
    tags: tags
    subnetResourceId: _peSubnetId
    enableTelemetry: enableTelemetry
    privateLinkServiceConnections: [
      {
        name: 'kvConnection'
        properties: {
          #disable-next-line BCP318
          privateLinkServiceId: empty(resourceIds.keyVaultResourceId) ? vault.outputs.resourceId : existingVault.id
          groupIds: ['vault']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'kvDnsZoneGroup'
      privateDnsZoneGroupConfigs: [
        {
          name: 'kvARecord'
          privateDnsZoneResourceId: !_useExistingPdz.keyVault
            #disable-next-line BCP318
            ? privateDnsZoneKeyVault.outputs.resourceId
            : privateDnsZoneIds.keyVault
        }
      ]
    }
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.5 Existing Resources (APIM, AGW, Firewall)
// ─────────────────────────────────────────────────────────────────────-
resource existingApim 'Microsoft.ApiManagement/service@2024-06-01-preview' existing = if (!empty(resourceIds.apimServiceResourceId)) {
  name: _apimNameExisting
  scope: resourceGroup(_apimSub, _apimRg)
}

resource existingAppGateway 'Microsoft.Network/applicationGateways@2024-07-01' existing = if (!empty(resourceIds.applicationGatewayResourceId)) {
  name: _agwNameExisting
  scope: resourceGroup(_agwSub, _agwRg)
}

resource existingFirewall 'Microsoft.Network/azureFirewalls@2024-07-01' existing = if (!empty(resourceIds.firewallResourceId)) {
  name: _afwNameExisting
  scope: resourceGroup(_afwSub, _afwRg)
}

// ─────────────────────────────────────────────────────────────────────-
// 3.6 Observability (LAW, App Insights)
// ─────────────────────────────────────────────────────────────────────-

resource existingLogAnalytics 'Microsoft.OperationalInsights/workspaces@2025-02-01' existing = if (!empty(resourceIds.logAnalyticsWorkspaceResourceId)) {
  name: _existingLawName
  scope: resourceGroup(_existingLawSubscriptionId, _existingLawResourceGroupName)
}

module logAnalytics 'br/public:avm/res/operational-insights/workspace:0.12.0' = if (_deployLogAnalytics) {
  name: 'deployLogAnalytics'
  params: {
    name: empty(logAnalyticsDefinition.name!) ? '${_law}${baseName}' : logAnalyticsDefinition.name!
    location: location
    skuName: logAnalyticsDefinition.sku
    dataRetention: logAnalyticsDefinition.retention
    tags: union(tags, logAnalyticsDefinition.tags! ?? {})
    managedIdentities: { systemAssigned: true }
    enableTelemetry: enableTelemetry
  }
}

// App Insights

resource existingAppInsights 'Microsoft.Insights/components@2020-02-02' existing = if (!empty(resourceIds.appInsightsResourceId)) {
  name: _existingAIName
  scope: resourceGroup(_existingAISubscriptionId, _existingAIResourceGroupName)
}

module appInsights 'br/public:avm/res/insights/component:0.6.0' = if (_deployAppInsights) {
  name: 'deployAppInsights'
  params: {
    name: empty(appInsightsDefinition.name!) ? '${_ai}${baseName}' : appInsightsDefinition.name!
    location: location
    workspaceResourceId: _laIdEffective
    applicationType: appInsightsDefinition.applicationType ?? 'web'
    kind: appInsightsDefinition.kind ?? 'web'
    disableIpMasking: appInsightsDefinition.disableIpMasking! ?? false
    tags: union(tags, appInsightsDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.logAnalyticsWorkspaceResourceId)) ? logAnalytics : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.7 Container Apps Environment (reuse or create)
// ─────────────────────────────────────────────────────────────────────-

resource existingContainerEnv 'Microsoft.App/managedEnvironments@2025-02-02-preview' existing = if (!empty(resourceIds.containerEnvResourceId)) {
  name: _existingEnvName
  scope: resourceGroup(_existingEnvSubscriptionId, _existingEnvResourceGroup)
}


module containerEnv 'br/public:avm/res/app/managed-environment:0.11.3' = if (_deployContainerAppEnv) {
  name: 'deployContainerEnv'
  params: {
    name: _containerEnvName
    location: location
    tags: union(tags, containerAppEnvDefinition.tags! ?? {})

    appLogsConfiguration: (_hasLogAnalytics && (containerAppEnvDefinition.enableDiagnosticSettings! ?? false))
      ? {
          destination: 'log-analytics'
          logAnalyticsConfiguration: {
            customerId: _laCustomerIdEffective
            sharedKey: _laSharedKeyEffective
          }
        }
      : null

    appInsightsConnectionString: empty(resourceIds.appInsightsResourceId)
      #disable-next-line BCP318
      ? appInsights.outputs.connectionString
      #disable-next-line BCP318
      : existingAppInsights.properties.ConnectionString

    // Key network settings
    internal: containerAppEnvDefinition.internalLoadBalancerEnabled
    infrastructureSubnetResourceId: _acaInfraSubnetId
    zoneRedundant: containerAppEnvDefinition.zoneRedundancyEnabled

    // forward profiles (optional but recommended)
    workloadProfiles: containerAppEnvDefinition.workloadProfiles
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
    #disable-next-line BCP321
    (empty(resourceIds.logAnalyticsWorkspaceResourceId)) ? logAnalytics : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.8 Container Apps
// ─────────────────────────────────────────────────────────────────────-


@batchSize(4)
module containerApps 'br/public:avm/res/app/container-app:0.18.1' = [
  for (app, index) in containerAppsList: if (_deployContainerApps) {
    name: empty(app.name!) ? '${_ca}${baseName}-${app.app_id}' : app.name!
    params: {
      name: empty(app.name!) ? '${_ca}${baseName}-${app.app_id}' : app.name!
      location: location
      environmentResourceId: _containerEnvIdEffective
      workloadProfileName: app.profile_name

      ingressExternal: bool(app.external!)
      ingressTargetPort: 80
      ingressTransport: 'auto'
      ingressAllowInsecure: false

      dapr: {
        enabled: true
        appId: app.app_id
        appPort: 80
        appProtocol: 'http'
      }

      managedIdentities: {
        systemAssigned: true
        userAssignedResourceIds: []
      }

      scaleSettings: {
        minReplicas: app.min_replicas
        maxReplicas: app.max_replicas
      }

      containers: [
        {
          name: app.app_id
          image: _containerDummyImageName
          resources: {
            cpu: '0.5'
            memory: '1.0Gi'
          }
          env: [
            {
              name: 'APP_CONFIG_ENDPOINT'
              value: empty(_appConfigResourceId) ? '' : 'https://${_appConfigName}.azconfig.io'
            }
          ]
        }
      ]

      tags: union(_tags, {
        'azd-service-name': app.app_id
      })
    }
    dependsOn: [
      #disable-next-line BCP321
      (empty(resourceIds.containerEnvResourceId)) ? containerEnv : null
      #disable-next-line BCP321
      (_deployPdnsAndPe && !_useExistingPdz.containerApps && _hasContainerEnv) ? privateDnsZoneContainerApps : null
      #disable-next-line BCP321
      (_deployPdnsAndPe && _hasContainerEnv) ? privateEndpointContainerAppsEnv : null
    ]
  }
]

// ─────────────────────────────────────────────────────────────────────-
// 3.9 App Services Backing Services — GenAI app scope (reuse or create)
// ─────────────────────────────────────────────────────────────────────-
// -------- ACR

resource existingAcr 'Microsoft.ContainerRegistry/registries@2025-05-01-preview' existing = if (!empty(resourceIds.containerRegistryResourceId)) {
  name: _existingAcrName
  scope: resourceGroup(_existingAcrSub, _existingAcrRg)
}

module registry 'br/public:avm/res/container-registry/registry:0.9.3' = if (_deployAcr) {
  name: 'registryDeployment'
  params: {
    name: _acrNameEffective!
    acrSku: _acrEffectiveSku
    location: location
    publicNetworkAccess: 'Disabled'
    managedIdentities: { systemAssigned: true }
    tags: union(tags, containerRegistryDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- Cosmos DB (GenAI)

resource existingCosmos 'Microsoft.DocumentDB/databaseAccounts@2025-04-15' existing = if (!empty(resourceIds.dbAccountResourceId)) {
  name: _existingCosmosName
  scope: resourceGroup(_existingCosmosSub, _existingCosmosRg)
}

module databaseAccount 'br/public:avm/res/document-db/database-account:0.16.0' = if (_deployCosmos) {
  name: 'databaseAccountDeployment'
  params: {
    name: empty(_cosmosDef.name!) ? '${_cos}${baseName}' : _cosmosDef.name!
    zoneRedundant: false
    enableTelemetry: enableTelemetry
  }
}

// -------- Key Vault (GenAI)

resource existingVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' existing = if (!empty(resourceIds.keyVaultResourceId)) {
  name: _existingKvName
  scope: resourceGroup(_existingKvSub, _existingKvRg)
}

module vault 'br/public:avm/res/key-vault/vault:0.13.3' = if (_deployKv) {
  name: 'vaultDeployment'
  params: {
    name: empty(keyVaultDefinition.name!) ? '${_kv}${baseName}' : keyVaultDefinition.name!
    enablePurgeProtection: true
    tags: union(tags, keyVaultDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- Storage Account (GenAI)

resource existingStorage 'Microsoft.Storage/storageAccounts@2025-01-01' existing = if (!empty(resourceIds.storageAccountResourceId)) {
  name: _existingSaName
  scope: resourceGroup(_existingSaSub, _existingSaRg)
}

module storageAccount 'br/public:avm/res/storage/storage-account:0.26.2' = if (_deploySa) {
  name: 'storageAccountDeployment'
  params: {
    name: empty(_storageAccountDef.name!) ? '${_st}${baseName}' : _storageAccountDef.name!
    allowBlobPublicAccess: false
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
    tags: union(tags, _storageAccountDef.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- AI Search (GenAI)
#disable-next-line BCP081
resource existingSearch 'Microsoft.Search/searchServices@2024-03-01' existing = if (!empty(resourceIds.searchServiceResourceId)) {
  name: _existingSearchName
  scope: resourceGroup(_existingSearchSub, _existingSearchRg)
}

module searchService 'br/public:avm/res/search/search-service:0.11.1' = if (_deploySearch) {
  name: 'searchServiceDeployment'
  params: {
    name: empty(_searchDef.name!) ? '${_srch}${baseName}' : _searchDef.name!
    tags: union(tags, _searchDef.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// -------- App Configuration

resource existingAppConfig 'Microsoft.AppConfiguration/configurationStores@2024-06-01' existing = if (!empty(resourceIds.appConfigResourceId)) {
  name: _existingAppcsName
  scope: resourceGroup(_existingAppcsSub, _existingAppcsRg)
}

module configurationStore 'br/public:avm/res/app-configuration/configuration-store:0.9.2' = if (_deployAppConfig) {
  name: 'configurationStoreDeployment'
  params: {
    name: _appConfigName
    enablePurgeProtection: true
    enableTelemetry: enableTelemetry
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.10 AI Foundry (AVM Pattern Module)
// ─────────────────────────────────────────────────────────────────────-

// module aiFoundry 'br/public:avm/ptn/ai-ml/ai-foundry:0.3.0' = {
// Note: temporarily using custom module to avoid deployment scripts creation by AI Foundry AVM Module
module aiFoundry 'modules/ai-foundry/main.bicep' = {
  name: 'aiFoundryDeployment'
  params: {
    baseUniqueName: _afBaseUniqueName
    location: _afLocation
    enableTelemetry: enableTelemetry
    lock: _afParam.lock

    // Disabling wait scripts to avoid access key authoring issues
    waitForConnections: false
    waitForProject: false

    // Deterministic base for AF resource names
    baseName: baseName

    // Core networking (PDNS for AI services domain families)
    // Force createCapabilityHosts=false when Agent Service is disabled
    aiFoundryConfiguration: union(_afConfigObj, _afNetworkingConfig, {
      createCapabilityHosts: _afAgentSvcEnabled
    })

    // Ask AVM to create AF-associated resources (Search/Cosmos/Storage/KV)
    includeAssociatedResources: _afWantsDeps

    // Bind AF-associated resources to your PDNS zones (and optionally reuse app resources)
    aiSearchConfiguration: union(_afSearchCfg, _afAiSearchPdzBinding, {})

    cosmosDbConfiguration: union(_afCosmosCfg, _afCosmosPdzBinding, {})

    keyVaultConfiguration: union(_afKvCfg, _afKvPdzBinding, {})

    storageAccountConfiguration: union(_afStorageCfg, _afBlobPdzBinding, {})

    // Use caller subnet if provided, otherwise our PE subnet
    privateEndpointSubnetResourceId: _afAgentSvcEnabled
      ? (!empty(_afPeSubnetParam) ? _afPeSubnetParam : _peSubnetId)
      : ''

    aiModelDeployments: _afModelDeployments
    tags: tags
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.searchServiceResourceId)) ? searchService : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
    #disable-next-line BCP321
    (_deployPdnsAndPe && !_useExistingPdz.search && _needSearchPdns) ? privateDnsZoneSearch : null
    #disable-next-line BCP321
    (_deployPdnsAndPe && !_useExistingPdz.cognitiveservices) ? privateDnsZoneCogSvcs : null
    #disable-next-line BCP321
    (_deployPdnsAndPe && !_useExistingPdz.openai) ? privateDnsZoneOpenAi : null
    #disable-next-line BCP321
    (_deployPdnsAndPe && !_useExistingPdz.aiServices) ? privateDnsZoneAiService : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.11 Gateways (WAF policy, App Gateway, Azure Firewall, APIM)
// ─────────────────────────────────────────────────────────────────────-

module wafPolicy 'br/public:avm/res/network/application-gateway-web-application-firewall-policy:0.2.0' = if (_deployWafPolicy) {
  name: 'wafPolicyDeployment'
  params: {
    name: _wafName
    location: location
    tags: union(tags, wafPolicyDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
    policySettings: _policySettingsForModule

    managedRules: {
      managedRuleSets: [
        { ruleSetType: 'OWASP', ruleSetVersion: '3.2' }
      ]
      exclusions: []
    }
    customRules: []
  }
}

module applicationGateway 'br/public:avm/res/network/application-gateway:0.7.1' = if (_deployAppGateway) {
  name: 'applicationGatewayDeployment'
  params: {
    name: agwName
    location: location
    sku: 'WAF_v2'
    firewallPolicyResourceId: _wafPolicyResourceId
    enableTelemetry: enableTelemetry
    gatewayIPConfigurations: [
      { name: 'appGatewayIpConfig', properties: { subnet: { id: agwSubnet } } }
    ]

    frontendIPConfigurations: concat(
      _agwCreatePublicFrontend!
        ? [
            {
              name: 'publicFrontend'
              properties: { publicIPAddress: { id: resourceId('Microsoft.Network/publicIPAddresses', _agwPipName) } }
            }
          ]
        : [],
      [
        {
          name: 'privateFrontend'
          properties: {
            privateIPAllocationMethod: 'Static'
            privateIPAddress: '192.168.3.10'
            subnet: { id: agwSubnet }
          }
        }
      ]
    )

    frontendPorts: [
      { name: 'port80', properties: { port: 80 } }
    ]

    backendAddressPools: [
      { name: 'defaultPool' }
    ]

    backendHttpSettingsCollection: [
      {
        name: 'defaultSetting'
        properties: {
          cookieBasedAffinity: 'Disabled'
          port: 80
          protocol: 'Http'
        }
      }
    ]

    // keep listener on the private frontend
    httpListeners: [
      {
        name: 'defaultListener'
        properties: {
          frontendIPConfiguration: { id: '${agwId}/frontendIPConfigurations/privateFrontend' }
          frontendPort: { id: '${agwId}/frontendPorts/port80' }
          protocol: 'Http'
        }
      }
    ]

    requestRoutingRules: [
      {
        name: 'defaultRule'
        properties: {
          ruleType: 'Basic'
          priority: 100
          httpListener: { id: '${agwId}/httpListeners/defaultListener' }
          backendAddressPool: { id: '${agwId}/backendAddressPools/defaultPool' }
          backendHttpSettings: { id: '${agwId}/backendHttpSettingsCollection/defaultSetting' }
        }
      }
    ]
  }
  dependsOn: [
    #disable-next-line BCP321
    (_deployWafPolicy) ? wafPolicy : null
    #disable-next-line BCP321
    (_agwCreatePublicFrontend) ? appGatewayPip : null
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
  ]
}

module appGatewayPip 'br/public:avm/res/network/public-ip-address:0.9.0' = if (_deployAppGateway && _agwCreatePublicFrontend) {
  name: 'appGatewayPipDeployment'
  params: {
    name: _agwPipName
    location: location
    skuName: 'Standard'
    publicIPAllocationMethod: 'Static'
    tags: tags
    enableTelemetry: enableTelemetry
  }
}

module fwPolicy 'br/public:avm/res/network/firewall-policy:0.3.1' = if (_deployAfwPolicy) {
  name: 'firewallPolicyDeployment'
  params: {
    name: _afwPolicyName
    location: location
    tags: tags
    enableTelemetry: enableTelemetry

    // Single Rule Collection Group (configurable name/priority); "Allow" collection using provided networkRules
    ruleCollectionGroups: [
      {
        name: _rcgName
        priority: _rcgPriority
        ruleCollections: [
          {
            name: 'defaultNetworkRules'
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            action: { type: 'Allow' } // change to 'Deny' if you want
            rules: _networkRulesForModule
          }
        ]
      }
    ]
  }
}

module firewallPip 'br/public:avm/res/network/public-ip-address:0.9.0' = if (_deployFirewall) {
  name: 'firewallPipDeployment'
  params: {
    name: '${_pip}${_afw}${baseName}'
    location: location
    skuName: 'Standard'
    publicIPAllocationMethod: 'Static'
    tags: tags
    enableTelemetry: enableTelemetry
  }
}

// 1) Azure Firewall without policy
module azureFirewall_noPolicy 'br/public:avm/res/network/azure-firewall:0.8.0' = if (_deployFirewall && !_deployAfwPolicy) {
  name: 'azureFirewallDeployment'
  params: {
    name: _afwName
    location: location
    tags: union(tags, firewallDefinition.tags! ?? {})
    azureSkuTier: firewallDefinition.tier!
    availabilityZones: firewallDefinition.zones
    virtualNetworkResourceId: _vnetResourceId
    enableTelemetry: enableTelemetry
  }
}

// 2) Azure Firewall with policy
module azureFirewall_withPolicy 'br/public:avm/res/network/azure-firewall:0.8.0' = if (_deployFirewall && _deployAfwPolicy) {
  name: 'azureFirewallDeployment'
  params: {
    name: _afwName
    location: location
    tags: union(tags, firewallDefinition.tags! ?? {})
    azureSkuTier: firewallDefinition.tier!
    availabilityZones: firewallDefinition.zones
    virtualNetworkResourceId: _vnetResourceId
    enableTelemetry: enableTelemetry
    firewallPolicyId: fwPolicy!.outputs.resourceId
  }
  dependsOn: [
    fwPolicy!
  ]
}


#disable-next-line BCP081
module apim 'br/public:avm/res/api-management/service:0.11.0' = if (_deployApim) {
  name: 'apimDeployment'
  params: {
    name: _apimName
    location: location
    tags: union(tags, apimDefinition.tags! ?? {})

    // AVM expects these:
    sku: apimDefinition.skuRoot! // Developer | Basic | Standard | Premium | Consumption
    skuCapacity: apimDefinition.skuCapacity

    publisherEmail: apimDefinition.publisherEmail
    publisherName: apimDefinition.publisherName

    // Enable HTTP/2 via customProperties (string "true"/"false")
    customProperties: apimDefinition.protocols != null && apimDefinition.protocols.enableHttp2
      ? { 'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'true' }
      : {}

    enableTelemetry: enableTelemetry
    // Optional:
    // minApiVersion: apimDefinition.minApiVersion
    // notificationSenderEmail: apimDefinition.notificationSenderEmail
    // hostnameConfigurations: apimDefinition.hostnameConfiguration
    // additionalLocations: apimDefinition.additionalLocations
  }
}

// ─────────────────────────────────────────────────────────────────────-
// 3.12 Hub/Spoke Peering
// ─────────────────────────────────────────────────────────────────────-

// Spoke -> Hub
module existingSpokePeering 'br/public:avm/res/network/virtual-network:0.7.0' = if (!empty(resourceIds.virtualNetworkResourceId) && _hasPeer) {
  name: 'existingSpokePeering'
  scope: resourceGroup(_existingVNetSubscriptionId, _existingVNetResourceGroupName)
  params: {
    // point the module at the existing spoke VNet
    name: _existingVNetName
    location: existingVNet!.location
    // pass through current settings so we don't drift anything
    addressPrefixes: existingVNet!.properties.addressSpace.addressPrefixes
    dnsServers: empty(existingVNet!.properties.dhcpOptions!.dnsServers)
      ? []
      : existingVNet!.properties.dhcpOptions.dnsServers
    tags: existingVNet!.tags
    enableTelemetry: enableTelemetry

    // add only the peering we need
    peerings: [
      {
        name: _peerName
        remoteVirtualNetworkResourceId: _peerCfgVnetId
        allowVirtualNetworkAccess: _peerAllowVna
        allowForwardedTraffic: _peerAllowFwd
        allowGatewayTransit: _peerAllowGw
        useRemoteGateways: _peerUseRgw
      }
    ]
  }
}


resource peerVnet 'Microsoft.Network/virtualNetworks@2024-07-01' existing = if (!empty(_peerVnetId)) {
  name: _peerVnetName
  scope: resourceGroup(_peerSub, _peerRg)
}

// Hub -> Spoke reverse peering
module hubReversePeering 'br/public:avm/res/network/virtual-network:0.7.0' = if (!empty(_peerVnetId) && hubVnetPeeringDefinition.createReversePeering) {
  name: 'hubReversePeering'
  scope: resourceGroup(_peerSub, _peerRg)
  params: {
    // point the module at the existing hub VNet
    name: _peerVnetName
    location: peerVnet!.location
    // preserve existing settings to avoid drift
    addressPrefixes: peerVnet!.properties.addressSpace.addressPrefixes
    dnsServers: empty(peerVnet!.properties.dhcpOptions!.dnsServers) ? [] : peerVnet!.properties.dhcpOptions.dnsServers
    tags: peerVnet!.tags
    enableTelemetry: enableTelemetry

    // add only the reverse peering we need
    peerings: [
      {
        name: empty(hubVnetPeeringDefinition.reverseName) ? 'to-spoke' : hubVnetPeeringDefinition.reverseName
        remoteVirtualNetworkResourceId: _vnetResourceId
        allowVirtualNetworkAccess: hubVnetPeeringDefinition.reverseAllowVirtualNetworkAccess
        allowForwardedTraffic: hubVnetPeeringDefinition.reverseAllowForwardedTraffic
        allowGatewayTransit: hubVnetPeeringDefinition.reverseAllowGatewayTransit
        useRemoteGateways: hubVnetPeeringDefinition.reverseUseRemoteGateways
      }
    ]
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
  ]
}



module bastionVault 'br/public:avm/res/key-vault/vault:0.13.3' = if (_deployJumpVm) {
  name: 'bastionKeyVaultDeployment'
  params: {
    name: _bastionKvName
    // Public by default (no private endpoints or firewall rules passed here)
    enablePurgeProtection: true
    tags: union(tags, bastionKeyVaultDefinition.tags! ?? {})
    enableTelemetry: enableTelemetry
  }
}

// Create/seed the admin password as a secret for operators (optional but handy)
resource bastionVaultSecret 'Microsoft.KeyVault/vaults/secrets@2024-11-01' = if (_deployJumpVm) {
  name: '${_bastionKvName}/${jumpVmDefinition.vmKeyVaultSecName}'
  properties: {
    value: jumpVmAdminPassword
    contentType: 'text/plain'
  }
  dependsOn: [bastionVault]
}


module jumpVm 'br/public:avm/res/compute/virtual-machine:0.20.0' = if (_deployJumpVm) {
  name: 'jumpVmDeployment'
  params: {
    name: empty(jumpVmDefinition.name!) ? '${_vm}${baseName}-jump' : jumpVmDefinition.name!
    location: location
    tags: union(tags, jumpVmDefinition.tags! ?? {})
    enableTelemetry: jumpVmDefinition.enableTelemetry ?? enableTelemetry
    osType: _jumpVmOsType
    availabilityZone: -1
    adminUsername: jumpVmDefinition.adminUsername
    adminPassword: jumpVmAdminPassword
    computerName: _jumpComputerName
    imageReference: _jumpVmImageRef
    vmSize: jumpVmDefinition.sku

    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 127
      managedDisk: { storageAccountType: 'Premium_LRS' }
    }

    nicConfigurations: [
      {
        name: 'nic-jump-1'
        ipConfigurations: [
          {
            name: 'ipconfig1'
            subnetResourceId: _jumpSubnetId
            privateIPAllocationMethod: 'Dynamic'
          }
        ]
      }
    ]
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
  ]
}



// Only deploy Build VM when an SSH key is provided
module buildVm 'br/public:avm/res/compute/virtual-machine:0.20.0' = if (_deployBuildVm && !empty(buildVmDefinition.sshPublicKey)) {
  name: 'buildVmDeployment'
  params: {
    name: empty(buildVmDefinition.name!) ? '${_vm}${baseName}-build' : buildVmDefinition.name!
    location: location
    tags: union(tags, buildVmDefinition.tags! ?? {})
    enableTelemetry: buildVmDefinition.enableTelemetry! ?? enableTelemetry

    osType: _buildVmOsType
    availabilityZone: -1
    adminUsername: buildVmDefinition.adminUsername
    imageReference: _buildVmImageRef
    vmSize: buildVmDefinition.sku

    disablePasswordAuthentication: true
    publicKeys: [
      {
        path: '/home/${buildVmDefinition.adminUsername}/.ssh/authorized_keys'
        keyData: buildVmDefinition.sshPublicKey
      }
    ]

    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 64
      managedDisk: { storageAccountType: 'Premium_LRS' }
    }

    nicConfigurations: [
      {
        name: 'nic-build-1'
        ipConfigurations: [
          {
            name: 'ipconfig1'
            subnetResourceId: _buildSubnetId
            privateIPAllocationMethod: 'Dynamic'
          }
        ]
      }
    ]

    customData: base64(_buildCloudInit)
  }
  dependsOn: [
    #disable-next-line BCP321
    (empty(resourceIds.virtualNetworkResourceId)) ? virtualNetwork : null
  ]
}

// ─────────────────────────────────────────────────────────────────────-
// 3.13 Grounding with Bing Search
// ─────────────────────────────────────────────────────────────────────-

// Run this module when:
//  - creating a new Bing account (toggle true, no existing), OR
//  - reusing an existing account (existing ID provided) but we still need to create the CS connection.
module bingSearch 'modules/bing-search/main.bicep' = if (_invokeBingModule) {
  name: 'bingsearchDeployment'
  params: {
    // AF context from the AVM/Foundry module outputs
    account_name: aiFoundry.outputs.aiServicesName
    project_name: aiFoundry.outputs.aiProjectName

    // Deterministic default for the Bing account (only used on create path)
    bingSearchName: _bingNameEffective

    // Reuse path: when provided, the child module will NOT create the Bing account,
    // it will use this existing one and still create the connection.
    existingResourceId: resourceIds.groundingServiceResourceId
  }
  dependsOn: [
    aiFoundry!
  ]
}

//////////////////////////////////////////////////////////////////////////
// 4. OUTPUTS
//////////////////////////////////////////////////////////////////////////

// General
output tenantId string = tenant().tenantId
output subscriptionId string = subscription().subscriptionId
output resourceGroupName string = resourceGroup().name
output location string = location

// VNet
output virtualNetworkResourceId string = empty(resourceIds.virtualNetworkResourceId)
  #disable-next-line BCP318
  ? virtualNetwork.outputs.resourceId
  : existingVNet.id

// Log Analytics
output logAnalyticsWorkspaceResourceId string = _deployLogAnalytics
  #disable-next-line BCP318
  ? logAnalytics.outputs.resourceId
  : (empty(resourceIds.logAnalyticsWorkspaceResourceId) ? '' : existingLogAnalytics.id)

// App Insights
output applicationInsightsResourceId string = _deployAppInsights
  #disable-next-line BCP318
  ? appInsights.outputs.resourceId
  : (empty(resourceIds.appInsightsResourceId) ? '' : existingAppInsights.id)

// Container Apps Environment
output containerEnvResourceId string = !empty(resourceIds.containerEnvResourceId)
  ? resourceIds.containerEnvResourceId
  : (_deployContainerAppEnv ? resourceId('Microsoft.App/managedEnvironments', _containerEnvName) : '')

// ACR
output containerRegistryResourceId string = !empty(resourceIds.containerRegistryResourceId)
  ? resourceIds.containerRegistryResourceId
  : (_deployAcr ? resourceId('Microsoft.ContainerRegistry/registries', _acrNameEffective) : '')

// Storage
#disable-next-line BCP318
output storageAccountResourceId string = _deploySa ? storageAccount.outputs.resourceId : existingStorage.id

// Key Vault
#disable-next-line BCP318
output keyVaultResourceId string = _deployKv ? vault.outputs.resourceId : existingVault.id

// Cosmos
#disable-next-line BCP318
output dbAccountResourceId string = _deployCosmos ? databaseAccount.outputs.resourceId : existingCosmos.id

// Search
#disable-next-line BCP318
output searchServiceResourceId string = _deploySearch ? searchService.outputs.resourceId : existingSearch.id

// App Configuration
output appConfigResourceId string = !empty(resourceIds.appConfigResourceId)
  ? resourceIds.appConfigResourceId
  : (_deployAppConfig ? resourceId('Microsoft.AppConfiguration/configurationStores', _appConfigName) : '')

// APIM
output apimServiceResourceId string = _deployApim
  ? resourceId('Microsoft.ApiManagement/service', _apimName)
  : existingApim.id

// Application Gateway
output applicationGatewayResourceId string = _deployAppGateway
  ? resourceId('Microsoft.Network/applicationGateways', _agwName)
  : existingAppGateway.id

// Azure Firewall
output firewallResourceId string = _deployFirewall
  ? resourceId('Microsoft.Network/azureFirewalls', _afwName)
  : existingFirewall.id

// Grounding with Bing
output groundingServiceResourceId string = _invokeBingModule
  ? bingSearch!.outputs.resourceId
  : ''


// WAF Policy
output wafPolicyResourceId string = _deployAppGateway ? _wafPolicyResourceId : ''
