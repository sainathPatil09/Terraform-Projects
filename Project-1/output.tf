output "s3_bucket" {
  value = aws_s3_bucket.portfolio_bucket.id
}

output "aws_s3_bucket_website_url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
  
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.cdn.domain_name
}