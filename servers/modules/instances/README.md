# instances

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0, < 7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg"></a> [asg](#input\_asg) | Auto Scaling Group configuration settings. | <pre>object({<br/>    max_size                  = number<br/>    min_size                  = number<br/>    desired_capacity          = number<br/>    health_check_grace_period = number<br/>    health_check_type         = string<br/>    vpc_zone_identifier       = list(string)<br/>    tags                      = map(string)<br/>  })</pre> | n/a | yes |
| <a name="input_launch_template"></a> [launch\_template](#input\_launch\_template) | Launch template configuration settings. | <pre>object({<br/>    key_name               = string<br/>    image_id               = string<br/>    instance_type          = string<br/>    vpc_security_group_ids = list(string)<br/>    ebs = object({<br/>      volume_size           = number<br/>      delete_on_termination = bool<br/>    })<br/>    iam_instance_profile = object({<br/>      name = string<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resources. | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The prefix name of the resources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
