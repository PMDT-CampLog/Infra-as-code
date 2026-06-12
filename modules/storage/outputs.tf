output "bucket_name" {
  value       = aws_s3_bucket.data_lake.id
  description = "Nome do bucket S3 do Data Lake"
}

output "bucket_arn" {
  value       = aws_s3_bucket.data_lake.arn
  description = "ARN do bucket S3 do Data Lake"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.data_lake.bucket_regional_domain_name
  description = "Nome de domínio regionalizado do bucket S3"
}
