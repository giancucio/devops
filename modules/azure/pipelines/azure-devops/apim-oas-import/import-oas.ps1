param(
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$ApimName,
    [Parameter(Mandatory=$true)] [string]$ApiId,
    [Parameter(Mandatory=$true)] [string]$SwaggerUrl,
    [string]$Path = "sample"
)

az apim api import `
  --resource-group $ResourceGroupName `
  --service-name $ApimName `
  --api-id $ApiId `
  --path $Path `
  --specification-format OpenApiJson `
  --specification-url $SwaggerUrl
