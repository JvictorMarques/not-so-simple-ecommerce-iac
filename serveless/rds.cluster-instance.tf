resource "aws_rds_cluster_instance" "this" {
  count              = length(var.rds_cluster.instances)
  cluster_identifier = aws_rds_cluster.this.id
  identifier         = var.rds_cluster.instances[count.index].identifier
  availability_zone  = var.rds_cluster.instances[count.index].availability_zone
  instance_class     = var.rds_cluster.instances[count.index].instance_class
  engine             = aws_rds_cluster.this.engine
  engine_version     = aws_rds_cluster.this.engine_version
}