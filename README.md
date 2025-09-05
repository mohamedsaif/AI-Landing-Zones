# AI Landing Zone (Bicep AVM Pattern)

This repository contains the **Bicep code** for the **AI Landing Zone Architecture**, published as an [Azure Verified Module](https://aka.ms/avm) Pattern. It provides a landing zone tailored for **generative AI application workloads**, automating deployment of a secure and configurable environment on Azure.

## Architecture

The architecture delivers a complete **AI Landing Zone** with **Azure AI Foundry** at its core. The **AI Foundry Agent service** operates alongside its main dependencies — **Azure AI Search, Cosmos DB, Storage, and Key Vault** — within a secure and integrated setup. In addition, a dedicated **Azure Container Apps environment** is provisioned, enabling you to build and run your own **GenAI applications**. Supporting services for configuration, data management, and observability are also included. Thanks to the component-based design, you can deploy the full stack or only the parts that best match your project needs.

![Architecture](./docs/architecture.png)
*AI Landing Zone*

Flexibility comes from **feature toggles**: you choose whether to create or reuse each service. This approach supports both greenfield deployments and integration with an existing platform landing zone.

By default, network isolation is enabled, ensuring that all traffic flows exclusively through Private Endpoints. Name resolution is handled via Private DNS zones, either created during deployment or linked to zones already managed at the platform level.

## Documentation

* [**How to deploy the Landing Zone.**](./docs/how_to_use.md)
  Step-by-step instructions on creating or reusing resources, setting up isolation, and configuring parameters. Includes a minimal example and notes on running `azd provision` (make sure the CLI is installed and logged in before you start).

* [**Parameter reference.**](./docs/parameters.md)
  Full list of parameters and objects, aligned with the strongly-typed contracts defined in `types.bicep`.
