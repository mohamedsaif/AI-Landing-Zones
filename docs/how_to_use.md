# How to Use — AI Landing Zone (Bicep AVM Pattern)

This guide explains how to deploy and operate the **AI Landing Zone** implemented in this repository using **Bicep** (and optionally **`azd`**). It covers deployment flows, parameterization patterns (create vs. reuse), network isolation choices, and what each resource does when enabled.

> The template is designed for **GenAI application workloads** and **Azure AI Foundry** projects. By default it deploys a **network‑isolated** environment using **Private Endpoints (PE)** and **Private DNS (PDNS)**.

---

## Table of Contents

* [1) What you decide before provisioning](#1-what-you-decide-before-provisioning)
* [2) Quick start with `azd`](#2-quick-start-with-azd)
* [3) Key parameters you will set frequently](#3-key-parameters-you-will-set-frequently)
* [4) Resource‑by‑resource behavior and parameters](#4-resource-by-resource-behavior-and-parameters)
* [5) Minimal examples](#5-minimal-examples)
* [6) Gotchas & Pro Tips](#6-gotchas--pro-tips)
* [7) Naming & resource groups](#7-naming--resource-groups)
* [8) Using the AVM module in your repo](#8-using-the-avm-module-in-your-repo)
* [9) What gets deployed (at a glance)](#9-what-gets-deployed-at-a-glance)

---

## 1) What you decide before provisioning

**A. Create vs. reuse existing services**
For any shared service you already own (e.g., VNet, Log Analytics, ACR), provide its **Resource ID** under the `resourceIds` object. When you supply an ID, the template **uses** that resource; when blank, the template **creates** a new one.

**B. Which modules to deploy**
The `deployToggles` object controls which modules are created: VNet, Observability, Container Apps Environment, Container Apps, ACR, Key Vault, Storage, Cosmos DB, Azure AI Search, App Configuration, perimeter components (WAF Policy, Application Gateway, API Management, Firewall), and optional VMs (Build/Jump), plus **AI Foundry**. Turn each on/off according to your environment.

**C. Isolation posture**
Keep `networkIsolation = true` to get PE/PDNS for data planes. If your platform landing zone already provides shared PDNS/PE and connectivity, set the appropriate flag (for example, `flagPlatformLandingZone = true` if present in your version) and supply existing **PDNS** zone IDs via parameters.

---

## 2) Quick start with `azd`

### Prereqs

* Azure CLI and `azd` installed and signed in (`azd auth login`).
* A resource group in your target subscription.
* Optional: a `.bicepparam` per environment (e.g., `infra/dev.bicepparam`).

### Initialize and provision

```bash
# 1) Sign in
azd auth login

# 2) Initialize an environment (e.g., dev)
azd init -t Azure/bicep-avm-ptn-aiml-landing-zone -e dev

# 3) Provision using your param file (recommended)
azd provision --parameters @infra/dev.bicepparam
# or if mapped in azure.yaml
azd provision
```

**Supplying parameters**

* **Option A:** `azd provision --parameters @infra/dev.bicepparam`
* **Option B:** Reference the file in `azure.yaml` → `infra.parameters.file`
* **Option C:** Use `azd env set <name> <value>` for a small set of values

> Keep secrets (PATs, admin passwords) **out** of `.bicepparam`. Inject them from your secure store or pipeline variables.

---

## 3) Key parameters you will set frequently

* **Location, tags, names** — `location`, `tags`, `baseName` (a short unique prefix). The template derives resource names and uses a deterministic token when a global name is required.
* **Create vs. reuse** — `resourceIds` block. Leave blank to **create**, or set a full **resource ID** to **reuse**.
* **Deployment switches** — `deployToggles` block for each module.
* **Network isolation** — `networkIsolation` and either `privateDnsZoneIds` (reuse) or `privateDnsZones` (create) for PDNS.
* **AI Foundry** — `aiFoundryDefinition` controls account/project, optional model deployments, and dependencies (create vs. reuse) for Search, Cosmos DB, Storage, and Key Vault.

---

## 4) Resource‑by‑resource behavior and parameters

### Virtual Network (spoke)

Creates (or reuses) a dedicated VNet with subnets for **Private Endpoints**, **Container Apps Environment**, optional **Application Gateway**, **Firewall**, **Bastion**, and **VMs**. Optional peering to a hub VNet.
**Parameters:** `vnetDefinition` for address space and subnets; `resourceIds.virtualNetworkResourceId` to reuse; optional peering objects if your version includes them.

### Private DNS & Private Endpoints

With `networkIsolation = true`, the template adds PEs and wires **PDNS** for services that are present (created or reused). You can point to existing PDNS zones via `privateDnsZoneIds` (per‑service keys like `search`, `cosmosSql`, `blob`, `keyVault`, `containerApps`, `appConfig`, `acr`, `appInsights`, and for AI endpoints: `cognitiveservices`, `openai`, `aiServices`) or ask the template to create them via `privateDnsZones`.

### Observability (Log Analytics + Application Insights)

Deploys a **Log Analytics Workspace** (LAW) and an **Application Insights** instance. Insights can bind to a reused LAW.
**Parameters:** `logAnalyticsDefinition`, `appInsightsDefinition`; reuse with `resourceIds.logAnalyticsWorkspaceResourceId` / `resourceIds.appInsightsResourceId`.

### Container Apps Environment (CAE)

Creates (or reuses) an **internal** CAE (ILB) with optional **workload profiles**; apps can be external or internal to the environment.
**Parameters:** `containerAppEnvDefinition` (subnet, internal load balancer, zone redundancy, workload profiles, user‑assigned identities).

### Container Apps (microservices)

Deploys defined apps with images, scaling, and (optionally) Dapr sidecars.
**Parameters:** `containerAppsList` entries (`app_id`, `profile_name`, `min_replicas`, `max_replicas`, `external`, image refs). Toggle with `deployToggles.containerApps`.

### Azure Container Registry (ACR)

Creates (or reuses) a private registry. With isolation, adds a PE and PDNS `privatelink.azurecr.io`.
**Parameters:** `containerRegistryDefinition` (`name`, `sku`, tags) or reuse with `resourceIds.containerRegistryResourceId`.

### Key Vault (app scope)

Central secret store for the app and CI/CD. With isolation, adds a PE and PDNS `privatelink.vaultcore.azure.net`.
**Parameters:** `keyVaultDefinition` (+ optional role assignments) or reuse with `resourceIds.keyVaultResourceId`.

### Storage Account (app scope)

Blob/file queues for app data. With isolation, PE for **blob** and PDNS `privatelink.blob.core.windows.net` (cloud suffix varies by cloud).
**Parameters:** `storageAccountDefinition` or reuse with `resourceIds.storageAccountResourceId`.

### Cosmos DB (app scope)

Global database for chat state, metadata, or app data. With isolation, PE for **SQL** endpoint and PDNS `privatelink.documents.azure.com`.
**Parameters:** `cosmosDbDefinition` or reuse with `resourceIds.dbAccountResourceId`.

### Azure AI Search (app scope)

Search/vector index for RAG. With isolation, PE and PDNS `privatelink.search.windows.net`.
**Parameters:** `searchDefinition` (SKU, partitions/replicas, semantic search) or reuse with `resourceIds.searchServiceResourceId`.

### App Configuration

Centralized app settings. With isolation, PE and PDNS `privatelink.azconfig.io`.
**Parameters:** `appConfigurationDefinition` or reuse with `resourceIds.appConfigResourceId`.

### Azure AI Foundry — account, project, models

**What it is:** Creates an **AI Foundry account** and a **project**. Optionally deploys **model deployments** and wires connections to **Storage**, **Key Vault**, **Cosmos DB**, and **AI Search**.

**Choose one of these simple paths:**

* **Project only (no Agent Service, no auto-deps):**

  * Set `deployToggles.aiFoundry = true`.
  * Set `aiFoundryDefinition.includeAssociatedResources = false`.
  * Leave `aiFoundryDefinition.aiModelDeployments = []`.
  * Do **not** set any agent/capability-host parameters.
  * (Optional) Point to existing services with `existingResourceId` under each `*Configuration`.
* **Full Foundry (project + models + deps):**

  * `deployToggles.aiFoundry = true`.
  * `aiFoundryDefinition.includeAssociatedResources = true` (auto-create Search/KV/Cosmos/Storage unless you provide `existingResourceId`).
  * Fill `aiFoundryDefinition.aiModelDeployments` with entries: `name`, `model { format, name, version }`, and `scale { type, capacity }`.

**Networking tips (when isolated):** Provide the project’s PE subnet resource ID and, if you are not using platform PDNS, the zone IDs for `cognitiveservices`, `openai`, and `services.ai` so endpoints resolve privately.

**Example — Project only (no Agent Service / no auto-deps)**

```bicepparam
using './main.bicep'

param deployToggles = {
  aiFoundry: true
}

param aiFoundryDefinition = {
  includeAssociatedResources: false
  aiModelDeployments: []
  // No agent/capability-host settings
  storageAccountConfiguration: {
    existingResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Storage/storageAccounts/<name>'
  }
  keyVaultConfiguration: {
    existingResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.KeyVault/vaults/<name>'
  }
  cosmosDbConfiguration: {
    existingResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.DocumentDB/databaseAccounts/<name>'
  }
  aiSearchConfiguration: {
    existingResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Search/searchServices/<name>'
  }
}
```

### Perimeter options (WAF Policy, Application Gateway, API Management, Firewall)

* **WAF Policy** — independent policy resource that can be attached to App Gateway when both are enabled.
* **Application Gateway** — L7 entry point; can be public or internal. Bind to Container Apps or APIM backends.
* **API Management** — API governance surface; typically starts in non‑VNet mode unless you attach a subnet later.
* **Azure Firewall** — optional network egress control; can be deployed with or without a Firewall Policy.
  **Parameters:** `wafPolicyDefinition`, `appGatewayDefinition`, `apimDefinition`, `firewallDefinition` (+ optional `firewallPolicyDefinition`).

### Optional VMs

* **Build VM (Linux)** — can auto‑install an Azure DevOps agent or GitHub runner via cloud‑init.
* **Jump VM (Windows)** — for Bastion‑based ops; admin password stored in a dedicated (bastion) Key Vault.
  **Parameters:** `buildVmDefinition` (size, SSH key, runner details + PATs via secure params), `jumpVmDefinition` (size, admin username, secret name) and secure parameter `jumpVmAdminPassword`.

---

## 5) Minimal examples

### Everything created & isolated (excerpt)

````bicepparam
using './main.bicep'

param networkIsolation = true

param resourceIds = {
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
  firewallResourceId: ''
  bastionHostResourceId: ''
  groundingServiceResourceId: ''
}

param deployToggles = {
  virtualNetwork: true
  logAnalytics: true
  appInsights: true
  containerEnv: true
  containerApps: true
  containerRegistry: true
  cosmosDb: true
  keyVault: true
  storageAccount: true
  searchService: true
  appConfig: true
  apiManagement: true
  applicationGateway: true
  wafPolicy: true
  firewall: true
  buildVm: true
  jumpVm: true
  aiFoundry: true
}
```bicepparam
using './main.bicep'

param networkIsolation = true

param resourceIds = {
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
  firewallResourceId: ''
  bastionHostResourceId: ''
  groundingServiceResourceId: ''
}

param deployToggles = {
  virtualNetwork: true
  logAnalytics: true
  appInsights: true
  containerEnv: true
  containerApps: true
  containerRegistry: true
  cosmosDb: true
  keyVault: true
  storageAccount: true
  searchService: true
  appConfig: true
  apiManagement: false
  applicationGateway: false
  wafPolicy: false
  firewall: false
  buildVm: false
  jumpVm: false
  aiFoundry: true
}
````

### Reuse a VNet, LAW/Insights, and ACR (excerpt)

```bicepparam
param resourceIds = {
  virtualNetworkResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>'
  logAnalyticsWorkspaceResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<law>'
  appInsightsResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Insights/components/<appi>'
  containerRegistryResourceId: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.ContainerRegistry/registries/<acr>'
}

param deployToggles = {
  virtualNetwork: false   // reusing VNet
  logAnalytics: false     // reusing LAW
  appInsights: false      // reusing App Insights
  containerRegistry: false
}

param privateDnsZoneIds = {
  search: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.search.windows.net'
  cosmosSql: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.documents.azure.com'
  blob: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
  keyVault: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net'
  containerApps: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.<region>.azurecontainerapps.io'
  appConfig: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azconfig.io'
  acr: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io'
  appInsights: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.applicationinsights.azure.com'
  cognitiveservices: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.cognitiveservices.azure.com'
  openai: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.openai.azure.com'
  aiServices: '/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/privateDnsZones/privatelink.services.ai.azure.com'
}
```

---

## 6) Gotchas & Pro Tips

* **App Insights requires LAW.** If `deployToggles.appInsights = true` and you reuse LAW, the module binds to it.
* **PDNS is demand‑driven.** Zones are created only for services present and not supplied via `privateDnsZoneIds`.
* **Platform LZ integration.** If your platform team manages PDNS/PE, use the provided flag (if present) and pass existing PDNS zone IDs to avoid duplicating zones/links.
* **CAE is internal by default.** Expose apps via Application Gateway or adjust ingress as needed.
* **Outputs.** After deployment, inspect outputs for IDs, names, and endpoints to wire into CI/CD and app configuration.

---

## 7) Naming & resource groups

Use `baseName` to drive consistent resource names. For resource groups, a concise scheme like `rg-<workload>-<env>` works well (e.g., `rg-ailz-dev`). Ensure global‑name resources (Storage, ACR) still meet naming rules.

---

## 8) Using the AVM module in your repo

You can keep your infra repo and call this landing zone as an AVM Pattern module.

**`main.bicep` (minimal example)**

```bicep
targetScope = 'resourceGroup'
param location string = resourceGroup().location
param baseName string
param networkIsolation bool = true

module aiLandingZone 'br/public:avm/ptn/ai-ml/ai-landing-zone:<version>' = {
  name: 'ai-landing-zone'
  params: {
    location: location
    baseName: baseName
    networkIsolation: networkIsolation
    resourceIds: { /* leave blank to create; set IDs to reuse */ }
    deployToggles: { /* turn modules on/off as needed */ }
  }
}
```

**`infra/dev.bicepparam`**

```bicepparam
using './main.bicep'
param baseName = 'ailz-dev'
param networkIsolation = true
```

**`azure.yaml`**

```yaml
name: ailz-dev
infra:
  provider: bicep
  path: ./main.bicep
  parameters:
    file: ./infra/dev.bicepparam
```

**Provision**

```bash
azd auth login
azd init -e dev
azd provision
```

---

## 9) What gets deployed (at a glance)

Depending on your toggles and reuse choices, the deployment can include:

* **Core app platform:** VNet (spoke), CAE (internal), Container Apps, ACR
* **Data & config:** Storage, Key Vault, Cosmos DB, App Configuration, Azure AI Search
* **Observability:** Log Analytics + Application Insights
* **AI layer:** Azure AI Foundry (account, project, optional model deployments & connections)
* **Perimeter (optional):** WAF Policy, Application Gateway, API Management, Azure Firewall
* **Operations (optional):** Build VM (Linux) and Jump VM (Windows via Bastion)

> Review your `resourceIds` and `deployToggles` to tailor the footprint precisely for **create** vs. **reuse** scenarios.
