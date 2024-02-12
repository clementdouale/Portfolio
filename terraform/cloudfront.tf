resource "aws_cloudfront_distribution" "portfolio_distribution" {
  origin {
    domain_name = aws_s3_bucket.my_portfolio_bucket.bucket_regional_domain_name
    origin_id   = "S3-clementd-portfolio-bucket"
  }

  enabled = true
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
    acm_certificate_arn = aws_acm_certificate.my_portfolio_cert.arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

  # depends_on = [aws_acm_certificate_validation.my_portfolio_cert_validation]
}


resource "aws_cloudfront_origin_access_identity" "portfolio_oai" {
  comment = var.cloudfront_comment
}