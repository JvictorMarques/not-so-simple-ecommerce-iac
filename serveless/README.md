# serveless

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_proxy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_proxy) | resource |
| [aws_db_proxy_default_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_proxy_default_target_group) | resource |
| [aws_db_proxy_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_proxy_endpoint) | resource |
| [aws_db_proxy_target.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_proxy_target) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_iam_role.rds_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.rds_proxy_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sqs_queue.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.standard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.standard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_redrive_allow_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |
| [aws_sqs_queue_redrive_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_policy) | resource |
| [aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.control_plane](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_iam_policy_document.rds_cluster_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.rds_proxy_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_security_group.control_plane](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_security_group.worker_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The AWS account ID | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | The name of the RDS DB subnet group | `string` | `"nsse"` | no |
| <a name="input_order_topic"></a> [order\_topic](#input\_order\_topic) | The configuration for the SNS topic for order confirmation notifications | <pre>object({<br/>    name          = string<br/>    subscriptions = list(string)<br/>  })</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | `"nsse"` | no |
| <a name="input_queue"></a> [queue](#input\_queue) | The configuration for the SQS queue | <pre>list(object({<br/>    name                      = string<br/>    delay_seconds             = number<br/>    max_message_size          = number<br/>    message_retention_seconds = number<br/>    receive_wait_time_seconds = number<br/>  }))</pre> | <pre>[<br/>  {<br/>    "delay_seconds": 0,<br/>    "max_message_size": 2048,<br/>    "message_retention_seconds": 86400,<br/>    "name": "EmailNotificationQueue",<br/>    "receive_wait_time_seconds": 10<br/>  },<br/>  {<br/>    "delay_seconds": 0,<br/>    "max_message_size": 2048,<br/>    "message_retention_seconds": 86400,<br/>    "name": "ProductStockQueue",<br/>    "receive_wait_time_seconds": 10<br/>  },<br/>  {<br/>    "delay_seconds": 0,<br/>    "max_message_size": 2048,<br/>    "message_retention_seconds": 86400,<br/>    "name": "InvoiceQueue",<br/>    "receive_wait_time_seconds": 10<br/>  }<br/>]</pre> | no |
| <a name="input_rds_cluster"></a> [rds\_cluster](#input\_rds\_cluster) | The configuration for the RDS Aurora Serverless cluster | <pre>object({<br/>    cluster_identifier          = string<br/>    engine                      = string<br/>    engine_mode                 = string<br/>    database_name               = string<br/>    master_username             = string<br/>    manage_master_user_password = bool<br/>    storage_encrypted           = bool<br/>    final_snapshot_identifier   = string<br/>    availability_zones          = list(string)<br/>    deletion_protection         = bool<br/>    serverlessv2_scaling_configuration = object({<br/>      min_capacity = number<br/>      max_capacity = number<br/>    })<br/>    instances = list(object({<br/>      instance_class    = string<br/>      availability_zone = string<br/>      identifier        = string<br/>    }))<br/>  })</pre> | <pre>{<br/>  "availability_zones": [<br/>    "us-east-1a",<br/>    "us-east-1b"<br/>  ],<br/>  "cluster_identifier": "nsse-aurora-serverless-cluster",<br/>  "database_name": "notSoSimpleEcommerce",<br/>  "deletion_protection": false,<br/>  "engine": "aurora-postgresql",<br/>  "engine_mode": "provisioned",<br/>  "final_snapshot_identifier": "nsse-aurora-serverless-cluster-final-snapshot",<br/>  "instances": [<br/>    {<br/>      "availability_zone": "us-east-1a",<br/>      "identifier": "nsse-aurora-serverless-cluster-instance-1a",<br/>      "instance_class": "db.serverless"<br/>    },<br/>    {<br/>      "availability_zone": "us-east-1b",<br/>      "identifier": "nsse-aurora-serverless-cluster-instance-1b",<br/>      "instance_class": "db.serverless"<br/>    }<br/>  ],<br/>  "manage_master_user_password": true,<br/>  "master_username": "nsseAdmin",<br/>  "serverlessv2_scaling_configuration": {<br/>    "max_capacity": 1,<br/>    "min_capacity": 0.5<br/>  },<br/>  "storage_encrypted": true<br/>}</pre> | no |
| <a name="input_rds_proxy"></a> [rds\_proxy](#input\_rds\_proxy) | The configuration for the RDS Proxy | <pre>object({<br/>    name          = string<br/>    debug_logging = bool<br/>    engine_family = string<br/>    role_name     = string<br/>  })</pre> | <pre>{<br/>  "debug_logging": false,<br/>  "engine_family": "POSTGRESQL",<br/>  "name": "nsse-db-proxy",<br/>  "role_name": "nsse-rds-proxy-role"<br/>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy resources in | `string` | `"us-east-1"` | no |
| <a name="input_s3_application_bucket"></a> [s3\_application\_bucket](#input\_s3\_application\_bucket) | The policy to attach to the SQS queue role | <pre>object({<br/>    name = string<br/>  })</pre> | <pre>{<br/>  "name": "nsse-application-bucket"<br/>}</pre> | no |
| <a name="input_security_groups_names"></a> [security\_groups\_names](#input\_security\_groups\_names) | Name of the RDS security group | <pre>object({<br/>    rds           = string<br/>    control_plane = string<br/>    worker_nodes  = string<br/>  })</pre> | <pre>{<br/>  "control_plane": "nsse-default-control-plane-security-group",<br/>  "rds": "nsse-production-rds-security-group",<br/>  "worker_nodes": "nsse-default-worker-nodes-security-group"<br/>}</pre> | no |
| <a name="input_sns_role_policy"></a> [sns\_role\_policy](#input\_sns\_role\_policy) | The policy to attach to the SNS topic role | `string` | `"arn:aws:iam::aws:policy/service-role/AmazonSNSRole"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
