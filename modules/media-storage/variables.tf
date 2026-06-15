variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "environment" {
  type        = string
  description = "Ambiente de deploy (dev, staging, prod)"
}

variable "allowed_origins" {
  type        = list(string)
  default     = ["http://localhost:3000", "http://localhost:3001"]
  description = "Origens permitidas para CORS no upload de mídias"
}
