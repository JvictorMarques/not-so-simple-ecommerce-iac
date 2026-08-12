resource "aws_launch_template" "control_plane" {
  name = local.name_prefix

  key_name                             = aws_key_pair.this.key_name
  image_id                             = data.aws_ami.debian.id
  disable_api_stop                     = true
  disable_api_termination              = true
  instance_type                        = var.launch_template.instance_type
  instance_initiated_shutdown_behavior = "terminate"
  vpc_security_group_ids               = [aws_security_group.allow_ssh.id]

  network_interfaces {
    associate_public_ip_address = false
  }

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = var.launch_template.ebs.volume_size
      delete_on_termination = var.launch_template.ebs.delete_on_termination
    }
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.this.name
  }

  metadata_options {
    http_tokens = "required"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = local.name_prefix
    }
  }
}
