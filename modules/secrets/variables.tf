variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "environment" {
  type        = string
  description = "Ambiente de deploy (dev, staging, prod)"
}

variable "google_client_id" {
  type        = string
  description = "Google OAuth Client ID"
}

variable "google_client_secret" {
  type        = string
  sensitive   = true
  description = "Google OAuth Client Secret"
}

variable "github_client_id" {
  type        = string
  description = "GitHub OAuth Client ID"
}

variable "github_client_secret" {
  type        = string
  sensitive   = true
  description = "GitHub OAuth Client Secret"
}

variable "email_service_api_key" {
  type        = string
  sensitive   = true
  description = "API Key do Resend / Brevo"
}

variable "jwt_secret_key" {
  type        = string
  sensitive   = true
  description = "Segredo de assinatura JWT do Backend"
}

variable "data_platform_secret" {
  type        = string
  sensitive   = true
  description = "Shared secret de integração com o Data Platform"
}
