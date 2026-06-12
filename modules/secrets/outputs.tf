output "google_client_id_arn" {
  value       = aws_ssm_parameter.google_client_id.arn
  description = "SSM ARN do Client ID do Google"
}

output "github_client_id_arn" {
  value       = aws_ssm_parameter.github_client_id.arn
  description = "SSM ARN do Client ID do GitHub"
}

output "email_service_api_key_arn" {
  value       = aws_ssm_parameter.email_service_api_key.arn
  description = "SSM ARN da chave de API do Email Service"
}

output "jwt_secret_key_arn" {
  value       = aws_ssm_parameter.jwt_secret_key.arn
  description = "SSM ARN do segredo de assinatura do JWT"
}

output "data_platform_secret_arn" {
  value       = aws_ssm_parameter.data_platform_secret.arn
  description = "SSM ARN do segredo compartilhado com o Data Platform"
}
