## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.64.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.kunbeedev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_route53_record.kunbeedev_arecord](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kunbeedev_cnamerecord](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kunbeedev_nsrecord](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kunbeedev_soarecord](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kunbeedev_txtrecord](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.wwwkunbeedev_cnamerecord](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.kunbee_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_s3_bucket.kunbee_website](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.kunbee_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_ses_domain_identity.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_identity_verification.example_verification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity_verification) | resource |
| [aws_ses_domain_mail_from.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from) | resource |
| [aws_ses_email_identity.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_email_identity) | resource |
| [aws_cloudfront_distribution.kunbeedev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_distribution) | data source |
| [aws_route53_zone.kunbee_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record"></a> [a\_record](#input\_a\_record) | n/a | `string` | `""` | no |
| <a name="input_cloudfront_distribution"></a> [cloudfront\_distribution](#input\_cloudfront\_distribution) | n/a | `string` | `""` | no |
| <a name="input_cname_record"></a> [cname\_record](#input\_cname\_record) | n/a | `string` | `""` | no |
| <a name="input_cname_wwwrecord"></a> [cname\_wwwrecord](#input\_cname\_wwwrecord) | n/a | `string` | `""` | no |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | n/a | `list(any)` | `[]` | no |
| <a name="input_email"></a> [email](#input\_email) | n/a | `list(string)` | `[]` | no |
| <a name="input_ns_record"></a> [ns\_record](#input\_ns\_record) | n/a | `list(any)` | `[]` | no |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | n/a | `string` | `""` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | n/a | `map(any)` | `{}` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | n/a | `string` | `""` | no |

## Outputs

No outputs.
