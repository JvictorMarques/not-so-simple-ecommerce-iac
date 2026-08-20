resource "aws_ssm_association" "this" {
  name                = "AWS-RunPatchBaseline"
  schedule_expression = var.document.schedule_expression
  max_concurrency     = var.document.max_concurrency
  max_errors          = var.document.max_errors
  parameters = {
    Operation    = var.document.parameters.Operation
    RebootOption = var.document.parameters.RebootOption
  }

  output_location {
    s3_bucket_name = aws_s3_bucket.this.bucket
    s3_key_prefix  = "patching-logs"
  }

  targets {
    key    = "tag:Patch Group"
    values = [local.patch_group]
  }
}
