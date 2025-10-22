# AI Landing Zone - Bicep Training Script (25 Minutes)

## Training Overview
**Duration:** 25 minutes  
**Audience:** Technical teams looking to deploy AI Landing Zones on Azure  
**Goal:** Demonstrate the Bicep template structure, deployment scenarios, and initiate a live deployment

---

## Presentation Outline

### 1. Introduction (2 minutes)
**What is the AI Landing Zone?**

- Enterprise-scale production-ready reference architecture for AI Apps & Agents solutions in Azure
- Built on Azure Verified Modules (AVM) - industry best practices
- Supports both standalone and platform landing zone integration
- Provides network isolation and security by default
- **Key Value:** Accelerates secure, compliant AI workload deployment

**What We'll Cover Today:**
1. Architecture overview
2. Bicep template structure
3. Deployment scenarios
4. Live deployment initiation

---

### 2. Architecture Deep Dive (4 minutes)

**Core Components:**

```
┌─────────────────────────────────────────────────────────────┐
│                   AI Landing Zone                            │
├─────────────────────────────────────────────────────────────┤
│  Networking Layer (Private, Secure, Isolated)               │
│  ├─ Virtual Network with Subnets                            │
│  ├─ NSGs, Private Endpoints, Private DNS Zones              │
│  ├─ Application Gateway + WAF (Optional)                    │
│  ├─ Azure Firewall (Optional)                               │
│  └─ Bastion Host (Optional)                                 │
├─────────────────────────────────────────────────────────────┤
│  AI Platform Services                                        │
│  ├─ Azure AI Foundry (Hub + Project + Agent Service)        │
│  ├─ Azure AI Search                                          │
│  ├─ Azure Cosmos DB                                          │
│  ├─ Azure Storage Account                                    │
│  └─ Azure Key Vault                                          │
├─────────────────────────────────────────────────────────────┤
│  Application Platform                                        │
│  ├─ Azure Container Apps Environment                         │
│  ├─ Azure Container Registry                                 │
│  └─ Azure API Management (Optional)                          │
├─────────────────────────────────────────────────────────────┤
│  Observability                                               │
│  ├─ Log Analytics Workspace                                  │
│  ├─ Application Insights                                     │
│  └─ Azure Monitor                                            │
├─────────────────────────────────────────────────────────────┤
│  Supporting Services                                         │
│  ├─ App Configuration                                        │
│  ├─ Bing Search (Optional - for grounding)                   │
│  ├─ Jump VM (Windows - Optional)                             │
│  └─ Build VM (Linux - Optional)                              │
└─────────────────────────────────────────────────────────────┘
```

**Key Security Features:**
- All traffic routed through Private Endpoints
- Network isolation enabled by default
- Private DNS zones for name resolution
- NSGs on all subnets
- Managed identities for authentication

---

### 3. Bicep Template Structure (5 minutes)

**Directory Layout:**
```
bicep/
├── infra/
│   ├── main.bicep              # Main orchestration template
│   ├── main.bicepparam         # Parameter file (customize here!)
│   ├── common/
│   │   └── types.bicep         # Strong typing definitions
│   ├── components/             # Custom components
│   │   ├── defender/           # Microsoft Defender for AI
│   │   ├── bing-search/        # Bing Search integration
│   │   └── vnet-peering/       # VNet peering helper
│   ├── helpers/                # Helper modules
│   │   ├── deploy-subnets-to-vnet/
│   │   └── enrich-subnets-with-nsgs/
│   └── wrappers/               # AVM module wrappers
│       ├── avm.res.network.virtual-network.bicep
│       ├── avm.ptn.ai-ml.ai-foundry.bicep
│       └── ... (50+ AVM wrappers)
├── scripts/
│   ├── preprovision.ps1        # Template Spec creation
│   └── postprovision.ps1       # Template Spec cleanup
└── docs/
    ├── how_to_use.md           # Deployment guide
    ├── examples.md             # Scenario examples
    └── parameters.md           # Full parameter reference
```

**Template Architecture Highlights:**

1. **Strongly Typed Parameters** (types.bicep)
   - User-Defined Types (UDTs) ensure consistency
   - Compile-time validation
   - Better IntelliSense experience

2. **Modular Design**
   - Each service = separate module
   - Easy to enable/disable components
   - Supports resource reuse

3. **Template Specs Pattern**
   - Pre-provision script creates Template Specs
   - Overcomes 4MB ARM template limit
   - Post-provision script cleans up

4. **Flexible Configuration**
   - Create vs. Reuse pattern for every resource
   - `deployToggles` - control what gets deployed
   - `resourceIds` - reference existing resources

---

### 4. Key Configuration Parameters (4 minutes)

**Three Critical Parameters to Understand:**

#### A. `deployToggles` - Feature Flags
```bicep
param deployToggles = {
  // Networking
  virtualNetwork: true
  agentNsg: true
  peNsg: true
  
  // AI Services
  aiFoundry: true
  searchService: true
  cosmosDb: true
  keyVault: true
  storageAccount: true
  
  // Container Platform
  containerEnv: true
  containerRegistry: true
  
  // Optional Infrastructure
  apiManagement: true
  applicationGateway: true
  firewall: false
  bastionHost: false
  jumpVm: false
  buildVm: false
}
```

#### B. `resourceIds` - Resource Reuse
```bicep
param resourceIds = {
  // Reference existing resources instead of creating new
  virtualNetworkResourceId: ''  // Empty = create new
  logAnalyticsWorkspaceResourceId: '/subscriptions/.../...'  // Reuse existing
  // ... any resource can be reused
}
```

#### C. `flagPlatformLandingZone` - Integration Mode
```bicep
// Standalone mode (default)
param flagPlatformLandingZone = false  // Creates all networking + DNS

// Platform integration mode
param flagPlatformLandingZone = true   // Reuses platform DNS zones
```

---

### 5. Three Deployment Scenarios (5 minutes)

#### **Scenario 1: Greenfield - Full New Deployment**
**When to use:** Starting from scratch, no existing infrastructure

**Key Configuration:**
```bicep
using './main.bicep'

param deployToggles = {
  // Everything enabled
  virtualNetwork: true
  apiManagement: true
  applicationGateway: true
  firewall: true
  bastionHost: true
  jumpVm: true
  // ... all services: true
}

param resourceIds = {}  // Create everything new
param flagPlatformLandingZone = false
```

**What gets deployed:**
- Complete VNet with all subnets
- All NSGs and Private DNS Zones
- Full AI platform stack
- Optional: App Gateway, Firewall, Bastion, VMs

**Deployment time:** ~45-60 minutes

---

#### **Scenario 2: Existing VNet - Add AI Services**
**When to use:** You have a VNet, just need AI Landing Zone services

**Key Configuration:**
```bicep
using './main.bicep'

param deployToggles = {
  // Core AI services only
  logAnalytics: true
  appInsights: true
  containerEnv: true
  containerRegistry: true
  cosmosDb: true
  keyVault: true
  storageAccount: true
  
  // Infrastructure - disabled
  apiManagement: false
  applicationGateway: false
  firewall: false
  bastionHost: false
  jumpVm: false
  
  // NSGs for new subnets
  agentNsg: true
  peNsg: true
  acaEnvironmentNsg: true
  
  virtualNetwork: false  // Don't create VNet
}

param existingVNetSubnetsDefinition = {
  existingVNetName: 'my-existing-vnet'
  useDefaultSubnets: false
  subnets: [
    { name: 'agent-subnet', addressPrefix: '192.168.0.0/27', ... }
    { name: 'pe-subnet', addressPrefix: '192.168.0.32/27', ... }
    { name: 'aca-env-subnet', addressPrefix: '192.168.2.0/23', ... }
  ]
}
```

**What gets deployed:**
- New subnets in existing VNet
- AI services with Private Endpoints
- Container platform

**Deployment time:** ~30-40 minutes

---

#### **Scenario 3: Platform Landing Zone Integration**
**When to use:** Your organization has a platform team managing DNS and networking

**Key Configuration:**
```bicep
using './main.bicep'

param flagPlatformLandingZone = true  // Key difference!

param deployToggles = {
  // Core services
  logAnalytics: true
  appInsights: true
  containerEnv: true
  aiFoundry: true
  // ... core AI services
  
  // No infrastructure management
  apiManagement: false
  applicationGateway: false
  firewall: false
  bastionHost: false
}

param privateDnsZonesDefinition = {
  allowInternetResolutionFallback: false
  createNetworkLinks: false  // Platform manages links
  
  // Reference platform-managed DNS zones
  cognitiveservicesZoneId: '/subscriptions/<sub>/resourceGroups/<plz-rg>/providers/Microsoft.Network/privateDnsZones/privatelink.cognitiveservices.azure.com'
  openaiZoneId: '/subscriptions/<sub>/.../privatelink.openai.azure.com'
  // ... all other zones from platform
}
```

**What gets deployed:**
- AI services only
- Private Endpoints link to platform DNS
- Workload VNet (optional)

**Deployment time:** ~25-35 minutes

---

### 6. Deployment Steps - Live Demo (4 minutes)

**Prerequisites Check:**
- ✅ Azure CLI installed and signed in
- ✅ Azure Developer CLI (azd) installed
- ✅ Owner or Contributor + UAA permissions
- ✅ Resource group created

**Step-by-Step Deployment:**

```powershell
# 1. Sign in to Azure
az login

# 2. Set subscription (if needed)
az account set --subscription "Your-Subscription-Name"

# 3. Create resource group
az group create `
  --name "rg-ailz-demo" `
  --location "eastus2"

# 4. Initialize azd in empty folder
mkdir deploy-ailz
cd deploy-ailz
azd init -t Azure/AI-Landing-Zones -e ailz-demo

# 5. Configure environment variables
azd env set AZURE_LOCATION "eastus2"
azd env set AZURE_RESOURCE_GROUP "rg-ailz-demo"
azd env set AZURE_SUBSCRIPTION_ID "00000000-1111-2222-3333-444444444444"

# 6. (Optional) Customize parameters
# Edit: bicep/infra/main.bicepparam
code bicep/infra/main.bicepparam

# 7. Start deployment
azd provision
```

**What Happens During `azd provision`:**

1. **Pre-Provision Hook** (preprovision.ps1)
   - Creates Template Specs for all AVM modules
   - Overcomes 4MB template size limit
   - Takes ~2-3 minutes

2. **Main Deployment**
   - Deploys resources in dependency order
   - Network → Security → Platform Services → AI Services
   - Progress shown in terminal

3. **Post-Provision Hook** (postprovision.ps1)
   - Cleans up Template Specs
   - Reports deployment summary
   - Provides resource endpoints

**Expected Output:**
```
Provisioning Azure resources (azd provision)
Provisioning Azure resources can take some time

  You can view detailed progress in the Azure Portal:
  https://portal.azure.com/#view/HubsExtension/DeploymentDetailsBlade/...

  (✓) Done: Resource group: rg-ailz-demo
  (✓) Done: Virtual Network: vnet-abc123xyz
  (✓) Done: Log Analytics: log-abc123xyz
  (⋯) In Progress: AI Foundry Hub: aih-abc123xyz
  ...
```

---

### 7. Customization & Best Practices (3 minutes)

**Common Customizations:**

1. **Naming Convention**
   ```bicep
   param baseName = 'ailz'  // Seeds all resource names
   // Results in: vnet-ailz, log-ailz, kv-ailz, etc.
   ```

2. **Network Sizing**
   ```bicep
   // Default VNet: 192.168.0.0/22 (1024 IPs)
   // Adjust in vNetDefinition parameter
   param vNetDefinition = {
     addressPrefixes: ['10.100.0.0/16']  // Larger space
     subnets: [
       { name: 'agent-subnet', addressPrefix: '10.100.1.0/24' }
       // ... customize subnet sizes
     ]
   }
   ```

3. **SKU Selection**
   ```bicep
   param aiSearchDefinition = {
     sku: 'basic'      // Options: free, basic, standard, storage_optimized
   }
   
   param cosmosDbDefinition = {
     disableLocalAuth: true
     defaultConsistencyLevel: 'Session'
     // ... capacity mode, backup policy, etc.
   }
   ```

4. **AI Model Deployments**
   ```bicep
   param aiFoundryDefinition = {
     aiServicesModelDeployments: [
       { name: 'gpt-4o', model: 'gpt-4o', version: '2024-05-13', capacity: 30 }
       { name: 'gpt-4o-mini', model: 'gpt-4o-mini', version: '2024-07-18', capacity: 50 }
       { name: 'text-embedding-ada-002', model: 'text-embedding-ada-002', ... }
     ]
   }
   ```

**Best Practices:**

✅ **Always start with minimal deployment**
   - Enable only required services first
   - Add optional components incrementally

✅ **Use resource tagging**
   ```bicep
   param tags = {
     Environment: 'Production'
     CostCenter: 'AI-Innovation'
     Owner: 'ai-team@company.com'
     Project: 'Customer-Copilot'
   }
   ```

✅ **Leverage existing resources when possible**
   - Reuse Log Analytics, VNets from platform
   - Reduces deployment time and complexity

✅ **Enable Microsoft Defender for AI**
   ```bicep
   param enableDefenderForAI = true  // Default: true
   ```

✅ **Plan subnet sizing carefully**
   - ACA Environment requires minimum /23 (512 IPs)
   - Bastion requires minimum /26 (64 IPs)
   - Leave room for growth

---

### 8. Post-Deployment Activities (2 minutes)

**Immediate Next Steps:**

1. **Verify Deployment**
   ```powershell
   # Check all resources
   az resource list --resource-group rg-ailz-demo --output table
   
   # Get AI Foundry endpoint
   az ml workspace show --name <workspace-name> --resource-group rg-ailz-demo
   ```

2. **Access Management**
   - Navigate to Azure AI Foundry Studio: https://ai.azure.com
   - Assign RBAC roles to users/groups
   - Configure API Management policies (if deployed)

3. **Connect to VMs (if deployed)**
   - Reset passwords via Azure Portal (Help → Reset password)
   - Connect via Bastion or RDP/SSH

4. **Configure Applications**
   - Deploy Container Apps to ACA Environment
   - Configure App Configuration key-values
   - Upload data to Storage Account

**Key Endpoints to Bookmark:**
- AI Foundry Studio: https://ai.azure.com
- Azure Portal Resource Group: [direct link]
- API Management Gateway: https://<apim-name>.azure-api.net
- Application Gateway: https://<public-ip-address>

---

### 9. Troubleshooting & Monitoring (1 minute)

**Common Issues:**

| Issue | Solution |
|-------|----------|
| Template too large error | Pre-provision script should handle this automatically |
| Quota errors | Request quota increase for AI services in region |
| Network connectivity | Verify NSG rules and Private DNS resolution |
| Deployment timeout | Check Azure Activity Log for failed resources |

**Monitoring Resources:**

```powershell
# View deployment logs
az deployment group show \
  --resource-group rg-ailz-demo \
  --name <deployment-name> \
  --query properties.outputs

# Check Application Insights
az monitor app-insights component show \
  --resource-group rg-ailz-demo \
  --app <appinsights-name>

# Query Log Analytics
az monitor log-analytics workspace show \
  --resource-group rg-ailz-demo \
  --workspace-name <law-name>
```

---

## Appendix: Quick Reference

### Deployment Commands Cheat Sheet

```powershell
# Full deployment
azd provision

# Deploy with specific environment
azd provision --environment prod

# Deploy only infrastructure (skip apps)
azd provision --no-prompt

# View environment values
azd env list
azd env get-values

# Clean up everything
azd down --purge
```

### Parameter File Template

```bicep
using './main.bicep'

// Basic configuration
param location = 'eastus2'
param baseName = 'myailz'
param tags = { Environment: 'Dev', Owner: 'team@company.com' }

// Deployment toggles (enable/disable components)
param deployToggles = { /* ... */ }

// Resource IDs (reuse existing resources)
param resourceIds = { /* ... */ }

// Platform integration
param flagPlatformLandingZone = false

// Service-specific definitions
param aiFoundryDefinition = { /* ... */ }
param cosmosDbDefinition = { /* ... */ }
// ... etc
```

### Subnet Sizing Guide

| Subnet | Minimum Size | Recommended | Notes |
|--------|-------------|-------------|-------|
| Agent Subnet | /27 (32 IPs) | /24 (256 IPs) | AI Foundry Agent Service |
| Private Endpoints | /28 (16 IPs) | /27 (32 IPs) | Each PE uses 1 IP |
| ACA Environment | /23 (512 IPs) | /23 or /22 | Azure requirement |
| Bastion | /26 (64 IPs) | /26 (64 IPs) | Azure requirement |
| Firewall | /26 (64 IPs) | /26 or /25 | Azure requirement |
| App Gateway | /27 (32 IPs) | /27 or /26 | For production scale |
| APIM | /28 (16 IPs) | /27 (32 IPs) | For multi-zone |

### Useful Links

- **Documentation:** https://github.com/Azure/AI-Landing-Zones/tree/main/bicep/docs
- **Examples:** https://github.com/Azure/AI-Landing-Zones/blob/main/bicep/docs/examples.md
- **Azure Verified Modules:** https://aka.ms/AVM
- **CAF AI Scenario:** https://learn.microsoft.com/azure/cloud-adoption-framework/scenarios/ai/
- **AI Foundry Documentation:** https://learn.microsoft.com/azure/ai-studio/

---

## Q&A Session

**Common Questions:**

**Q: How long does a full deployment take?**  
A: 45-60 minutes for greenfield, 25-35 minutes for minimal/platform-integrated scenarios.

**Q: Can I deploy without Azure Developer CLI?**  
A: Yes! Use `az deployment group create` with the Bicep template. You'll need to run pre/post-provision scripts manually.

**Q: What regions are supported?**  
A: All Azure Public Cloud regions. Some AI services may have limited regional availability.

**Q: How do I add custom Container Apps?**  
A: Use the `containerAppsList` parameter to define additional apps after initial deployment.

**Q: Can I use this with existing platform landing zone?**  
A: Absolutely! Set `flagPlatformLandingZone = true` and provide platform DNS zone IDs.

**Q: What about costs?**  
A: Costs vary significantly based on SKUs and enabled services. Use Azure Pricing Calculator for estimates. Start with basic SKUs for dev/test.

**Q: How do I update the deployment?**  
A: Modify `main.bicepparam` and run `azd provision` again. Bicep is idempotent.

**Q: Is this production-ready?**  
A: Yes! Built on Azure Verified Modules with security and reliability best practices. Customize for your specific requirements.

---

## Thank You!

**Next Steps:**
1. Try the deployment in your test subscription
2. Review the documentation for detailed configuration options
3. Join the community discussions on GitHub
4. Share feedback and contribute improvements

**Contact & Resources:**
- GitHub: https://github.com/Azure/AI-Landing-Zones
- Issues: https://github.com/Azure/AI-Landing-Zones/issues
- CAF AI Guidance: https://aka.ms/CAF-AI

---

*Script Version: 1.0*  
*Last Updated: October 2025*  
*Target Audience: Technical Architects, DevOps Engineers, Platform Engineers*
