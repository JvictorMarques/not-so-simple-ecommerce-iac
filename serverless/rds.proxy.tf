resource "aws_db_proxy" "this" {
  name                = var.rds_proxy.name
  debug_logging       = var.rds_proxy.debug_logging
  engine_family       = var.rds_proxy.engine_family
  idle_client_timeout = 300
  require_tls         = true
  role_arn            = aws_iam_role.rds_proxy.arn

  vpc_security_group_ids = [aws_security_group.this.id]
  vpc_subnet_ids         = data.aws_subnets.private.ids

  auth {
    auth_scheme = "SECRETS"
    iam_auth    = "DISABLED"
    secret_arn  = aws_rds_cluster.this.master_user_secret[0].secret_arn
  }
}