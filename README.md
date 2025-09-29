# AI/ML Landing Zone — Built on AVM

This repository provides a **Bicep template** that composes **Azure Verified Modules (AVM)** and a few custom modules to provision a secure, configurable environment for **generative AI workloads** on Azure.

## Architecture

 This architecture delivers a full **AI Landing Zone** built around **Azure AI Foundry**. The **AI Foundry Agent service**, together with **AI Search, Cosmos DB, Storage, and Key Vault**, operates securely and seamlessly. A dedicated **Azure Container Apps** environment enables custom **GenAI applications**, and supporting services cover configuration, data, and observability. Thanks to its modular design, you can deploy everything or only the components you need.

![Architecture](./docs/architecture.png)
*AI Landing Zone*

Flexibility comes from **deployment options**: you choose whether to create or reuse each service. This approach supports both greenfield deployments and integration with an existing platform landing zone.

Network isolation is enabled by default, routing all traffic through Private Endpoints. Name resolution uses Private DNS zones created during deployment or linked to existing platform zones.

## Documentation

* [**How to deploy the Landing Zone.**](./docs/how_to_use.md)
  Step-by-step instructions on creating or reusing resources, setting up isolation, and configuring parameters. Includes a minimal example and notes on running `azd provision`.

* [**Parameter reference.**](./docs/parameters.md)
  A complete list of parameters and outputs, along with the related resources and modules, aligned with the strongly typed contracts defined in [`types.bicep`](./infra/common/types.bicep).
