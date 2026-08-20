resource "aws_security_group" "this" {
  name        = var.security_groups_names.rds
  description = "Security group for the production RDS instance"
  vpc_id      = data.aws_vpc.this.id
}

resource "aws_vpc_security_group_ingress_rule" "control_plane" {
  description                  = "Allow traffic to 5432 from control plane"
  security_group_id            = aws_security_group.this.id
  referenced_security_group_id = data.aws_security_group.control_plane.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "worker_nodes" {
  description                  = "Allow traffic to 5432 from worker nodes"
  security_group_id            = aws_security_group.this.id
  referenced_security_group_id = data.aws_security_group.worker_nodes.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "self" {
  description                  = "Allow traffic to 5432 from herself"
  security_group_id            = aws_security_group.this.id
  referenced_security_group_id = aws_security_group.this.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
