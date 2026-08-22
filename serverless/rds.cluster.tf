resource "aws_rds_cluster" "this" {
  cluster_identifier          = var.rds_cluster.cluster_identifier
  engine                      = var.rds_cluster.engine
  engine_mode                 = var.rds_cluster.engine_mode
  database_name               = var.rds_cluster.database_name
  master_username             = var.rds_cluster.master_username
  manage_master_user_password = var.rds_cluster.manage_master_user_password
  storage_encrypted           = var.rds_cluster.storage_encrypted
  final_snapshot_identifier   = var.rds_cluster.final_snapshot_identifier
  availability_zones          = var.rds_cluster.availability_zones
  db_subnet_group_name        = aws_db_subnet_group.this.name
  deletion_protection         = var.rds_cluster.deletion_protection
  vpc_security_group_ids      = [aws_security_group.this.id]
  skip_final_snapshot         = true

  serverlessv2_scaling_configuration {
    min_capacity = var.rds_cluster.serverlessv2_scaling_configuration.min_capacity
    max_capacity = var.rds_cluster.serverlessv2_scaling_configuration.max_capacity
  }

  lifecycle {
    ignore_changes = [
      availability_zones,
    ]
  }
}
