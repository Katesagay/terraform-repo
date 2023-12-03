resource "aws_s3_bucket" "tf" {
  bucket = "dp-${var.environment_short}-${var.location_short}-s3"
}

resource "aws_s3_bucket_acl" "tf" {
  bucket = aws_s3_bucket.tf.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_tf" {
  bucket = aws_s3_bucket.tf.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "tf" {
  bucket = aws_s3_bucket.tf.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tfkey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}