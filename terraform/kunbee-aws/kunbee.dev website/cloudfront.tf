resource "aws_cloudfront_distribution" "kunbeedev" {
  origin {
    domain_name = aws_s3_bucket.kunbee_website.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    # s3_origin_config {
    #   origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    # }
  }



  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "kunbee.dev.s3.amazonaws.com"
    prefix          = "kunbeedev"
  }

  aliases = ["kunbee.dev", "www.kunbee.dev"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = null
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = "arn:aws:acm:us-east-1:030204052122:certificate/43f5deac-f363-4442-be63-f0e29255468b"
    ssl_support_method             = "sni-only"
  }
}





data "aws_route53_zone" "kunbee_zone" {
  name = var.domain_names[0]
}

data "aws_cloudfront_distribution" "kunbeedev" {
  id = var.cloudfront_distribution
}


resource "aws_route53_record" "kunbeedev_arecord" {
  for_each = toset(var.domain_names)
  zone_id  = data.aws_route53_zone.kunbee_zone.zone_id
  name     = each.value
  type     = "A"
  alias {
    name                   = data.aws_cloudfront_distribution.kunbeedev.domain_name
    zone_id                = data.aws_cloudfront_distribution.kunbeedev.hosted_zone_id
    evaluate_target_health = false
  }
}