# servers

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0, < 7.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.58.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_control_plane"></a> [control\_plane](#module\_control\_plane) | ./modules/instances | n/a |
| <a name="module_worker_nodes"></a> [worker\_nodes](#module\_worker\_nodes) | ./modules/instances | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.allow_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.debian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_control_plane"></a> [control\_plane](#input\_control\_plane) | Launch template configuration settings. | <pre>object({<br/>    name = optional(string, "control-plane")<br/>    launch_template = object({<br/>      instance_type = string<br/>      ebs = object({<br/>        volume_size           = number<br/>        delete_on_termination = bool<br/>      })<br/>    })<br/>    asg = object({<br/>      max_size                  = number<br/>      min_size                  = number<br/>      desired_capacity          = number<br/>      health_check_grace_period = number<br/>      health_check_type         = string<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | The algorithm to use for the key pair. | `string` | `"RSA"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project. | `string` | `"nsse"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources will be created | `string` | `"us-east-1"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group. | `string` | `"allow_ssh"` | no |
| <a name="input_ssh_allowed_cidr"></a> [ssh\_allowed\_cidr](#input\_ssh\_allowed\_cidr) | The CIDR block allowed to reach the instances via SSH (e.g. "203.0.113.10/32" for a single IP). | `string` | n/a | yes |
| <a name="input_worker_nodes"></a> [worker\_nodes](#input\_worker\_nodes) | Launch template configuration settings. | <pre>object({<br/>    name = optional(string, "worker-nodes")<br/>    launch_template = object({<br/>      instance_type = string<br/>      ebs = object({<br/>        volume_size           = number<br/>        delete_on_termination = bool<br/>      })<br/>    })<br/>    asg = object({<br/>      max_size                  = number<br/>      min_size                  = number<br/>      desired_capacity          = number<br/>      health_check_grace_period = number<br/>      health_check_type         = string<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
