resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name}-cert"
  }
}

resource "aws_acm_certificate_validation" "this" {
  count                   = var.wait_for_validation ? 1 : 0
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for r in aws_acm_certificate.this.domain_validation_options : r.resource_record_name]

  timeouts {
    create = "45m"
  }
}
