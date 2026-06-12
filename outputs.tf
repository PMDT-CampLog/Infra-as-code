output "aws_region" {
  value       = var.aws_region
  description = "Região da AWS onde os recursos foram criados"
}

output "database_endpoint" {
  value       = module.database.db_endpoint
  description = "Endpoint do banco de dados relacional PostgreSQL"
}

output "database_name" {
  value       = module.database.db_name
  description = "Nome do banco de dados relacional criado"
}

output "data_lake_bucket_name" {
  value       = module.storage.bucket_name
  description = "Nome do bucket S3 que atua como Data Lake analítico"
}

output "data_lake_bucket_regional_domain" {
  value       = module.storage.bucket_domain_name
  description = "Domínio regional do bucket S3 do Data Lake"
}

output "ssm_jwt_secret_arn" {
  value       = module.secrets.jwt_secret_key_arn
  description = "ARN do parâmetro SSM que armazena a chave de criptografia do JWT"
}

output "ssm_email_api_key_arn" {
  value       = module.secrets.email_service_api_key_arn
  description = "ARN do parâmetro SSM que armazena a chave de API do e-mail"
}
