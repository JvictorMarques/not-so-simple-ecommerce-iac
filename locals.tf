locals {
  tags = {
    Project     = var.project_name
    Environment = terraform.workspace
  }
}
