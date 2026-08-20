# servers

<!-- BEGIN_TF_DOCS -->
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
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_ssm_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_association) | resource |
| [aws_ssm_patch_baseline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_baseline) | resource |
| [aws_ssm_patch_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_patch_group) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.instance_profile_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.logs_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_control_plane"></a> [control\_plane](#input\_control\_plane) | Launch template configuration settings. | <pre>object({<br/>    name = optional(string, "control-plane")<br/>    launch_template = object({<br/>      instance_type = string<br/>      ebs = object({<br/>        volume_size           = number<br/>        delete_on_termination = bool<br/>      })<br/>    })<br/>    asg = object({<br/>      max_size                  = number<br/>      min_size                  = number<br/>      desired_capacity          = number<br/>      health_check_grace_period = number<br/>      health_check_type         = string<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_document"></a> [document](#input\_document) | The name of the patch group. | <pre>object({<br/>    schedule_expression = string<br/>    max_concurrency     = string<br/>    max_errors          = string<br/>    parameters = object({<br/>      Operation    = string<br/>      RebootOption = string<br/>    })<br/>  })</pre> | <pre>{<br/>  "max_concurrency": "1",<br/>  "max_errors": "0",<br/>  "parameters": {<br/>    "Operation": "Install",<br/>    "RebootOption": "RebootIfNeeded"<br/>  },<br/>  "schedule_expression": "cron(*/30 * * * ? *)"<br/>}</pre> | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | The algorithm to use for the key pair. | `string` | `"RSA"` | no |
| <a name="input_logs_bucket_name"></a> [logs\_bucket\_name](#input\_logs\_bucket\_name) | The name of the S3 bucket for logs. | `string` | `"documents-logs-bucket"` | no |
| <a name="input_patch_baseline"></a> [patch\_baseline](#input\_patch\_baseline) | Patch baseline configuration settings. | <pre>list(object({<br/>    approval_rule = object({<br/>      approve_after_days = number<br/>      compliance_level   = string<br/>      patch_filter = list(object({<br/>        key    = string<br/>        values = list(string)<br/>      }))<br/>    })<br/>  }))</pre> | n/a | yes |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | List of policy ARNs to attach to the IAM role for the instance profile. | `list(string)` | <pre>[<br/>  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"<br/>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project. | `string` | `"nsse"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources will be created | `string` | `"us-east-1"` | no |
| <a name="input_worker_nodes"></a> [worker\_nodes](#input\_worker\_nodes) | Launch template configuration settings. | <pre>object({<br/>    name = optional(string, "worker-nodes")<br/>    launch_template = object({<br/>      instance_type = string<br/>      ebs = object({<br/>        volume_size           = number<br/>        delete_on_termination = bool<br/>      })<br/>    })<br/>    asg = object({<br/>      max_size                  = number<br/>      min_size                  = number<br/>      desired_capacity          = number<br/>      health_check_grace_period = number<br/>      health_check_type         = string<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
<!-- END_TF_DOCS -->
