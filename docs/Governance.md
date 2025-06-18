
## Governance 

<div align="center">

| **ID** | **Title**                | **Summary**                                                                 |
|--------|--------------------------|-----------------------------------------------------------------------------|
| G-R1   | Built-in Policies        | Align with and enforce Azure built-in AI policies.                          |
| G-R2   | Industry Standards       | Align with NIST and other industry frameworks.                              |
| G-R3   | Responsible AI           | Implement responsible AI standards and reporting.                           |
| G-R4   | AI Content Safety        | Enforce content safety for AI models and outputs.                           |
| G-R5   | Model Availability       | Govern and control which AI models are available for deployment.            |

</div>

---

### G-R1: Align with Built-in Policies
- **Description:**
  - The AI Landing Zone should provide guidance and implementation of built-in AI-related policies, and the implementation must comply with those policies.
- **References:**
  - [Azure Built-in Policies](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies)
  - [Azure landing zones - Policies](https://github.com/Azure/Enterprise-Scale/wiki/ALZ-Policies)
  - [Azure AI Foundry Policy Reference](https://learn.microsoft.com/en-us/azure/ai-services/policy-reference?context=%2Fazure%2Fai-studio%2Fcontext%2Fcontext)
  - [Azure Machine Learning Policy Reference](https://learn.microsoft.com/en-us/azure/machine-learning/policy-reference)
  - [Azure AI Services Policy Reference](https://learn.microsoft.com/en-us/azure/ai-services/policy-reference)
  - [Azure AI Search Policy Reference](https://learn.microsoft.com/en-us/azure/search/policy-reference)
  - [Deployment Options](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/implementation-options#environment-development-approaches)
  - [Azure OpenAI Guardrails](https://www.azadvertizer.net/azpolicyinitiativesadvertizer/Enforce-Guardrails-OpenAI.html)
  - [Azure Machine Learning Guardrails](https://www.azadvertizer.net/azpolicyinitiativesadvertizer/Enforce-Guardrails-MachineLearning.html)
  - [Azure AI Search Guardrails](https://www.azadvertizer.net/azpolicyinitiativesadvertizer/Enforce-Guardrails-CognitiveServices.html)
  - [Azure Bot Services Guardrails](https://www.azadvertizer.net/azpolicyinitiativesadvertizer/Enforce-Guardrails-BotService.html)
  - [Regulatory Compliance Initiatives](https://learn.microsoft.com/en-us/azure/governance/policy/samples/#regulatory-compliance)
- **Best Practices:**
  - Automate policy enforcement with Azure Policy to reduce human error.
  - Adhere to recommended Azure Policies for AI resources.
  - Apply AI policies to each management group.
  - Start with baseline policies for each workload type.
  - Use Azure Policy to apply built-in policy definitions for each AI platform.
  - Select the policy initiative under _Workload Specific Compliance_ during Azure landing zone deployment.
  - Use applicable regulatory compliance initiatives for your industry.

---

### G-R2: Industry Standards
- **Description:**
  - The AI Landing Zone should provide guidance on how to align and comply with industry standard guidance such as:
    - [NIST Artificial Intelligence Risk Management Framework (AI RMF)](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf)
    - [NIST AI RMF Playbook](https://airc.nist.gov/AI_RMF_Knowledge_Base/Playbook)

---

### G-R3: Responsible AI
- **Description:**
  - The AI Landing Zone should provide guidance and implementation of [responsible AI standards](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/govern#assess-ai-organizational-risks) using the [Responsible AI dashboard](https://learn.microsoft.com/en-us/azure/machine-learning/concept-responsible-ai-dashboard) to generate reports around model outputs.

---

### G-R4: AI Content Safety
- **Description:**
  - The AI Landing Zone should provide guidance and implementation of [Azure AI Content Safety](https://learn.microsoft.com/en-us/azure/ai-services/content-safety/overview) APIs that can be called for testing to facilitate content safety testing.
- **Best Practices:**
  - Use Azure AI Content Safety to define a baseline content filter for approved AI models.
  - The safety system runs both the prompt and completion through classification models to detect and prevent harmful content.
  - Features include prompt shields, groundedness detection, and protected material text detection.
  - Scans both images and text.
  - Create a process for application teams to communicate different governance needs.

---

### G-R5: Model Availability
- **Description:**
  - The AI Landing Zone should provide guidance and implementation to govern model availability.
- **Best Practices:**
  - Use Azure Policy to manage which specific models teams are allowed to deploy from the Azure AI Foundry model catalog.
  - Use a [built-in policy](https://learn.microsoft.com/en-us/azure/ai-studio/how-to/built-in-policy-model-deployment) or create a custom policy.
  - Start with an _audit_ effect to monitor model usage without restricting deployments.
  - Switch to the _deny_ effect only after understanding development and experimentation needs.
  - Remediate noncompliant models manually if a policy is switched to _deny_ (existing deployments are not automatically removed).

---

