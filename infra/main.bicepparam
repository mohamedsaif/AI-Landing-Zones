using './main.bicep'

param aiFoundryDefinition = {
  includeAssociatedResources: true
  aiFoundryConfiguration: {
    createCapabilityHosts: true
  }       
  aiModelDeployments: [
    {
      name: 'gpt-4o'
      raiPolicyName: ''
      versionUpgradeOption: ''
      model: {
        format: 'OpenAI'
        name: 'gpt-4o'
        version: '2024-11-20'
      }
      scale: {
        type: 'Standard'
        capacity: 1
        family: ''
        size: ''
        tier: ''
      }
    }
  ]
}

param jumpVmAdminPassword = '$(secretOrRandomPassword)'
