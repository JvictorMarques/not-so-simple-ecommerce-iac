data "aws_iam_policy_document" "rds_proxy_trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "rds_cluster_secrets_policy" {
  statement {
    sid       = "AllowRDSProxyToAccessRDSSecrets"
    actions   = ["secretsmanager:GetSecretValue"]
    effect    = "Allow"
    resources = [aws_rds_cluster.this.master_user_secret[0].secret_arn]
  }
}

resource "aws_iam_role" "rds_proxy" {
  name               = var.rds_proxy.role_name
  description        = "IAM role for RDS Proxy"
  assume_role_policy = data.aws_iam_policy_document.rds_proxy_trust_policy.json
}

resource "aws_iam_role_policy" "rds_proxy_secrets_policy" {
  name   = "rds-proxy-secrets-access"
  role   = aws_iam_role.rds_proxy.name
  policy = data.aws_iam_policy_document.rds_cluster_secrets_policy.json
}
