# AI Landing Zone Architecture — Bicep Implementation

This repository provides the **Bicep code** for the **AI Landing Zone Architecture**, published as an [**Azure Verified Module (AVM) Pattern**](https://aka.ms). It delivers a landing zone specifically designed for **generative AI application workloads**, automating the deployment of a secure and modular environment on Azure.

## Architecture

This architecture provides a complete **AI Landing Zone**, centered on **Azure AI Foundry**. The **AI Foundry Agent service** is deployed alongside its core dependencies — **Azure AI Search, Cosmos DB, Storage, and Key Vault** — and runs within a secure **Azure Container Apps** environment. Supporting services for configuration, data management, and observability are included as well. Thanks to its **modular design**, you can deploy the full setup or just the components that best fit your workload.

![Architecture](./docs/architecture.png)
*AI Landing Zone*

A key aspect of the design is its **flexibility through feature toggles**: every major component can be turned on or off, letting you decide whether to create new resources, reuse existing ones, or share them between the app and AI Foundry. This modular approach makes the landing zone adaptable to different organizational setups, whether greenfield deployments or integrations with an existing platform landing zone.  

When network isolation is enabled, all traffic flows through Private Endpoints and is resolved by Private DNS zones, which can be created as part of the deployment or reused from a central platform.

## Documentation

* [**How to deploy the Landing Zone.**](./docs/how_to_use.md)
  Step-by-step guidance on when to create or reuse resources, how to handle isolation, and how to parameterize each component. Includes minimal parameter examples and instructions for running `azd provision`.

* [**Parameter reference.**](./docs/parameters.md)
  Comprehensive list of all parameters and objects, aligned with the strongly-typed contracts defined in `common/types.bicep`.
