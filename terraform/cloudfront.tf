resource "aws_cloudfront_origin_access_control" "current" {
  name                              = "OAC ${aws_s3_bucket.my_portfolio_bucket.bucket}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  depends_on = [aws_s3_bucket.my_portfolio_bucket]
  origin {
    domain_name              = aws_s3_bucket.my_portfolio_bucket.bucket_regional_domain_name
    origin_id                = "${var.bucket_name}-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.current.id
  }
  comment         = "${var.domain_name} distribution"
  enabled         = true
  is_ipv6_enabled = true
  http_version    = "http2and3"
  price_class     = "PriceClass_200" 
  
  aliases = [
    var.domain_name,
    "www.${var.domain_name}"
  ]
  default_root_object = "index.html"

  default_cache_behavior {
          cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
          viewer_protocol_policy = "redirect-to-https"
          allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
          cached_methods         = ["GET", "HEAD"]
          compress               = true
          target_origin_id       = "${var.bucket_name}-origin"
      
          function_association {
            event_type   = "viewer-request"
            function_arn = aws_cloudfront_function.www_redirect.arn
          }
        }
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }
  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

resource "aws_cloudfront_function" "www_redirect" {
  name    = "${local.prefix}-www-redirect"
  runtime = "cloudfront-js-1.0"
  code    = file("./cloudfront-function.js")
  publish = true
}