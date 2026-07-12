resource "aws_appflow_flow" "this" {
  name = var.flow_name

  source_flow_config {
    connector_type = "S3"
    source_connector_properties {
      s3 {
        bucket_name   = var.source_bucket_name
        bucket_prefix = var.source_bucket_prefix
      }
    }
  }

  destination_flow_config {
    connector_type = "S3"
    destination_connector_properties {
      s3 {
        bucket_name = var.destination_bucket_name
      }
    }
  }

  trigger_config {
    trigger_type = "OnDemand"
  }

  task {
    source_fields = []
    task_type     = "Map_all"
    connector_operator {
      s3 = "NO_OP"
    }
  }

  tags = var.tags
}

output "flow_arn" {
  value = aws_appflow_flow.this.arn
}
