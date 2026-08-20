resource "aws_s3_bucket" "this" {
  bucket        = var.logs_bucket_name
  force_destroy = true
}
