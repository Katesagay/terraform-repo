resource "aws_ses_domain_mail_from" "example" {
  domain           = aws_ses_domain_identity.domain.domain
  mail_from_domain = "bounce.${aws_ses_domain_identity.domain.domain}"
}

resource "aws_ses_domain_identity_verification" "example_verification" {
  domain = aws_ses_domain_identity.domain.id

  depends_on = [aws_route53_record.kunbeedev_txtrecord]
}

resource "aws_ses_domain_identity" "domain" {
  domain = var.domain_names[0]
}
resource "aws_ses_email_identity" "email" {
  for_each = toset(var.email)
  email    = each.value
}