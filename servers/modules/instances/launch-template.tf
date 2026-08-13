resource "aws_launch_template" "this" {
  name = local.launch_template_name

  key_name                             = var.launch_template.key_name
  image_id                             = var.launch_template.image_id
  disable_api_stop                     = true
  disable_api_termination              = true
  instance_type                        = var.launch_template.instance_type
  instance_initiated_shutdown_behavior = "terminate"
  user_data                            = var.launch_template.user_data

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = var.launch_template.vpc_security_group_ids
  }

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = var.launch_template.ebs.volume_size
      delete_on_termination = var.launch_template.ebs.delete_on_termination
    }
  }

  iam_instance_profile {
    name = var.launch_template.iam_instance_profile.name
  }

  metadata_options {
    http_tokens = "required"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = local.launch_template_name
    }
  }
}
