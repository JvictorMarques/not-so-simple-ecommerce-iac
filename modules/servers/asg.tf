resource "aws_autoscaling_group" "control_plane" {
  name = local.name_prefix

  max_size         = var.asg.max_size
  min_size         = var.asg.min_size
  desired_capacity = var.asg.desired_capacity

  health_check_grace_period = var.asg.health_check_grace_period
  health_check_type         = var.asg.health_check_type

  force_delete = true

  launch_template {
    id      = aws_launch_template.control_plane.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnet_ids

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
