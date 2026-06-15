# Origin Access Control (OAC) para o CloudFront acessar o S3 sem torná-lo público
resource "aws_cloudfront_origin_access_control" "media_oac" {
  name                              = "${var.project_name}-${var.environment}-media-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# Distribuição CloudFront para cache de borda global das mídias de usuários
resource "aws_cloudfront_distribution" "media_cdn" {
  origin {
    domain_name              = aws_s3_bucket.user_media.bucket_regional_domain_name
    origin_id                = "S3-user-media"
    origin_access_control_id = aws_cloudfront_origin_access_control.media_oac.id
  }

  enabled         = true
  is_ipv6_enabled = true
  comment         = "CDN para mídias de usuários do ${var.project_name} (${var.environment})"
  price_class     = "PriceClass_100" # Apenas EUA, Canadá e Europa para controle de custos

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-user-media"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400    # 24 horas
    max_ttl                = 31536000 # 1 ano
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-media-cdn"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
