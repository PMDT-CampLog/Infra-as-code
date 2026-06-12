output "db_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Endpoint de conexão com o banco de dados RDS (host:port)"
}

output "db_address" {
  value       = aws_db_instance.postgres.address
  description = "Endereço DNS do banco de dados RDS"
}

output "db_port" {
  value       = aws_db_instance.postgres.port
  description = "Porta do banco de dados relacional PostgreSQL"
}

output "db_name" {
  value       = aws_db_instance.postgres.db_name
  description = "Nome do banco de dados PostgreSQL"
}
