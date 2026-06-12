terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Módulo para provisionamento do Banco de Dados Relacional (PostgreSQL RDS)
module "database" {
  source = "./modules/database"

  project_name      = var.project_name
  environment       = var.environment
  db_instance_class = var.db_instance_class
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  allocated_storage = var.db_allocated_storage

  # VPC e subnets podem ser repassadas a partir de outro recurso de redes global
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
}

# 2. Módulo para provisionamento do Storage Analítico (S3 Data Lake para arquivos Parquet)
module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  environment  = var.environment
}

# 3. Módulo para gerenciamento seguro das variáveis de ambiente (Secrets Manager / SSM Parameter Store)
module "secrets" {
  source = "./modules/secrets"

  project_name          = var.project_name
  environment           = var.environment
  google_client_id      = var.google_client_id
  google_client_secret  = var.google_client_secret
  github_client_id      = var.github_client_id
  github_client_secret  = var.github_client_secret
  email_service_api_key = var.email_service_api_key
  jwt_secret_key        = var.jwt_secret_key
  data_platform_secret  = var.data_platform_secret
}
