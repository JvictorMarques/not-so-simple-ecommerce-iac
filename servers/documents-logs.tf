resource "aws_s3_bucket" "logs" {
  bucket        = var.logs_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_policy" "logs" {
  bucket = aws_s3_bucket.logs.id
  policy = data.aws_iam_policy_document.logs_bucket_policy.json
}

data "aws_iam_policy_document" "logs_bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.instance_profile.arn]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.logs.arn,
      "${aws_s3_bucket.logs.arn}/*",
    ]
  }
}
