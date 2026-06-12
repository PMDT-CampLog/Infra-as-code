variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "environment" {
  type        = string
  description = "Ambiente de deploy (dev, staging, prod)"
}

variable "db_instance_class" {
  type        = string
  default     = "db.t4g.micro"
  description = "Classe da instância RDS"
}

variable "db_name" {
  type        = string
  default     = "camplog"
  description = "Nome do banco de dados relacional"
}

variable "db_username" {
  type        = string
  description = "Nome do administrador do banco"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Senha do administrador do banco"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Armazenamento alocado em GB"
}

variable "max_allocated_storage" {
  type        = number
  default     = 100
  description = "Armazenamento máximo para autoscaling em GB"
}

variable "db_subnet_group_name" {
  type        = string
  default     = null
  description = "Subnet group para colocar a instância de banco"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = []
  description = "Lista de IDs de security groups da VPC para associar à instância"
}
