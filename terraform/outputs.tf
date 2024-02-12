output "s3_bucket_url" {
  value = aws_s3_bucket.my_portfolio_bucket.bucket_regional_domain_name
}


output "route53_zone_id" {
  value = aws_route53_zone.my_portfolio_zone.zone_id
}

