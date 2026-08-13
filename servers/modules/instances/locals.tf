locals {
  launch_template_name = "${var.name_prefix}-${var.name}-launch-template"
  asg_name             = "${var.name_prefix}-${var.name}-asg"
}