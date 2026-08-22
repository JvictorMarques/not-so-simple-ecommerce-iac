data "archive_file" "order_confirmed" {
  type        = "zip"
  source_dir  = "${path.module}/lambdas/order-confirmed/build"
  output_path = "${path.module}/lambdas/order-confirmed/outputs/order_confirmed.zip"
}

resource "aws_lambda_function" "order_confirmed" {
  filename      = data.archive_file.order_confirmed.output_path
  function_name = var.lambda.name
  role          = aws_iam_role.order_confirmed.arn
  handler       = "index.handler"
  code_sha256   = data.archive_file.order_confirmed.output_base64sha256

  runtime = var.lambda.runtime

  layers = [
    aws_lambda_layer_version.order_confirmed_node_modules.arn
  ]

  vpc_config {
    subnet_ids         = data.aws_subnets.private.ids
    security_group_ids = [aws_security_group.this.id]
  }

  environment {
    variables = {
      RDS_PROXY_ENDPOINT = aws_db_proxy.this.endpoint,
      RDS_SECRET_ARN     = aws_rds_cluster.this.master_user_secret[0].secret_arn,
      SNS_TOPIC_ARN      = aws_sns_topic.this.arn,
      RDS_DATABASE_NAME  = aws_rds_cluster.this.database_name
    }
  }
}

resource "aws_lambda_function_url" "order_confirmed" {
  function_name      = aws_lambda_function.order_confirmed.function_name
  authorization_type = "AWS_IAM"
}
