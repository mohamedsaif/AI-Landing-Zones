# Deploying AI Landing Zone (Bicep AVM Pattern)

This guide explains how to deploy and operate the **AI Landing Zone** in this repository using **Bicep**. It covers deployment flows, parameterization patterns (create vs. reuse), network-isolation choices, and how each module behaves when enabled.

> The template is designed for **GenAI application workloads** and **Azure AI Foundry** projects. By default it deploys a **network-isolated** environment using **Private Endpoints (PE)** and **Private DNS (PDNS)**.

---

## Table of Contents

## Table of Contents

1. [What gets deployed (at a glance)](#1-what-gets-deployed-at-a-glance)  
2. [What you decide before provisioning](#2-what-you-decide-before-provisioning)  
3. [Quick start with `azd`](#3-quick-start-with-azd)  
4. [Core parameters you will set often](#4-core-parameters-you-will-set-often)  
5. [Resource-by-resource behavior & parameters](#5-resource-by-resource-behavior--parameters) 
6. [Examples](#6-examples)  
7. [Things to Know](#7-things-to-know)  
8. [Naming & resource groups](#8-naming--resource-groups)  
9. [Using this AVM Pattern from your own Bicep](#9-using-this-avm-pattern-from-your-own-bicep)  


---

## 1) What gets deployed (at a glance)

The **AI layer** centers on **Azure AI Foundry** (account, project, optional model deployments, and connections).

Depending on your toggles and reuse choices, the deployment can include:

* **Core app platform:** Container Apps Environment (internal ILB), Container Apps, ACR
* **Networking:** Spoke VNet, subnets, Private Endpoints, Private DNS zones (and optional hub peering)
* **Data & config:** Storage, Key Vault, Cosmos DB, App Configuration, Azure AI Search
* **Observability:** Log Analytics + Application Insights
* **Perimeter:** WAF Policy, Application Gateway, API Management, Azure Firewall
* **Operations:** Build VM (Linux) and Jump VM (Windows via Bastion)

---

## 2) What you decide before provisioning

### A) Platform-integrated vs. Standalone

* **Platform-integrated**: If your platform landing zone already provides shared PDNS/PE and connectivity, set `flagPlatformLandingZone = true` and supply existing **Private DNS Zone IDs** via `privateDnsZoneIds` (per service). The template then **reuses** platform PDNS and only creates what you ask for.
* **Standalone**: If you are not using a platform LZ, keep `flagPlatformLandingZone = false` (default). The template **creates** PDNS zones and **binds** Private Endpoints automatically for the services you deploy.

### B) Create vs. reuse existing services

For any service you already have, put its **Resource ID** under `resourceIds`.

* **If an ID is provided**, the template **reuses** it.
* **If left empty**, the template **creates** a new resource (when the corresponding toggle is true).

### C) Which modules to deploy

Use `deployToggles` to enable or skip each service (reusing via `resourceIds` still works). You can enable: VNet, Observability (LAW + App Insights), CAE, Container Apps, ACR, Key Vault, Storage, Cosmos DB, AI Search, App Configuration, perimeter components (WAF Policy, Application Gateway, API Management, Firewall), and optional VMs (Build/Jump).

## 3) Quick start with `azd`

### Prerequisites

* **Azure CLI** and **Azure Developer CLI** installed and signed in (`azd auth login`)
* A **resource group** in your target subscription
* A **`.bicepparam` file** for parameter values (e.g., `infra/main.bicepparam`)

### Steps to deploy


1) Sign in

```
azd auth login
```

2) Initialize an environment (example: dev)

```
azd init -t Azure/bicep-avm-ptn-aiml-landing-zone -e dev
```

3) Deploy infrastructure (uses infra/main.bicep + infra/main.bicepparam from azure.yaml)

```
azd provision
```

### Providing parameters

* **Option A (recommended):** Reference your `.bicepparam` file directly in `azure.yaml`:

  ```yaml
  infra:
    provider: bicep
    path: infra
    module: main
    parameters:
      file: infra/main.bicepparam
  ```

  Then simply run:

  ```bash
  azd provision
  ```

* **Option B:** Use `azd env set <name> <value>` for small overrides.

* **Option C:** Edit the `.env` file for your environment under `.azure/<env>/.env`.

> Keep secrets (PATs, admin passwords) **out of `.bicepparam`**. Use Key Vault or pipeline variables instead.

## 4) Core parameters you will set often

* `location` — defaults to the resource-group location.
* `tags` — key/value pairs applied to resources for identification, governance, and billing.
* `flagPlatformLandingZone` — `true` to reuse platform PDNS and networking; `false` to let this deployment create PDNS/PE.
* `baseName` — deterministic naming seed. If omitted, a stable 12-character token is generated and used as the base name.
* `resourceIds` — object with existing resource IDs to **reuse** (VNet, LAW, App Insights, CAE, ACR, Cosmos, KV, Storage, Search, App Config, APIM, App Gateway, Bastion, Firewall, etc.).
* `deployToggles` — per-service boolean switches that control whether each service is deployed.
* `privateDnsZoneIds` / `privateDnsZones` — provide zone IDs to reuse, or let the template create zones and link them to your VNet.
* `aiFoundryDefinition` — controls AI Foundry account/project, model deployments, associated resources, and networking:
  * `agentServiceEnabled` — enables the AI agent service; if `false`, no capability hosts, agent-specific private DNS/PEs, or agent dependencies are created.
  * `includeAssociatedResources` — when `true` AND `agentServiceEnabled` is `true`, auto‑creates Search, Key Vault, Cosmos DB, and Storage unless you set `existingResourceId` inside each `*Configuration`.
  * `aiModelDeployments[]` — model entries (`name`, `model {format,name,version}`, `scale {type,capacity}`).
  * `privateEndpointSubnetResourceId` — PE subnet for Foundry-associated resources when isolated.

---

## 5) Resource-by-resource behavior & parameters

### 5.1 Virtual Network (spoke)

Creates (or reuses) a VNet with subnets for **Private Endpoints**, **Container Apps Environment**, optional **Application Gateway**, **Firewall**, **Bastion**, **Jump VM**, and **Build VM**. Optional hub peering supported.

* **Parameters:**

  * `vnetDefinition` — address space, DNS servers, subnets, optional peering (`vnetPeeringConfiguration` or `vwanHubPeeringConfiguration`).
  * Reuse with `resourceIds.virtualNetworkResourceId`.

### 5.2 Private DNS & Private Endpoints

The template creates Private Endpoints for deployed services and links appropriate PDNS zones.

* **Reuse PDNS** via `privateDnsZoneIds` (keys: `cognitiveservices`, `openai`, `aiServices`, `search`, `cosmosSql`, `blob`, `keyVault`, `appConfig`, `containerApps`, `acr`, `appInsights`).
* **Create PDNS** via `privateDnsZones` when in standalone mode.

### 5.3 Observability (Log Analytics + Application Insights)

Deploys a **Log Analytics Workspace** and **Application Insights** unless you reuse existing ones. App Insights binds to the LAW.

* **Parameters:**

  * `logAnalyticsDefinition`, `appInsightsDefinition`
  * Reuse with `resourceIds.logAnalyticsWorkspaceResourceId` / `resourceIds.appInsightsResourceId`.

### 5.4 Container Apps Environment (CAE)

Creates (or reuses) an **internal** CAE (ILB) with optional **workload profiles**; apps can be external or internal.

* **Parameters:**

  * `containerAppEnvDefinition` — subnet, ILB, zone redundancy, workload profiles, identities.
  * Reuse with `resourceIds.containerEnvResourceId`.

### 5.5 Container Apps (microservices)

Deploy apps with images, scaling, Dapr sidecars, and optional external ingress.

* **Parameters:**

  * `containerAppsList` entries: `app_id`, `profile_name`, `min_replicas`, `max_replicas`, `external`, image ref(s).
  * Toggle with `deployToggles.containerApps`.

### 5.6 Azure Container Registry (ACR)

Creates (or reuses) a private ACR. In isolated mode, adds a PE and `privatelink.azurecr.io` PDNS.

* **Parameters:**

  * `containerRegistryDefinition` (`name`, `sku`, `tags`)
  * Reuse with `resourceIds.containerRegistryResourceId`.

### 5.7 Key Vault (app scope)

Central secret store for the app and CI/CD. In isolated mode, adds a PE and `privatelink.vaultcore.azure.net`.

* **Parameters:**

  * `keyVaultDefinition` (+ optional `roleAssignments`)
  * Reuse with `resourceIds.keyVaultResourceId`.

### 5.8 Storage Account (app scope)

Blob/file/queue for app data. In isolated mode, PE for **blob** and `privatelink.blob.core.windows.net` PDNS (cloud suffix varies).

* **Parameters:**

  * `storageAccountDefinition`
  * Reuse with `resourceIds.storageAccountResourceId`.

### 5.9 Cosmos DB (app scope)

Global database for chat state, metadata, or app data. In isolated mode, PE for **SQL** and `privatelink.documents.azure.com` PDNS.

* **Parameters:**

  * `cosmosDbDefinition`
  * Reuse with `resourceIds.dbAccountResourceId`.

### 5.10 Azure AI Search (app scope)

Search/vector index for RAG. In isolated mode, PE + `privatelink.search.windows.net` PDNS.

* **Parameters:**

  * `searchDefinition` (SKU, partitions/replicas, semantic search)
  * Reuse with `resourceIds.searchServiceResourceId`.

### 5.11 App Configuration

Centralized app settings. In isolated mode, PE + `privatelink.azconfig.io` PDNS.

* **Parameters:**

  * `appConfigurationDefinition`
  * Reuse with `resourceIds.appConfigResourceId`.

### 5.12 Azure AI Foundry — Account, Project, and Models

This section provisions an **AI Foundry account** and **project**, optionally deploys **model instances**, and connects to supporting services such as **Storage**, **Key Vault**, **Cosmos DB**, and **AI Search**.

#### Deployment Paths

Choose one of the following approaches:

1. **Complete Setup (Project + Agent Service + Models + Resources)**

   * Set `aiFoundryDefinition.createCapabilityHosts = true`
   * Set `aiFoundryDefinition.includeAssociatedResources = true`
   * Provide `aiModelDeployments[]` entries with:

     * `name`
     * `model { format, name, version }`
     * `scale { type, capacity }`
   * For Search, Cosmos DB, Storage, and Key Vault you may **customize their configuration** (e.g., name, SKU) or **reuse existing resources** by supplying `*Configuration.existingResourceId`.

2. **Minimal Setup (Project Only)**

   * Set `aiFoundryDefinition.createCapabilityHosts = false`
   * Set `aiFoundryDefinition.includeAssociatedResources = false`

> [!NOTE]
> `includeAssociatedResources` is only effective when `aiFoundryDefinition.createCapabilityHosts = true`. If `createCapabilityHosts = false`, no associated resources are deployed even if `includeAssociatedResources = true`.

### AI Foundry Networking

The **AI Foundry Agent Service** requires a runtime subnet for agent hosts, a private endpoints subnet (for Search, Cosmos DB, Key Vault, and Storage), and Private DNS zones for the corresponding `privatelink.*` domains.

Depending on your scenario, the networking setup works in two ways:

* **Standalone mode (`flagPlatformLandingZone = false`)** automatically uses `agent-subnet` in your VNet for the agent hosts. The private endpoints subnet defaults to `pe-subnet`, but you can override this with `aiFoundryDefinition.privateEndpointSubnetResourceId`. Private DNS zones are created and linked to your VNet automatically, unless you supply existing zone IDs.

* **Platform-integrated mode (`flagPlatformLandingZone = true`)** expects you to provide the subnet IDs. The agent hosts subnet must be specified via `aiFoundryDefinition.aiFoundryConfiguration.networking.agentServiceSubnetResourceId`, and the private endpoints subnet via `aiFoundryDefinition.privateEndpointSubnetResourceId`. In this case, all Private DNS zones must also be provided in `privateDnsZoneIds` (for example: `cognitiveservices`, `openai`, `aiServices`, `search`, `cosmosSql`, `blob`, `keyVault`, …) and linked by your platform landing zone.

> See **`examples.md`** for sample configurations in both modes.

### 5.13 Perimeter options (WAF Policy, Application Gateway, API Management, Firewall)

* **WAF Policy** — standalone policy that can attach to App Gateway.
* **Application Gateway** — L7 entry point, can be public and/or internal, bind to Container Apps or APIM.
* **API Management** — Central place for API gateway + governance (products, policies, auth).
* **Azure Firewall** — optional egress control, can be deployed with or without **Firewall Policy**.
* **Parameters:**

  * `wafPolicyDefinition`, `appGatewayDefinition`, `apimDefinition`, `firewallDefinition`, `firewallPolicyDefinition`.

### 5.14 Optional VMs

* **Build VM (Linux)** — can automatically configure an Azure DevOps agent or GitHub runner via cloud-init.
* **Jump VM (Windows)** — Bastion-accessed admin host; password seeded into a dedicated Key Vault for operators.
* **Parameters:**

  * `buildVmDefinition` (size, SSH key, runner details; PATs via secure params)
  * `jumpVmDefinition` (size, admin username, `vmKeyVaultSecName`) and secure `jumpVmAdminPassword`.

---

## 6) Examples

All deployment examples are in **[examples.md](./examples.md)**, including greenfield vs. reuse, Foundry variants (with/without Agent Service), perimeter configurations (AGW/WAF/APIM/Firewall), CAE/Container Apps, PDNS reuse/create, and “use this as an AVM module” samples.

---

## 7) Things to Know

1. **Platform LZ vs. Standalone:** If `flagPlatformLandingZone = true`, you must supply PDNS zone IDs in `privateDnsZoneIds`; this deployment will not create them.
2. **Observability coupling:** App Insights requires a LAW. If you reuse an existing LAW, App Insights uses that ID and skips creating a new workspace.
3. **CAE diagnostics:** When `containerAppEnvDefinition.enableDiagnosticSettings = true`, the CAE expects LAW credentials; the template wires them automatically for created LAW or references existing.
4. **Build VM guard:** The Build VM is deployed **only when** `buildVmDefinition.sshPublicKey` is set.
5. **Jump VM guard:** The Jump VM is deployed **only when** `jumpVmAdminPassword` is provided and you are **not** in platform LZ mode.
6. **ACR/Storage naming:** Both are global and have naming constraints. If you don’t set names, the template derives valid names from `baseName`.
7. **App Gateway frontends:** The template provisions a **private** frontend and, optionally, a **public** frontend when `appGatewayDefinition.createPublicFrontend = true`.

---

## 8) Naming & resource groups

* **Deterministic naming:** If you leave names blank, the template uses a stable `resourceToken` (derived from subscription, RG, and location) to build compliant names across resources.
* **Resource groups:** A concise pattern like `rg-<workload>-<env>` works well (e.g., `rg-ailz-dev`).
* **Global name resources:** Storage and ACR require globally unique names, letting the template derive them from `baseName` is usually simplest.

---

## 9) Using this AVM Pattern from your own Bicep

You can reference this Landing Zone as an **AVM Pattern** module from your own repo. Ready-to-copy samples (module call, `.bicepparam`, and `azure.yaml`) are in **[examples.md](./examples.md)** under *Use the pattern as an AVM module in your own bicep*.
