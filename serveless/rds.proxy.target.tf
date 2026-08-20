resource "aws_db_proxy_default_target_group" "main" {
  db_proxy_name = aws_db_proxy.this.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    max_connections_percent      = 100
    max_idle_connections_percent = 50
  }

  lifecycle {
    replace_triggered_by = [aws_db_proxy.this.id]
  }
}

resource "aws_db_proxy_target" "example" {
  db_cluster_identifier = aws_rds_cluster.this.cluster_identifier
  db_proxy_name         = aws_db_proxy.this.name
  target_group_name     = aws_db_proxy_default_target_group.main.name

  lifecycle {
    replace_triggered_by = [aws_db_proxy.this.id]
  }
}
