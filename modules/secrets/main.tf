# Parâmetro Seguro para o Client ID do Google
resource "aws_ssm_parameter" "google_client_id" {
  name        = "/${var.project_name}/${var.environment}/auth/google-client-id"
  description = "Google OAuth2 Client ID"
  type        = "SecureString"
  value       = var.google_client_id

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Parâmetro Seguro para o Client Secret do Google
resource "aws_ssm_parameter" "google_client_secret" {
  name        = "/${var.project_name}/${var.environment}/auth/google-client-secret"
  description = "Google OAuth2 Client Secret"
  type        = "SecureString"
  value       = var.google_client_secret

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Parâmetro Seguro para o Client ID do GitHub
resource "aws_ssm_parameter" "github_client_id" {
  name        = "/${var.project_name}/${var.environment}/auth/github-client-id"
  description = "GitHub OAuth2 Client ID"
  type        = "SecureString"
  value       = var.github_client_id

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Parâmetro Seguro para o Client Secret do GitHub
resource "aws_ssm_parameter" "github_client_secret" {
  name        = "/${var.project_name}/${var.environment}/auth/github-client-secret"
  description = "GitHub OAuth2 Client Secret"
  type        = "SecureString"
  value       = var.github_client_secret

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Parâmetro Seguro para a chave de API do serviço de e-mail (Resend / Brevo)
resource "aws_ssm_parameter" "email_service_api_key" {
  name        = "/${var.project_name}/${var.environment}/email/api-key"
  description = "Email service (Resend/Brevo) API key"
  type        = "SecureString"
  value       = var.email_service_api_key

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Parâmetro Seguro para a chave de assinatura de tokens JWT do backend
resource "aws_ssm_parameter" "jwt_secret_key" {
  name        = "/${var.project_name}/${var.environment}/auth/jwt-secret-key"
  description = "Backend JWT signing secret key"
  type        = "SecureString"
  value       = var.jwt_secret_key

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Parâmetro Seguro para a assinatura secreta de integração com o Data Platform
resource "aws_ssm_parameter" "data_platform_secret" {
  name        = "/${var.project_name}/${var.environment}/analytics/data-platform-secret"
  description = "Shared secret for Data Platform webhook ingestion authorization"
  type        = "SecureString"
  value       = var.data_platform_secret

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
