resource "aws_kms_key" "tfkey" {
  description             = "This key is used to encrypt bucket objects for terraform"
  deletion_window_in_days = 10
}