param(
  [Parameter(Mandatory=$true)]
  [string]$VaultName
)

az keyvault secret list --vault-name $VaultName --query "[].name" -o table
