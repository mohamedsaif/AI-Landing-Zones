# Deploying AI Landing Zone

## Table of Contents

1. [Prerequisites](#2-prerequisites)  
2. [Quick start with azd](#3-quick-start-with-azd)  
3. [Configuration options](#4-configuration-options)  
4. [Reference docs](#5-reference-docs)  
5. [Important notes](#6-important-notes)  
6. [CI/CD pipelines (overview)](#7-cicd-pipelines-overview)  

---

## 1) Prerequisites

* **Azure CLI** and **Azure Developer CLI** installed and signed in  
* A **resource group** in your target subscription  
* **Owner** or **Contributor + User Access Administrator** permissions on the subscription  

## 2) Quick start with azd

### Deployment steps

1. **Sign in to Azure**

   ```bash
   az login
   ```

2. **Create the resource group** where you're gonna deploy the AI Landing Zone Resources

   ```bash
   az group create --name "rg-aiml-dev" --location "eastus2"
   ```

3. **Set environment variables** `AZURE_LOCATION`, `AZURE_RESOURCE_GROUP`, `AZURE_SUBSCRIPTION_ID`.

   *PowerShell*:

   ```powershell
   $env:AZURE_LOCATION = "eastus2"
   $env:AZURE_RESOURCE_GROUP = "rg-aiml-dev"
   $env:AZURE_SUBSCRIPTION_ID = "00000000-1111-2222-3333-444444444444"
   ```

   *bash*:

   ```bash
   export AZURE_LOCATION="eastus2"
   export AZURE_RESOURCE_GROUP="rg-aiml-dev"
   export AZURE_SUBSCRIPTION_ID="00000000-1111-2222-3333-444444444444"
   ```

4. **Initialize the project**

   In an empty folder (e.g., `deploy`), run:

   ```bash
   azd init -t Azure/bicep-avm-ptn-aiml-landing-zone -e aiml-dev
   ```

5. **(Optional) Customize parameters**

   Edit `infra/main.bicepparam` if you want to adjust deployment options.

6. **Provision the infrastructure**

   ```bash
   azd provision
   ```

> [!NOTE]  
> Provisioning uses Template Specs to bypass the 4 MB ARM template size limit.
> Pre-provision scripts build and publish them, while post-provision scripts remove them after success.

> [!TIP]  
> **Alternative deployment with Azure CLI**: If you prefer using Azure CLI instead of `azd`, skip step 4 (initialize) and replace step 6 with `az deployment group create`. Ensure you run the pre-provision script before deployment and the post-provision script after deployment.

## 3) Configuration options

Update parameters in the `infra/main.bicepparam` file:

```bicep
using 'main.bicep'

param location = 'eastus2'
param baseName = 'myailz'
param deployToggles = {
  acaEnvironmentNsg: true
  agentNsg: true
  apiManagement: true
  ...
  storageAccount: true
  virtualNetwork: true
  wafPolicy: true
}
param resourceIds = {}
param flagPlatformLandingZone = false
```

The template supports flexible deployment patterns through parameter configuration:

### Platform Integration

* **Standalone mode**: Creates all networking and DNS resources
* **Platform-integrated mode**: Reuses existing platform DNS zones and networking

### Resource Reuse

* **New resources**: Template creates all components from scratch
* **Existing resources**: Reuse components via `resourceIds` parameter
* **Hybrid**: Mix of new and existing resources as needed

### AI Foundry Options

* **Full setup**: AI Foundry with all dependencies (Search, Cosmos DB, Key Vault, and Storage)
* **Project only**: AI Foundry project only (no Agent Service or dependencies)
* **Custom models**: Configure specific AI model deployments

---

## 4) Reference docs

For detailed configuration and examples, see:

* **[parameters.md](./parameters.md)** — Complete parameter reference
* **[defaults.md](./defaults.md)** — Default values for all input parameters
* **[examples.md](./examples.md)** — Common deployment scenarios

---

## 5) Important notes

* **Naming**: If you leave names blank, the template generates valid names from the `baseName` parameter
* **Global resources**: Storage accounts and Container Registry require globally unique names
* **Platform integration**: Set `flagPlatformLandingZone = true` to integrate with existing platform DNS zones
* **VM deployment**: Build/Jump VMs only deploy when required parameters are provided (SSH keys, passwords)

---

## 6) CI/CD pipelines (overview)

Basic automation can be added later via `azd pipeline config`, which scaffolds either a GitHub Actions workflow or an Azure DevOps pipeline and sets up identity (OIDC) plus required variables. For deeper guidance, refer to the official docs: [https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline)

Minimal workflow:

```bash
azd pipeline config
```

This is usually enough for most teams to get a provisioning pipeline started; customize retention, approvals, and promotion flows in your organization’s standard DevOps process.

