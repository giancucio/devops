resource "aws_iam_openid_connect_provider" "this" {
  url             = var.oidc_issuer_url
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = var.thumbprint_list
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.this.arn
}
