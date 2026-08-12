# not-so-simple-ecommerce-iac

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./modules/servers | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/networking | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | `"nsse"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources will be created | `string` | `"us-east-1"` | no |
| <a name="input_ssh_allowed_cidr"></a> [ssh\_allowed\_cidr](#input\_ssh\_allowed\_cidr) | The CIDR block allowed to reach the instances via SSH (e.g. "203.0.113.10/32" for a single IP) | `string` | n/a | yes |
| <a name="input_subnet_azs"></a> [subnet\_azs](#input\_subnet\_azs) | The availability zones where the subnets will be created | `set(string)` | <pre>[<br/>  "us-east-1a",<br/>  "us-east-1b"<br/>]</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block for the VPC | `string` | `"10.0.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
