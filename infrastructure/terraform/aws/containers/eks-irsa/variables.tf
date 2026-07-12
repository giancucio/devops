variable "oidc_issuer_url" {
  description = "Value for oidc issuer url."
  type        = string
}

variable "thumbprint_list" {
  description = "Value for thumbprint list."
  type        = list(string)
}
