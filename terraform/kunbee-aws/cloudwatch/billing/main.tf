resource "aws_cloudwatch_metric_alarm" "billing" {
  provider            = aws.sns
  alarm_name          = "Billing-alarm-${lower(var.currency)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  threshold           = var.monthy_billing_threshold
  alarm_description   = "Total AWS charges for the month exceeded the threshold of ${var.currency} ${var.monthy_billing_threshold}"
  actions_enabled     = "true"
  treat_missing_data  = "notBreaching"

  alarm_actions = [aws_sns_topic.cloudwatch-alarm-topic.arn]
  ok_actions    = [aws_sns_topic.cloudwatch-alarm-topic.arn]
  tags = {
    createdOn = timestamp()
    createdBy = "terraform"

  }
  dimensions = {
    Currency = "${var.currency}"
  }
}