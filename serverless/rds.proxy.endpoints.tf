resource "aws_db_proxy_endpoint" "this" {
  db_proxy_name          = aws_db_proxy.this.name
  db_proxy_endpoint_name = "read-only-endpoint"
  vpc_subnet_ids         = data.aws_subnets.private.ids
  vpc_security_group_ids = [aws_security_group.this.id]
  target_role            = "READ_ONLY"
}