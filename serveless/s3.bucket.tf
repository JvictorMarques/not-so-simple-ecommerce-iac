resource "aws_s3_bucket" "nsse" {
  bucket = "${var.s3_application_bucket.name}-${var.account_id}"
}

resource "aws_s3_bucket_versioning" "nsse" {
  bucket = aws_s3_bucket.nsse.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "nsse" {
  bucket = aws_s3_bucket.nsse.bucket
  rule {
    id     = "Moving to Intelligent Tiering"
    status = "Enabled"

    transition {
      days          = 0
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_transition {
      noncurrent_days = 0
      storage_class   = "INTELLIGENT_TIERING"
    }
  }
}
