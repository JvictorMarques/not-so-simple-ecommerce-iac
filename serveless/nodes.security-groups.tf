data "aws_security_group" "control_plane" {
  filter {
    name   = "tag:Name"
    values = [var.security_groups_names.control_plane]
  }
}

data "aws_security_group" "worker_nodes" {
  filter {
    name   = "tag:Name"
    values = [var.security_groups_names.worker_nodes]
  }
}
