output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "validation_records" {
  description = "DNS records you must manually create at your registrar to validate the certificate"
  value = [
    for r in aws_acm_certificate.this.domain_validation_options : {
      domain = r.domain_name
      name   = r.resource_record_name
      type   = r.resource_record_type
      value  = r.resource_record_value
    }
  ]
}
