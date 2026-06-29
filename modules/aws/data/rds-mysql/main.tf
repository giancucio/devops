resource "aws_db_instance" "this" {
  identifier             = var.identifier
  engine                 = "mysql"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.database_name
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  tags                   = var.tags
}

output "endpoint" {
  value = aws_db_instance.this.endpoint
}
