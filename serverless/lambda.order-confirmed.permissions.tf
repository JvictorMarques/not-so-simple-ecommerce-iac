resource "aws_iam_role" "order_confirmed" {
  name               = var.lambda.role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "order_confirmed_lambda_policy" {
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue",
      "sns:Publish",
    ]
    resources = [
      aws_rds_cluster.this.master_user_secret[0].secret_arn,
      aws_sns_topic.this.arn,
    ]
  }
}

resource "aws_iam_role_policy_attachment" "vpc_access_execution" {
  role       = aws_iam_role.order_confirmed.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy" "rds_sns_access" {
  name   = "rdsSnsAccess"
  role   = aws_iam_role.order_confirmed.name
  policy = data.aws_iam_policy_document.order_confirmed_lambda_policy.json
}