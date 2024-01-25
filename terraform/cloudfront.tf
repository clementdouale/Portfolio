resource "aws_cloudfront_distribution" "portfolio_distribution" {
  origin {
    domain_name = aws_s3_bucket.my_portfolio_bucket.bucket_regional_domain_name
    origin_id   = "S3-clementd-portfolio-bucket"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.portfolio_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-clementd-portfolio-bucket"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"  # Allows both HTTP and HTTPS
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # depends_on = [aws_acm_certificate_validation.my_portfolio_cert_validation]
}


resource "aws_cloudfront_origin_access_identity" "portfolio_oai" {
  comment = var.cloudfront_comment
}