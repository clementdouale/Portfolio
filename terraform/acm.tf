resource "aws_acm_certificate" "my_portfolio_cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
}

resource "aws_acm_certificate_validation" "my_portfolio_cert_validation" {
  certificate_arn         = aws_acm_certificate.my_portfolio_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.my_portfolio_cert_validation : record.fqdn]
}
