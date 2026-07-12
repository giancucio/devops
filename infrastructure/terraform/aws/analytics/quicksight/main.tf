# QuickSight resources often require account-level setup first.
# This example creates a folder.

resource "aws_quicksight_folder" "this" {
  aws_account_id = var.aws_account_id
  folder_id      = var.folder_id
  name           = var.folder_name
}

output "folder_arn" {
  value = aws_quicksight_folder.this.arn
}
