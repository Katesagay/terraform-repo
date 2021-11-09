resource "aws_route53_zone" "kunbee_zone" {
  name = var.domain_names[0]
}

resource "aws_route53_record" "kunbeedev_nsrecord" {
  zone_id = aws_route53_zone.kunbee_zone.zone_id
  name    = var.domain_names[0]
  type    = "NS"
  ttl     = var.ttl["ns"]
  records = [var.ns_record[0], var.ns_record[1], var.ns_record[2], var.ns_record[3]]
}
resource "aws_route53_record" "kunbeedev_soarecord" {
  zone_id = aws_route53_zone.kunbee_zone.zone_id
  name    = var.domain_names[0]
  type    = "SOA"
  ttl     = var.ttl["soa"]
  records = [var.soa_record]
}
resource "aws_route53_record" "kunbeedev_cnamerecord" {
  zone_id = aws_route53_zone.kunbee_zone.zone_id
  name    = "_5c4b68a5061344eab13693b1973bee76.${var.domain_names[0]}"
  type    = "CNAME"
  ttl     = var.ttl["cname"]
  records = [var.cname_record]
}
resource "aws_route53_record" "wwwkunbeedev_cnamerecord" {
  zone_id = aws_route53_zone.kunbee_zone.zone_id
  name    = "_c215ec3cea07685ae8010e3fd355453c.${var.domain_names[1]}"
  type    = "CNAME"
  ttl     = var.ttl["cname"]
  records = [var.cname_wwwrecord]
}
resource "aws_route53_record" "kunbeedev_txtrecord" {
  zone_id = aws_route53_zone.kunbee_zone.zone_id
  name    = "_amazonses.${aws_ses_domain_identity.domain.id}"
  type    = "TXT"
  ttl     = var.ttl["txt"]
  records = [aws_ses_domain_identity.domain.verification_token]
}

