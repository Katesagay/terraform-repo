
resource "aws_sns_topic" "cloudwatch-alarm-topic" {
  provider     = aws.sns
  name         = var.sns["name"]
  display_name = var.sns["display_name"]
  policy       = data.aws_iam_policy_document.sns-topic-policy.json
  # type         = var.sns["type"]
}
resource "aws_sns_topic_subscription" "sns-topic" {
  provider  = aws.sns
  topic_arn = aws_sns_topic.cloudwatch-alarm-topic.arn
  protocol  = "email"
  endpoint  = var.email_address_list

}

data "aws_iam_policy_document" "sns-topic-policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.sns["account-id"],
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:sns:${var.sns["region"]}:${var.sns["account-id"]}:${var.sns["name"]}",
    ]

    sid = "__default_statement_ID"
  }
}