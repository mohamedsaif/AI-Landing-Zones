# Citadel Agents Spoke Deployment Guide

## Overview

The Citadel Agents Spoke provides an isolated, secure environment for deploying and managing agentic AI solutions within a hub-and-spoke network architecture. This guide helps both central cloud teams and use case development teams deploy and configure spoke environments tailored to specific business units or agentic use cases.

>This deployment is part of the **Foundry Citadel Platform (FCP)**, specifically the Citadel Agent Spoke (CAS) landing zone, which work in conjunction with the central Citadel Governance Hub (CGH) to provide a complete AI agent platform solution.

### Purpose

Deploy a dedicated Citadel Agents Spoke for each business unit or agentic use case to achieve:

- **Isolation**: Separate environments for different business units and use cases
- **Security**: Granular access control and permission management per spoke
- **Manageability**: Independent lifecycle management for agents and resources
- **Governance**: Through integration with Citadel Governance Hub (CGH) for centralized policy enforcement and monitoring

### Target Audience

- **Central Cloud Teams**: Platform engineers responsible for provisioning and managing spoke environments
- **Use Case Development Teams**: Application developers and data scientists building agentic solutions

### Use Case Examples

| Use Case | Description | Architecture Components |
|----------|-------------|------------------------|
| **Insurance Claims Processing** | Multi-agent system for claim submission, assessment, and approval | AI Foundry Agents + Azure Container Apps + Observability |
| **Customer Support Automation** | Multi-channel support via chatbots, email, and voice assistants | AI Foundry Agents + AI Evaluations + Monitoring |

> **Best Practice**: Deploy one spoke per business unit or major use case to maintain clear boundaries and simplify management.

---

## Foundry Citadel Platform Architecture

The Citadel Agents Spoke is a key component of the **Foundry Citadel Platform (FCP)** reference architecture, which provides a comprehensive, enterprise-grade platform for AI agent development and deployment. FCP is built on three foundational pillars:

### Two-Tier Deployment Model

Foundry Citadel Platform is divided into two complementary deployments:

1. **Citadel Governance Hub (CGH)** - Central Landing Zone
   - Represents the governance and security pillar
   - Provides the Unified AI Gateway (fortified front door and guard for LLMs, tools & agents)
   - Enforces platform-wide policies and controls
   - Centralized observability and compliance monitoring
   - Shared services and cross-spoke coordination

2. **Citadel Agent Spoke (CAS)** - This Deployment
   - Represents the AI development velocity pillar
   - Isolated environments for single agents or multi-agent systems
   - Serves specific use cases or business units
   - Agent hosting layer (AI Foundry, containers, apps - the "assembly line where work gets done")
   - Spoke-level observability integrated with platform-level monitoring
---

## Prerequisites

Before deploying a Citadel Agents Spoke, ensure you have:

### Required Access and Permissions

- Azure subscription with **Owner** or **Contributor + User Access Administrator** role
- Permissions to create resource groups and resources
- Permissions to assign managed identities (if using AI Foundry or Azure Container Apps)

### Required Tools

- Azure CLI (version 2.50.0 or later) or Azure PowerShell
- Bicep CLI (version 0.20.0 or later) or Terraform (version 1.5.0 or later)
- Git (for cloning the repository and maintianing IaC files)

### Network Planning

For spoke deployment, determine:

- **Virtual network address space**: CIDR range that doesn't overlap with existing networks (e.g., `10.1.0.0/16`)
- **Subnet requirements**: Minimum of 4 subnets for compute, agents, data, and management
- **Hub connectivity**: Hub VNet resource ID (if integrating with existing hub)
- **DNS settings**: Custom DNS or Azure-provided DNS (to align how private endpoints resolve)

### Decision Framework

Use the [component selection guide](#component-selection-guide) to determine which Azure services to include based on your use case requirements.

---

## Architecture Patterns

### Pattern 1: Standalone Spoke with New Resources

**When to use**: Greenfield deployment in a new subscription or resource group.

**Characteristics**:
- Creates all resources from scratch
- New VNet with predefined address space
- New Log Analytics workspace
- Suitable for greenfield environments that will be connected to a hub (CGH or enterprise hub) later
- Shouldn't operate independently, instead, integrate with Citadel Governance Hub.

**Deployment time**: ~20-60 minutes (depending on selected components)

### Pattern 2: Standalone Spoke with Existing Resources

**When to use**: Integrating with existing enterprise landing zone.

**Characteristics**:
- Reuses existing VNet (must be pre-configured)
- Reuses centralized Log Analytics workspace (from enterprise log analytics strategy)
- Requires existing VNet peering to hub (directly to Citadel Governance Hub or through existing hub network)
- Requires pre-configured subnets and NSGs

**Deployment time**: ~20-60 minutes (depending on selected components)

---

## Component Selection Guide

### Optional Components

Evaluate each optional component based on your use case requirements:

#### Azure API Management (APIM)

**Include when**:
- You need spoke-level API governance for exposed agents, APIs, or MCPs
- You require custom rate limiting, authentication, or transformation policies
- Your use case demands independent API management separate from the Citadel Governance Hub's Unified AI Gateway
- You need specific spoke-level API policies not covered by central governance

**Skip when**:
- All API governance is handled centrally through Citadel Governance Hub's Unified AI Gateway
- No external API exposure is required at the spoke level
- Central Citadel Governance Hub policies are sufficient for your use case

**Cost impact**: starting at ~$50/month (Developer SKU)

> **Note**: The Citadel Governance Hub provides a Unified AI Gateway that serves as the primary entry point for LLMs, agents, and tools. Spoke-level APIM is only needed for additional, use-case-specific API management requirements.

---

#### Jumpbox/Bastion

**Include when**:
- Development teams need secure access to private spoke resources
- No existing remote access infrastructure (VDI, VPN, or existing bastion) is available
- Debugging and troubleshooting require direct VM access

**Skip when**:
- Existing enterprise VPN or VDI solution provides access
- All development is done through Azure Portal/CLI without direct VM access

**Cost impact**: ~starting at $120/month (Bastion Basic)

---

#### Azure AI Search

**Include when**:
- Building retrieval-augmented generation (RAG) agents
- Use case requires semantic or vector search capabilities
- Need to index and search over large document collections

**Skip when**:
- No search or RAG functionality is needed
- Using alternative vector database solutions

**Cost impact**: ~$XXX/month (Basic tier)

---

#### Azure Cosmos DB

**Include when**:
- AI Foundry Agents require state management, threads, or metadata storage
- Use case needs globally distributed, low-latency NoSQL database
- Multi-agent systems require shared state coordination

**Skip when**:
- No state management or database requirements exist
- Alternative database solutions are already in place

**Cost impact**: ~$200/month (minimum provisioned throughput)

---

#### Storage Account

**Include when**:
- Using AI Foundry AI Evaluations or dataset management
- Agents need to store assets, temporary data, or shared files
- Multi-agent collaboration requires shared storage

**Skip when**:
- No file storage or data persistence requirements exist

**Cost impact**: starting at ~$20-$50/month (standard tier)

---

#### Grounding with Bing

**Include when**:
- You have requirements for real-time web search capabilities
- Agents need to access up-to-date information from the web

**Skip when**:
- No web search or real-time information access is required

**Cost impact**: starting at ~$X/month (standard tier)

---

### Required Components

The following components are essential and **should not be skipped**:

#### Azure Key Vault

**Purpose**:
- Securely store secrets, keys, and certificates for agents and services
- Enable automated secret rotation and management
- Integrate with **Citadel Governance Hub** for centralized secret sharing

**Always included**: Yes

---

#### Application Insights & Log Analytics

**Purpose**:
- Detailed monitoring and observability for all spoke resources
- Performance tracking and diagnostics
- Alert configuration and incident response
- Cost analysis and optimization
- Integration with platform-level observability from Citadel Governance Hub
- Provides the "instruments and control panels" for monitoring agent processes and outcomes

**Always included**: Yes

> **Note**: This component is part of FCP's Observability and Compliance pillar, which spans both CGH (platform) and CAS (spoke) landing zones to provide unified monitoring and evaluation capabilities.

---

### Agentic Runtime Components

Select one or both based on your agent architecture:

#### AI Foundry Agents

**Include when**:
- Using Azure AI Foundry managed agent runtime
- Leveraging pre-built connectors and agent workflows
- Building single-agent or multi-agent systems with Foundry tools
- Publishing agents to Microsoft 365 Copilot (Teams, Copilot Marketplace,...)
- Need rapid AI development velocity with minimal infrastructure management

**Benefits**:
- Fully managed runtime (no infrastructure management)
- Rich SDK and out-of-the-box integrations (with [Microsoft Agent Framework](https://github.com/microsoft/agent-framework))
- Native support for prompt flow and agent orchestration
- Built-in AI Evaluations and safety/compliance features
- Part of FCP's "assembly line where AI work gets done"
- Integrated with CGH's Unified AI Gateway for governance*

**feature currently in preview.*

---

#### Azure Container Apps

**Include when**:
- Running custom-built agents (bring-your-own-agent architecture)
- Need full control over agent runtime and dependencies (in-house developed or partner solutions)
- Deploying containerized agent workloads without Kubernetes complexity
- Your organization does not have direct control over the agent development technology stack

**Benefits**:
- Serverless container hosting
- Auto-scaling based on demand
- Simplified deployment with versioning and revisions
- Integrated with KEDA for event-driven scaling
- Part of FCP's flexible "assembly line" for hosting agents
- Can be swapped with AKS if compliance or organizational requirements dictate

> **Note**: FCP's modular design supports multiple hosting options. Organizations can choose between Azure Container Apps, AKS, or other compute services based on their specific requirements and existing standards.

---

## Deployment Configurations

### Configuration 1: Standalone with New Resources

This configuration is suitable for **greenfield deployments** where all infrastructure is created from scratch.

#### Features

- New Virtual Network with configurable address space
- New Log Analytics workspace
- All Azure services provisioned as new resources
- Network peering configured automatically (if hub VNet is specified)

#### Prerequisites

- Azure subscription
- Chosen VNet address space (e.g., `10.1.0.0/16`)

>**IMPORTANT**: Currently Foundry Agents subnet requires a subnet from 172.16.0.0/12 or 192.168.0.0/16, i.e. class B or C private address ranges reserved for private networking

---

### Configuration 2: Standalone with Existing Resources

This configuration is suitable for **brownfield deployments** where certain infrastructure already exists.

#### Features

- Reuses existing Virtual Network
- Reuses centralized Log Analytics workspace
- New Azure services provisioned within existing network
#### Prerequisites

- Existing VNet with pre-configured subnets that is aligned with spoke requirements:
    - Custom Agents subnet (for Azure Container Apps environment)
    - Foundry Agents subnet (for AI Foundry)
    - Private endpoint subnet (for databases, storage, Key Vault,...)
    - API Management subnet
    - Bastion subnet (for Azure Bastion, if Jumpbox is deployed)
    - Jumpbox subnet (if Jumpbox VM is deployed)
- Existing Network Security Groups (NSGs) configured
- Existing VNet peering to hub (for DNS, firewall, and shared services)
- Resource IDs for existing VNet and Log Analytics workspace

#### Required Subnet Configuration

| Subnet Name | Purpose | Minimum Size |
|-------------|---------|--------------|
| `snet-custom-agents` | Azure Container Apps environment | `/24` (256 IPs) |
| `snet-foundry-agents` | AI Foundry agents | `/24` (256 IPs) |
| `snet-private-endpoints` | Cosmos DB, AI Search, Storage, Key Vault private endpoints | `/27` (32 IPs) |
| `snet-apim` | API Management | `/27` (32 IPs) |
| `AzureBastionSubnet` | Azure Bastion (if Jumpbox deployed) | `/26` (64 IPs) |
| `snet-jumpbox` | Jumpbox VM (if Jumpbox deployed) | `/28` (16 IPs) |

---

## Deployment Instructions

### Step 1: Clone the Repository

```powershell
git clone https://github.com/Azure/AI-Landing-Zones.git
cd AI-Landing-Zones
```

### Step 2: Configure Deployment Parameters

Choose your Infrastructure-as-Code (IaC) tool:

#### Option A: Using Bicep

1. Navigate to the Bicep directory:
   ```powershell
   cd bicep
   ```

2. Copy and customize the parameter file:
   ```powershell
   cp infra/main.bicepparam citadel/citadel-agents-spoke.bicepparam
   ```

3. Edit `citadel/citadel-agents-spoke.bicepparam` with your values:
   ```bicep
   using './infra/main.bicep'
   
   param environmentName = 'agents-insurance-claims'
   param location = 'eastus'
   param deployAzureFirewall = false
   param deployApplicationGateway = false
   param deployApiManagement = true
   param deployJumpbox = true
   param deployAISearch = true
   param deployCosmosDB = true
   param deployFoundryAgents = true
   param deployContainerApps = true
   ```

#### Option B: Using Terraform

1. Navigate to the Terraform directory:
   ```powershell
   cd terraform
   ```

2. Create a `terraform.tfvars` file:
   ```hcl
   environment_name = "agents-insurance-claims"
   location = "eastus"
   deploy_azure_firewall = false
   deploy_application_gateway = false
   deploy_api_management = true
   deploy_jumpbox = true
   deploy_ai_search = true
   deploy_cosmosdb = true
   deploy_foundry_agents = true
   deploy_container_apps = true
   ```

### Step 3: Authenticate to Azure

```powershell
az login
az account set --subscription "<your-subscription-id>"
```

### Step 4: Deploy the Spoke

#### Using Bicep

```powershell
az deployment sub create `
  --location eastus `
  --template-file bicep/infra/main.bicep `
  --parameters citadel/citadel-agents-spoke.bicepparam
```

#### Using Terraform

```powershell
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

### Step 5: Verify Deployment

After deployment completes (approximately 30-45 minutes):

1. **Check resource group**:
   ```powershell
   az group show --name rg-agents-insurance-claims
   ```

2. **Verify key resources**:
   ```powershell
   az resource list --resource-group rg-agents-insurance-claims --output table
   ```

3. **Test connectivity** (if Jumpbox is deployed):
   - Connect via Azure Bastion
   - Verify private endpoint connectivity to Key Vault, AI Foundry, etc.

---

## Post-Deployment Tasks

### For Central Cloud Teams

1. **Configure RBAC**:
   - Assign use case development team members appropriate roles
   - Recommended roles: `Contributor` on resource group, `Cognitive Services User` on AI Foundry

2. **Set up networking**:
   - Validate VNet peering to hub (CGH and enterprise hub)
   - Configure DNS forwarding rules for private endpoint resolution
   - Update firewall rules for required outbound connectivity

3. **Configure monitoring**:
   - Create action groups for alerts
   - Set up dashboards in AI Foundry Project and Azure Monitor for spoke-level monitoring
   - Configure alerts

4. **Integrate with Citadel Governance Hub**:
   - **AI Access Contract**: Declares the governed dependencies an agent needs—LLMs, AI services, tools (MCP), and reusable agents—along with the precise access policies (model selection, capacity, regions, safety requirements). When automated, this contract guarantees consistent consumption guardrails across environments and simplifies approvals by making entitlements explicit.
   - **AI Publish Contract**: Describes the tools and agents a spoke exposes back to the hub, including the publishing rules, ownership metadata, and security posture. Automation turns this into a predictable cataloging workflow, accelerating time-to-discovery, enforcing compliance gates, and keeping the enterprise AI registry continuously in sync.

5. **Document deployment**:
   - Record deployed resources and configurations
   - Share access credentials securely (via Key Vault)
   - Update enterprise CMDB/asset inventory
   - Document spoke's contracts with Citadel Governance Hub (as it can be updated over time)

### For Use Case Development Teams

1. **Access the environment**:
   - Verify Azure RBAC permissions
   - Connect via Jumpbox/Bastion (if deployed)

2. **Configure AI Foundry** (if deployed):
   - Create AI Foundry project
   - Connect to AI services (OpenAI, Content Safety)
   - Set up prompt flow and agent workflows

3. **Deploy agents**:
   - For AI Foundry Agents: Use AI Foundry Studio
   - For Azure Container Apps: Deploy container images

4. **Set up CI/CD**:
   - Configure Azure DevOps or GitHub Actions pipelines
   - Implement deployment automation
   - Set up automated testing and evaluations

5. **Implement monitoring**:
   - Configure custom Application Insights telemetry
   - Set up agent-specific dashboards
   - Create alerts for agent failures or performance degradation

---

## Troubleshooting

### Common Issues

#### Deployment Fails with VNet Conflict

**Symptom**: `The address space <CIDR> overlaps with existing VNet`

**Solution**: Choose a non-overlapping CIDR range and redeploy:
```bicep
param vnetAddressPrefix = '10.2.0.0/16'  // Updated range
```

---

#### Key Vault Access Denied

**Symptom**: `403 Forbidden` when accessing Key Vault secrets

**Solution**: Grant managed identity Key Vault access:
```powershell
az keyvault set-policy --name <key-vault-name> `
  --object-id <managed-identity-object-id> `
  --secret-permissions get list
```

---

## Best Practices

### Security

- Enable Azure Policy for compliance enforcement
- Use managed identities for all service-to-service authentication
- Implement network security groups (NSGs) on all subnets
- Enable Azure Defender for all supported resource types
- Rotate secrets regularly using Key Vault automation

### Cost Optimization

- Use Azure Reservations for predictable workloads
- Enable auto-scaling for Azure Container Apps
- Monitor unused resources with Azure Advisor
- Set spending limits and cost alerts
- Use Azure Hybrid Benefit for Windows VMs (if applicable)

### Operational Excellence

- Implement infrastructure-as-code for all deployments
- Tag all resources with cost center, environment, and owner
- Set up automated backups for stateful services
- Document runbooks for common operational tasks
- Conduct regular disaster recovery drills

### Performance

- Deploy resources in the same region to minimize latency
- Use Azure Front Door or Application Gateway (usually provided as part of an existing enterprise landing zone))
- Monitor agent performance with Application Insights & AI Foundry
- Setup an AI Evaluation pipeline to continuously assess agent outputs

---

## Next Steps

- **Integrate with Citadel Governance Hub**: [Hub Integration Guide](#) _(link to be added)_
- **Develop, test and Deploy Your First Agent**: [Agent Development Quickstart](#) _(link to be added)_
- **Set Up CI/CD Pipelines**: [DevOps Integration Guide](#) _(link to be added)_
- **Implement AI Evaluations**: Configure automated evaluation pipelines to continuously assess agent outputs for quality, safety, and compliance

---

## Support and Feedback

- **Issues**: Report bugs or request features via [GitHub Issues](https://github.com/Azure/AI-Landing-Zones/issues)
- **Documentation**: [AI Landing Zones Documentation](https://github.com/Azure/AI-Landing-Zones)

---

## Additional Resources

- [AI Landing Zones Repository](https://github.com/Azure/AI-Landing-Zones)

