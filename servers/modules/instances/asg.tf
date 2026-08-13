resource "aws_autoscaling_group" "this" {
  name = local.asg_name

  max_size         = var.asg.max_size
  min_size         = var.asg.min_size
  desired_capacity = var.asg.desired_capacity

  health_check_grace_period = var.asg.health_check_grace_period
  health_check_type         = var.asg.health_check_type

  force_delete = true

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.asg.vpc_zone_identifier

  instance_maintenance_policy {
    min_healthy_percentage = 100
    max_healthy_percentage = 110
  }

  dynamic "tag" {
    for_each = var.asg.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
