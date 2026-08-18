module "worker_nodes" {
  source      = "./modules/instances"
  name_prefix = local.name_prefix
  name        = var.worker_nodes.name
  vpc_id      = data.aws_vpc.this.id
  launch_template = {
    key_name      = aws_key_pair.this.key_name
    image_id      = data.aws_ami.debian.id
    instance_type = var.worker_nodes.launch_template.instance_type
    user_data     = filebase64("${path.module}/scripts/ssm.sh")
    ebs = {
      volume_size           = var.worker_nodes.launch_template.ebs.volume_size
      delete_on_termination = var.worker_nodes.launch_template.ebs.delete_on_termination
    }
    iam_instance_profile = {
      name = aws_iam_instance_profile.this.name
    }

  }
  asg = {
    min_size                  = var.worker_nodes.asg.min_size
    max_size                  = var.worker_nodes.asg.max_size
    desired_capacity          = var.worker_nodes.asg.desired_capacity
    health_check_grace_period = var.worker_nodes.asg.health_check_grace_period
    health_check_type         = var.worker_nodes.asg.health_check_type
    vpc_zone_identifier       = data.aws_subnets.private.ids
    tags = {
      Name          = "${local.name_prefix}-${var.worker_nodes.name}"
      Project       = var.project_name
      Environment   = terraform.workspace
      "Patch Group" = local.patch_group
    }
  }
}
