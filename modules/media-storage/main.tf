# 1. Bucket S3 para armazenamento de mídia do usuário (avatares, capas, posts)
resource "aws_s3_bucket" "user_media" {
  bucket        = "${var.project_name}-${var.environment}-user-media"
  force_destroy = var.environment == "dev" ? true : false

  tags = {
    Name        = "${var.project_name}-${var.environment}-user-media"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Purpose     = "UserMedia"
  }
}

# 2. Bloquear acesso público direto ao S3 (tudo via CloudFront OAC)
resource "aws_s3_bucket_public_access_block" "media_public_block" {
  bucket = aws_s3_bucket.user_media.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 3. Criptografia em repouso com AES-256
resource "aws_s3_bucket_server_side_encryption_configuration" "media_encryption" {
  bucket = aws_s3_bucket.user_media.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 4. Lifecycle: transição para STANDARD_IA após 90 dias (mídias acessadas raramente)
resource "aws_s3_bucket_lifecycle_configuration" "media_lifecycle" {
  bucket = aws_s3_bucket.user_media.id

  rule {
    id     = "archive_old_media"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "STANDARD_IA"
    }
  }
}

# 5. CORS para uploads diretos do frontend (quando presigned URLs forem usadas)
resource "aws_s3_bucket_cors_configuration" "media_cors" {
  bucket = aws_s3_bucket.user_media.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET"]
    allowed_origins = var.allowed_origins
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }
}

# 6. Política de bucket para permitir acesso do CloudFront via OAC
resource "aws_s3_bucket_policy" "media_cdn_policy" {
  bucket = aws_s3_bucket.user_media.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontOAC"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.user_media.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.media_cdn.arn
          }
        }
      }
    ]
  })
}
