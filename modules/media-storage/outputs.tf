output "bucket_name" {
  value       = aws_s3_bucket.user_media.id
  description = "Nome do bucket S3 de mídias de usuário"
}

output "bucket_arn" {
  value       = aws_s3_bucket.user_media.arn
  description = "ARN do bucket S3 de mídias de usuário"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.user_media.bucket_regional_domain_name
  description = "Nome de domínio regionalizado do bucket S3 de mídias"
}

output "cdn_domain_name" {
  value       = aws_cloudfront_distribution.media_cdn.domain_name
  description = "Domínio público do CloudFront para servir mídias"
}

output "cdn_distribution_id" {
  value       = aws_cloudfront_distribution.media_cdn.id
  description = "ID da distribuição CloudFront para invalidação de cache"
}
