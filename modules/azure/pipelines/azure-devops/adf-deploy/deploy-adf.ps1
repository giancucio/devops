param(
    [string]$ResourceGroupName,
    [string]$DataFactoryName,
    [string]$TemplateFile = "ARMTemplateForFactory.json",
    [string]$ParametersFile = "ARMTemplateParametersForFactory.json"
)

az deployment group create `
  --resource-group $ResourceGroupName `
  --template-file $TemplateFile `
  --parameters @$ParametersFile
