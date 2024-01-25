resource "aws_route53_zone" "my_portfolio_zone" {
  name = var.domain_name
}


resource "aws_route53_record" "my_portfolio_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.my_portfolio_cert.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      records = dvo.resource_record_value
      type    = dvo.resource_record_type
    }
  }

  name    = each.value.name
  type    = each.value.type
  records = [each.value.records]
  ttl     = 60
  zone_id = aws_route53_zone.my_portfolio_zone.zone_id
}
