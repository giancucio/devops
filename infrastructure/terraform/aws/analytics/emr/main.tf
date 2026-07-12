resource "aws_emr_cluster" "this" {
  name          = var.cluster_name
  release_label = var.release_label
  applications  = ["Spark"]
  service_role  = var.service_role_arn
  tags          = var.tags

  ec2_attributes {
    instance_profile = var.instance_profile
    subnet_id        = var.subnet_id
  }

  master_instance_group {
    instance_type = var.instance_type
  }

  core_instance_group {
    instance_type  = var.instance_type
    instance_count = 1
  }
}

output "cluster_id" {
  value = aws_emr_cluster.this.id
}
