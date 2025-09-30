

# AI/ML Landing Zone — Bicep parameter examples

This page provides three complete examples of parameter files for deploying the AI/ML Landing Zone (Bicep AVM).

- [1. Greenfield — full new and isolated deployment](#1-greenfield--full-new-and-isolated-deployment)
- [2. Existing VNet — reuse an existing virtual network](#2-existing-vnet--reuse-an-existing-virtual-network)
- [3. Platform Landing Zone — PDNS/PE managed by the platform](#3-platform-landing-zone--pdnspe-managed-by-the-platform)

---

## 1. Greenfield — full new and isolated deployment

Use this scenario for a **new environment from scratch**.
It creates all required resources — Virtual Network with the standard subnets (address space `192.168.0.0/22`), Network Security Groups, Private Endpoints, Private DNS Zones, and the entire AI/ML stack (App Gateway, APIM, Firewall, AI services, etc.).
This is the default “everything on” template.

```
using './main.bicep'

@description('Per-service deployment toggles.')
param deployToggles = {
  acaEnvironmentNsg: true
  agentNsg: true
  apiManagement: true
  apiManagementNsg: true
  appConfig: true
  appInsights: true
  applicationGateway: true
  applicationGatewayNsg: true
  applicationGatewayPublicIp: true
  bastionHost: true
  buildVm: true
  containerApps: true
  containerEnv: true
  containerRegistry: true
  cosmosDb: true
  devopsBuildAgentsNsg: true
  firewall: true
  groundingWithBingSearch: true
  jumpVm: true
  jumpboxNsg: true
  keyVault: true
  logAnalytics: true
  peNsg: true
  searchService: true
  storageAccount: true
  virtualNetwork: true
  wafPolicy: true
}

@description('Existing resource IDs (empty means create new).')
param resourceIds = {}

@description('Enable platform landing zone integration. When true, private DNS zones and private endpoints are managed by the platform landing zone.')
param flagPlatformLandingZone = false

@description('Deployment location.')
param location = 'eastus2'
```

This configuration automatically provisions the **entire network topology** defined in `main.bicep`, including
the delegated `/23` subnet for Azure Container Apps and all other subnets with the recommended prefix sizes.

---

## 2. Existing VNet — reuse an existing virtual network

Use this when you already have a **pre-existing VNet** and only need to add the AI/ML Landing Zone subnets and resources.
The deployment **does not create a new VNet**; instead, it creates all required subnets, with the same names and address prefixes as in the greenfield setup (`192.168.0.0/22`), inside the specified VNet.
All NSGs are created and automatically associated.

```
using './main.bicep'

@description('Deploy only subnets and NSGs inside an existing VNet.')
param deployToggles = {
  logAnalytics: false
  appInsights: false
  containerEnv: false
  containerRegistry: false
  cosmosDb: false
  keyVault: false
  storageAccount: false
  groundingWithBingSearch: false
  appConfig: false
  apiManagement: false
  applicationGateway: false
  applicationGatewayPublicIp: false
  firewall: false
  wafPolicy: false
  buildVm: false
  bastionHost: false
  jumpVm: false

  agentNsg: true
  peNsg: true
  applicationGatewayNsg: true
  apiManagementNsg: true
  acaEnvironmentNsg: true
  jumpboxNsg: true
  devopsBuildAgentsNsg: true

  virtualNetwork: false
}

@description('Reference to the existing VNet and subnets to create.')
param existingVNetSubnetsDefinition = {
  existingVNetName: 'your-existing-vnet-name'
  useDefaultSubnets: false
  subnets: [
    {
      name: 'agent-subnet'
      addressPrefix: '192.168.0.0/27'
      delegation: 'Microsoft.App/environments'
      serviceEndpoints: ['Microsoft.CognitiveServices']
    }
    {
      name: 'pe-subnet'
      addressPrefix: '192.168.0.32/27'
      serviceEndpoints: ['Microsoft.AzureCosmosDB']
      privateEndpointNetworkPolicies: 'Disabled'
    }
    {
      name: 'AzureBastionSubnet'
      addressPrefix: '192.168.0.64/26'
    }
    {
      name: 'AzureFirewallSubnet'
      addressPrefix: '192.168.0.128/26'
    }
    {
      name: 'appgw-subnet'
      addressPrefix: '192.168.0.192/27'
    }
    {
      name: 'apim-subnet'
      addressPrefix: '192.168.0.224/27'
    }
    {
      name: 'jumpbox-subnet'
      addressPrefix: '192.168.1.0/28'
    }
    {
      name: 'aca-env-subnet'
      addressPrefix: '192.168.2.0/23'
      delegation: 'Microsoft.App/environments'
      serviceEndpoints: ['Microsoft.AzureCosmosDB']
    }
    {
      name: 'devops-agents-subnet'
      addressPrefix: '192.168.1.32/27'
    }
  ]
}

@description('Deployment location.')
param location = 'eastus2'
```

Make sure your existing VNet has the **`192.168.0.0/22` address space** available or adjust prefixes while keeping the same structure (especially the required `/23` for `aca-env-subnet`).

---

## 3. Platform Landing Zone — PDNS/PE managed by the platform

Choose this scenario when your **platform landing zone already manages Private DNS Zones and Private Endpoints**.
The AI/ML Landing Zone will consume the existing DNS zones you provide and will not create new ones.

```
using './main.bicep'

@description('Deploy core network while reusing platform-managed PDNS/PE.')
param deployToggles = {
  logAnalytics: false
  appInsights: false
  containerEnv: false
  containerRegistry: false
  cosmosDb: false
  keyVault: false
  storageAccount: false
  groundingWithBingSearch: false
  appConfig: false
  apiManagement: false
  applicationGateway: false
  applicationGatewayPublicIp: false
  firewall: false
  wafPolicy: false
  buildVm: false
  bastionHost: false
  jumpVm: false

  agentNsg: true
  peNsg: true
  applicationGatewayNsg: true
  apiManagementNsg: true
  acaEnvironmentNsg: true
  jumpboxNsg: true
  devopsBuildAgentsNsg: true

  virtualNetwork: true
}

@description('Enable platform landing zone integration.')
param flagPlatformLandingZone = true

@description('Provide IDs of existing Private DNS Zones managed by the platform.')
param privateDnsZonesDefinition = {
  allowInternetResolutionFallback: false
  createNetworkLinks: false
  cognitiveservicesZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.cognitiveservices.azure.com'
  openaiZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.openai.azure.com'
  aiServicesZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.services.ai.azure.com'
  searchZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.search.windows.net'
  cosmosSqlZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.documents.azure.com'
  blobZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
  keyVaultZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net'
  appConfigZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azconfig.io'
  containerAppsZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.eastus2.azurecontainerapps.io'
  acrZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io'
  appInsightsZoneId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.applicationinsights.azure.com'
  tags: { ManagedBy: 'PlatformLZ' }
}

@description('Deployment location.')
param location = 'eastus2'
```

This configuration **keeps all VNet subnets and address prefixes identical to the greenfield setup** (`192.168.0.0/22`) but delegates DNS and Private Endpoints to the existing platform landing zone.
