param(
  [string]$Location = ""
)

if ($Location) {
  az group list --query "[?location=='$Location'].{Name:name,Location:location}" -o table
} else {
  az group list --query "[].{Name:name,Location:location}" -o table
}
