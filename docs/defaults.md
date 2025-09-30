# AI/ML Landing Zone — Parameter Defaults  

---

## Table of Contents

- [Global & Shared](#global--shared)
- [Network Security Groups](#network-security-groups)
- [Virtual Network](#virtual-network)
- [Private DNS Zones](#private-dns-zones)
- [Public IPs](#public-ips)
- [Private Endpoints](#private-endpoints)
- [Observability](#observability)
- [Container Platform](#container-platform)
- [Storage](#storage)
- [Databases & Config](#databases--config)
- [API Management](#api-management)
- [AI Foundry](#ai-foundry)
- [Gateways & Firewall](#gateways--firewall)
- [Virtual Machines](#virtual-machines)

---

## Global & Shared

| parameter | default |
|-----------|---------|
| flagPlatformLandingZone | false |
| resourceIds | {} |
| enableTelemetry | true |
| tags | {} |
| privateDnsZonesDefinition.allowInternetResolutionFallback | false |
| privateDnsZonesDefinition.createNetworkLinks | true |

---

## Network Security Groups

### Default NSG Names

| parameter | default |
|-----------|---------|
| agentNsg.name | nsg-agent-${baseName} |
| privateEndpointsNsg.name | nsg-pe-${baseName} |
| appGatewayNsg.name | nsg-appgw-${baseName} |
| apimNsg.name | nsg-apim-${baseName} |
| acaEnvNsg.name | nsg-aca-env-${baseName} |
| jumpboxNsg.name | nsg-jumpbox-${baseName} |
| devopsAgentsNsg.name | nsg-devops-agents-${baseName} |

### App Gateway NSG Default Rules

| parameter | default |
|-----------|---------|
| securityRules[0].name | Allow-GatewayManager-Inbound |
| securityRules[0].properties.protocol | Tcp |
| securityRules[0].properties.sourceAddressPrefix | GatewayManager |
| securityRules[0].properties.destinationPortRange | 65200-65535 |
| securityRules[0].properties.access | Allow |
| securityRules[1].name | Allow-Internet-HTTP-Inbound |
| securityRules[1].properties.protocol | Tcp |
| securityRules[1].properties.sourceAddressPrefix | Internet |
| securityRules[1].properties.destinationPortRange | 80 |
| securityRules[1].properties.access | Allow |
| securityRules[2].name | Allow-Internet-HTTPS-Inbound |
| securityRules[2].properties.protocol | Tcp |
| securityRules[2].properties.sourceAddressPrefix | Internet |
| securityRules[2].properties.destinationPortRange | 443 |
| securityRules[2].properties.access | Allow |

---

## Virtual Network

| parameter | default |
|-----------|---------|
| vNetDefinition.name | vnet-${baseName} |
| vNetDefinition.addressPrefixes | ['192.168.0.0/22'] |
| vNetDefinition.subnets[0].name | agent-subnet |
| vNetDefinition.subnets[0].properties.addressPrefix | 192.168.0.0/27 |
| vNetDefinition.subnets[0].properties.delegations[0].serviceName | Microsoft.App/environments |
| vNetDefinition.subnets[0].properties.serviceEndpoints | ['Microsoft.CognitiveServices'] |
| vNetDefinition.subnets[1].name | pe-subnet |
| vNetDefinition.subnets[1].properties.addressPrefix | 192.168.0.32/27 |
| vNetDefinition.subnets[1].properties.serviceEndpoints | ['Microsoft.AzureCosmosDB'] |
| vNetDefinition.subnets[1].properties.privateEndpointNetworkPolicies | Disabled |
| vNetDefinition.subnets[2].name | AzureBastionSubnet |
| vNetDefinition.subnets[2].properties.addressPrefix | 192.168.0.64/26 |
| vNetDefinition.subnets[3].name | AzureFirewallSubnet |
| vNetDefinition.subnets[3].properties.addressPrefix | 192.168.0.128/26 |
| vNetDefinition.subnets[4].name | appgw-subnet |
| vNetDefinition.subnets[4].properties.addressPrefix | 192.168.0.192/27 |
| vNetDefinition.subnets[5].name | apim-subnet |
| vNetDefinition.subnets[5].properties.addressPrefix | 192.168.0.224/27 |
| vNetDefinition.subnets[6].name | jumpbox-subnet |
| vNetDefinition.subnets[6].properties.addressPrefix | 192.168.1.0/28 |
| vNetDefinition.subnets[7].name | aca-env-subnet |
| vNetDefinition.subnets[7].properties.addressPrefix | 192.168.2.0/23 |
| vNetDefinition.subnets[7].properties.delegations[0].serviceName | Microsoft.App/environments |
| vNetDefinition.subnets[7].properties.serviceEndpoints | ['Microsoft.AzureCosmosDB'] |
| vNetDefinition.subnets[8].name | devops-agents-subnet |
| vNetDefinition.subnets[8].properties.addressPrefix | 192.168.1.32/27 |

---

## Private DNS Zones

| parameter | default |
|-----------|---------|
| apimPrivateDnsZoneDefinition.name | privatelink.azure-api.net |
| apimPrivateDnsZoneDefinition.location | global |
| cognitiveServicesPrivateDnsZoneDefinition.name | privatelink.cognitiveservices.azure.com |
| cognitiveServicesPrivateDnsZoneDefinition.location | global |
| openAiPrivateDnsZoneDefinition.name | privatelink.openai.azure.com |
| openAiPrivateDnsZoneDefinition.location | global |
| aiServicesPrivateDnsZoneDefinition.name | privatelink.services.ai.azure.com |
| aiServicesPrivateDnsZoneDefinition.location | global |
| searchPrivateDnsZoneDefinition.name | privatelink.search.windows.net |
| searchPrivateDnsZoneDefinition.location | global |
| cosmosPrivateDnsZoneDefinition.name | privatelink.documents.azure.com |
| cosmosPrivateDnsZoneDefinition.location | global |
| blobPrivateDnsZoneDefinition.name | privatelink.blob.${environment().suffixes.storage} |
| blobPrivateDnsZoneDefinition.location | global |
| keyVaultPrivateDnsZoneDefinition.name | privatelink.vaultcore.azure.net |
| keyVaultPrivateDnsZoneDefinition.location | global |
| appConfigPrivateDnsZoneDefinition.name | privatelink.azconfig.io |
| appConfigPrivateDnsZoneDefinition.location | global |
| containerAppsPrivateDnsZoneDefinition.name | privatelink.${location}.azurecontainerapps.io |
| containerAppsPrivateDnsZoneDefinition.location | global |
| acrPrivateDnsZoneDefinition.name | privatelink.azurecr.io |
| acrPrivateDnsZoneDefinition.location | global |
| appInsightsPrivateDnsZoneDefinition.name | privatelink.applicationinsights.azure.com |
| appInsightsPrivateDnsZoneDefinition.location | global |

---

## Public IPs

| parameter | default |
|-----------|---------|
| appGatewayPublicIp.name | pip-agw-${baseName} |
| appGatewayPublicIp.skuName | Standard |
| appGatewayPublicIp.skuTier | Regional |
| appGatewayPublicIp.publicIPAllocationMethod | Static |
| appGatewayPublicIp.publicIPAddressVersion | IPv4 |
| appGatewayPublicIp.zones | [1,2,3] |
| firewallPublicIp.name | pip-fw-${baseName} |
| firewallPublicIp.skuName | Standard |
| firewallPublicIp.skuTier | Regional |
| firewallPublicIp.publicIPAllocationMethod | Static |
| firewallPublicIp.publicIPAddressVersion | IPv4 |
| firewallPublicIp.zones | [1,2,3] |

---

## Private Endpoints

*(… same structure as before, listing each block with its parameters and defaults …)*

---

## Observability

| parameter | default |
|-----------|---------|
| logAnalyticsDefinition.name | log-${baseName} |
| logAnalyticsDefinition.dataRetention | 30 |
| appInsightsDefinition.name | appi-${baseName} |
| appInsightsDefinition.disableIpMasking | true |

---

## Container Platform

| parameter | default |
|-----------|---------|
| containerAppEnvDefinition.name | cae-${baseName} |
| containerAppEnvDefinition.workloadProfiles[0].workloadProfileType | D4 |
| containerAppEnvDefinition.workloadProfiles[0].name | default |
| containerAppEnvDefinition.workloadProfiles[0].minimumCount | 1 |
| containerAppEnvDefinition.workloadProfiles[0].maximumCount | 3 |
| containerAppEnvDefinition.internal | false |
| containerAppEnvDefinition.publicNetworkAccess | Disabled |
| containerAppEnvDefinition.zoneRedundant | true |
| containerRegistryDefinition.name | cr${baseName} |
| containerRegistryDefinition.publicNetworkAccess | Disabled |
| containerRegistryDefinition.acrSku | Premium |
| containerAppsList | [] |

---

## Storage

| parameter | default |
|-----------|---------|
| storageAccountDefinition.name | st${baseName} |
| storageAccountDefinition.kind | StorageV2 |
| storageAccountDefinition.skuName | Standard_LRS |
| storageAccountDefinition.publicNetworkAccess | Disabled |

---

## Databases & Config

| parameter | default |
|-----------|---------|
| appConfigurationDefinition.name | appcs-${baseName} |
| cosmosDbDefinition.name | cosmos-${baseName} |
| keyVaultDefinition.name | kv-${baseName} |
| aiSearchDefinition.name | search-${baseName} |

---

## API Management

| parameter | default |
|-----------|---------|
| apimDefinition.name | apim-${baseName} |
| apimDefinition.publisherEmail | admin@contoso.com |
| apimDefinition.publisherName | Contoso |
| apimDefinition.sku | StandardV2 |
| apimDefinition.skuCapacity | 1 |
| apimDefinition.virtualNetworkType | None |
| apimDefinition.minApiVersion | 2022-08-01 |

---

## AI Foundry

| parameter | default |
|-----------|---------|
| aiFoundryDefinition.aiFoundryConfiguration.accountName | ai${baseName} |
| aiFoundryDefinition.aiFoundryConfiguration.disableLocalAuth | false |
| aiFoundryDefinition.aiFoundryConfiguration.project.name | aifoundry-default-project |
| aiFoundryDefinition.aiFoundryConfiguration.project.displayName | Default AI Foundry Project. |
| aiFoundryDefinition.aiFoundryConfiguration.project.description | This is the default project for AI Foundry. |

### Default Model Deployments

| parameter | default |
|-----------|---------|
| aiFoundryDefinition.aiModelDeployments[0].model.format | OpenAI |
| aiFoundryDefinition.aiModelDeployments[0].model.name | gpt-4o |
| aiFoundryDefinition.aiModelDeployments[0].model.version | 2024-11-20 |
| aiFoundryDefinition.aiModelDeployments[0].name | gpt-4o |
| aiFoundryDefinition.aiModelDeployments[0].sku.name | GlobalStandard |
| aiFoundryDefinition.aiModelDeployments[0].sku.capacity | 10 |
| aiFoundryDefinition.aiModelDeployments[1].model.format | OpenAI |
| aiFoundryDefinition.aiModelDeployments[1].model.name | text-embedding-3-large |
| aiFoundryDefinition.aiModelDeployments[1].model.version | 1 |
| aiFoundryDefinition.aiModelDeployments[1].name | text-embedding-3-large |
| aiFoundryDefinition.aiModelDeployments[1].sku.name | Standard |
| aiFoundryDefinition.aiModelDeployments[1].sku.capacity | 1 |

---

## Gateways & Firewall

### WAF Policy Defaults

| parameter | default |
|-----------|---------|
| wafPolicyDefinition.name | afwp-${baseName} |
| wafPolicyDefinition.managedRules.managedRuleSets[0].ruleSetType | OWASP |
| wafPolicyDefinition.managedRules.managedRuleSets[0].ruleSetVersion | 3.2 |
| wafPolicyDefinition.managedRules.managedRuleSets[0].ruleGroupOverrides | [] |
| wafPolicyDefinition.managedRules.exclusions | [] |

### App Gateway Defaults

| parameter | default |
|-----------|---------|
| appGatewayDefinition.name | agw-${baseName} |
| appGatewayDefinition.sku | WAF_v2 |
| appGatewayDefinition.frontendIPConfigurations[0].properties.privateIPAllocationMethod | Static |
| appGatewayDefinition.frontendIPConfigurations[0].properties.privateIPAddress | 192.168.0.200 |
| appGatewayDefinition.frontendPorts[0].properties.port | 80 |
| appGatewayDefinition.backendAddressPools[0].name | defaultBackendPool |
| appGatewayDefinition.backendHttpSettingsCollection[0].properties.cookieBasedAffinity | Disabled |
| appGatewayDefinition.backendHttpSettingsCollection[0].properties.port | 80 |
| appGatewayDefinition.backendHttpSettingsCollection[0].properties.protocol | Http |
| appGatewayDefinition.backendHttpSettingsCollection[0].properties.requestTimeout | 20 |
| appGatewayDefinition.httpListeners[0].name | httpListener |
| appGatewayDefinition.requestRoutingRules[0].name | httpRoutingRule |
| appGatewayDefinition.requestRoutingRules[0].properties.priority | 100 |
| appGatewayDefinition.requestRoutingRules[0].properties.ruleType | Basic |

### Firewall Defaults

| parameter | default |
|-----------|---------|
| firewallPolicyDefinition.name | afwp-${baseName} |
| firewallDefinition.name | afw-${baseName} |
| firewallDefinition.availabilityZones | [1,2,3] |
| firewallDefinition.azureSkuTier | Standard |

---

## Virtual Machines

### Build VM Defaults

| parameter | default |
|-----------|---------|
| buildVmDefinition.name | vm-${substring(baseName,0,6)}-bld |
| buildVmDefinition.sku | Standard_F4s_v2 |
| buildVmDefinition.adminUsername | builduser |
| buildVmDefinition.osType | Linux |
| buildVmDefinition.imageReference.publisher | Canonical |
| buildVmDefinition.imageReference.offer | 0001-com-ubuntu-server-jammy |
| buildVmDefinition.imageReference.sku | 22_04-lts |
| buildVmDefinition.imageReference.version | latest |
| buildVmDefinition.runner | github |
| buildVmDefinition.github.owner | your-org |
| buildVmDefinition.github.repo | your-repo |
| buildVmDefinition.nicConfigurations[0].nicSuffix | -nic |
| buildVmDefinition.nicConfigurations[0].ipConfigurations[0].name | ipconfig01 |
| buildVmDefinition.osDisk.caching | ReadWrite |
| buildVmDefinition.osDisk.createOption | FromImage |
| buildVmDefinition.osDisk.deleteOption | Delete |
| buildVmDefinition.osDisk.managedDisk.storageAccountType | Standard_LRS |
| buildVmDefinition.disablePasswordAuthentication | false |
| buildVmDefinition.adminPassword | P@ssw0rd123! |
| buildVmDefinition.availabilityZone | 1 |
| buildVmMaintenanceDefinition.name | mc-${baseName}-build |

### Jump VM Defaults

| parameter | default |
|-----------|---------|
| jumpVmDefinition.name | vm-${substring(baseName,0,6)}-jmp |
| jumpVmDefinition.sku | Standard_D4as_v5 |
| jumpVmDefinition.adminUsername | azureuser |
| jumpVmDefinition.osType | Windows |
| jumpVmDefinition.imageReference.publisher | MicrosoftWindowsServer |
| jumpVmDefinition.imageReference.offer | WindowsServer |
| jumpVmDefinition.imageReference.sku | 2022-datacenter-azure-edition |
| jumpVmDefinition.imageReference.version | latest |
| jumpVmDefinition.adminPassword | P@ssw0rd123! |
| jumpVmDefinition.nicConfigurations[0].nicSuffix | -nic |
| jumpVmDefinition.nicConfigurations[0].ipConfigurations[0].name | ipconfig01 |
| jumpVmDefinition.osDisk.caching | ReadWrite |
| jumpVmDefinition.osDisk.createOption | FromImage |
| jumpVmDefinition.osDisk.deleteOption | Delete |
| jumpVmDefinition.osDisk.managedDisk.storageAccountType | Standard_LRS |
| jumpVmDefinition.availabilityZone | 1 |
| jumpVmMaintenanceDefinition.name | mc-${baseName}-jump |
