locals {
  name_prefix = "${var.project_name}-${terraform.workspace}"
  tags = {
    Project     = var.project_name
    Environment = terraform.workspace
  }
}
