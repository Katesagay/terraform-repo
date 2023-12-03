output tfkey {
  value       = "aws_kms_key.tfkey.arn"
  sensitive   = false
  description = "description"
  depends_on  = [aws_kms_key.tfkey]
}
