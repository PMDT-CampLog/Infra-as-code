resource "aws_db_instance" "postgres" {
  identifier             = "${var.project_name}-${var.environment}-db"
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = var.environment == "dev" ? true : false
  final_snapshot_identifier = var.environment == "dev" ? null : "${var.project_name}-${var.environment}-db-final-snapshot"

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  storage_encrypted      = true
  deletion_protection    = var.environment == "prod" ? true : false

  tags = {
    Name        = "${var.project_name}-${var.environment}-db"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
