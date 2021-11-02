## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.sns"></a> [aws.sns](#provider\_aws.sns) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.cloudwatch-alarm-topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.sns-topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.sns-topic-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_currency"></a> [currency](#input\_currency) | currency of charge | `string` | `""` | no |
| <a name="input_email_address_list"></a> [email\_address\_list](#input\_email\_address\_list) | list of emails to send the notification to | `string` | `""` | no |
| <a name="input_monthy_billing_threshold"></a> [monthy\_billing\_threshold](#input\_monthy\_billing\_threshold) | Maximum amount of total charges in usd | `number` | `5` | no |
| <a name="input_sns"></a> [sns](#input\_sns) | sns topic for bill | `map` | `{}` | no |

## Outputs

No outputs.
