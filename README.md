# AI Landing Zone

- The AI Landing Zone provides an enterprise-scale production ready reference architecture with implementation (Portal, Bicep & Terraform) for AI Apps & Agents in the form of an application landing zone.
- It is meant to act as a foundation for various patterns, use cases and scenarios of AI solutions which can be deployed with or without platform landing zone.
- The IaC implementations i.e. Bicep and Terraform are based on [Azure Verified Modules](https://aka.ms/AVM).
- The AI Landing Zone focuses on [AI on Azure Platform](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/platform/architectures). A future version of it will cover [AI on Azure Infrastructure](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/infrastructure/cycle-cloud).
- The AI Landing Zone has been designed and tested for Azure Public Cloud but can be leveraged in the Azure Government and Sovereign Cloud.
- The AI Landing Zone is able to cover both generative and non-generative scenario per [resource selection guidance CAF AI Scenario](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/platform/resource-selection).
- The AI Landing Zone leverages [Semantic Kernel](https://learn.microsoft.com/en-us/semantic-kernel/overview/) as the orchestration framework.
- Given the pace of innovation and change in AI, the AI Landing Zone may leverage services in Preview to provide an architecture with latest features.

## Reference Architecture
The below diagram represents the reference architecture of the AI Landing Zone.

## Reference Implementation

The table represents the various reference implementations of the AI Landing Zone.

## AI Usecases & Scenarios
The AI Landing Zone act as a foundational technical pattern that is able to facilitate implementation of the below AI usecases & scenarios either with its default architecture or by extending it with additional Azure services as needed.

## Cloud Adoption Framework
The AI landing Zone aligns with the guidance in the [CAF AI Scenario](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/). For a holistic implementation of the AI Landing Zone, we recommend to review the [AI Checklist](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/#ai-checklists). To understand how to leverage the AI Landing Zone as part of a wider strategy, review the guidance on [AI Strategy](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/strategy). AI Landing Zone is part of the AI Ready stage in particular the AI on Azure platforms (PaaS).

## Well-Architected Framework
The AI landing Zone aligns with the guidance in the WAF AI workload. For a holistic implementation of the AI Landing Zone, we recommend to review the design methodology, principles and areas.

## Design Areas



## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
