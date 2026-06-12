resource "aws_s3_bucket" "data_lake" {
  bucket        = "${var.project_name}-${var.environment}-data-lake"
  force_destroy = var.environment == "dev" ? true : false

  tags = {
    Name        = "${var.project_name}-${var.environment}-data-lake"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Purpose     = "Analytics"
  }
}

# Habilitar versionamento do bucket para recuperar dados analíticos se deletados acidentalmente
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.data_lake.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Bloquear todo acesso público para máxima conformidade com a LGPD
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.data_lake.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Configurar criptografia server-side automática dos dados em repouso
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.data_lake.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Regra de ciclo de vida para otimização extrema de custos (transição automática após 1 ano para Glacier)
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.data_lake.id

  rule {
    id     = "archive_old_analytics"
    status = "Enabled"

    transition {
      days          = 365
      storage_class = "GLACIER"
    }
  }
}
