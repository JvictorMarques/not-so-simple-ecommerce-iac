resource "aws_security_group" "this" {
  name        = local.security_group_name
  description = "Security group for ${local.security_group_name}"
  vpc_id      = var.vpc_id

  tags = {
    Name = local.security_group_name
  }
}

resource "aws_vpc_security_group_egress_rule" "this" {
  description       = "Allow all outbound traffic"
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
