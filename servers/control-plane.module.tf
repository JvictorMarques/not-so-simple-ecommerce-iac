module "control_plane" {
  source      = "./modules/instances"
  name_prefix = local.name_prefix
  name        = var.control_plane.name
  vpc_id      = data.aws_vpc.this.id
  launch_template = {
    key_name      = aws_key_pair.this.key_name
    image_id      = data.aws_ami.this.id
    instance_type = var.control_plane.launch_template.instance_type
    user_data     = filebase64("${path.module}/scripts/ssm.sh")
    ebs = {
      volume_size           = var.control_plane.launch_template.ebs.volume_size
      delete_on_termination = var.control_plane.launch_template.ebs.delete_on_termination
    }
    iam_instance_profile = {
      name = aws_iam_instance_profile.this.name
    }

  }
  asg = {
    min_size                  = var.control_plane.asg.min_size
    max_size                  = var.control_plane.asg.max_size
    desired_capacity          = var.control_plane.asg.desired_capacity
    health_check_grace_period = var.control_plane.asg.health_check_grace_period
    health_check_type         = var.control_plane.asg.health_check_type
    vpc_zone_identifier       = data.aws_subnets.private.ids
    tags = {
      Name          = "${local.name_prefix}-control-plane"
      Project       = var.project_name
      Environment   = terraform.workspace
      "Patch Group" = local.patch_group
    }
  }
}
