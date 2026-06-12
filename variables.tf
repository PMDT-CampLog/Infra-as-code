variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Região da AWS para provisionar a infraestrutura"
}

variable "project_name" {
  type        = string
  default     = "camplog"
  description = "Nome geral do projeto monorepo"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Ambiente de deploy (dev, staging, prod)"
}

# --- DATABASE VARIABLES ---

variable "db_instance_class" {
  type        = string
  default     = "db.t4g.micro"
  description = "Classe da instância RDS PostgreSQL"
}

variable "db_name" {
  type        = string
  default     = "camplog"
  description = "Nome do banco relacional principal"
}

variable "db_username" {
  type        = string
  default     = "postgres"
  description = "Administrador do banco de dados relacional"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Senha do administrador do banco de dados"
}

variable "db_allocated_storage" {
  type        = number
  default     = 20
  description = "Armazenamento alocado em GB"
}

variable "db_subnet_group_name" {
  type        = string
  default     = null
  description = "Subnet group para colocação do banco de dados"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = []
  description = "Lista de security groups da VPC para o banco de dados"
}

# --- SECRETS VARIABLES ---

variable "google_client_id" {
  type        = string
  description = "Google OAuth2 Client ID"
}

variable "google_client_secret" {
  type        = string
  sensitive   = true
  description = "Google OAuth2 Client Secret"
}

variable "github_client_id" {
  type        = string
  description = "GitHub OAuth2 Client ID"
}

variable "github_client_secret" {
  type        = string
  sensitive   = true
  description = "GitHub OAuth2 Client Secret"
}

variable "email_service_api_key" {
  type        = string
  sensitive   = true
  description = "API Key do provedor de e-mail (Resend/Brevo)"
}

variable "jwt_secret_key" {
  type        = string
  sensitive   = true
  description = "Chave secreta para assinatura de JWT"
}

variable "data_platform_secret" {
  type        = string
  sensitive   = true
  description = "Secret token compartilhado para segurança do Data Platform"
}
