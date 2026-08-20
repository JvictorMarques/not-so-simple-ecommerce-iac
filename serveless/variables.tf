variable "account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "nsse"
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "queue" {
  description = "The configuration for the SQS queue"
  type = list(object({
    name                      = string
    delay_seconds             = number
    max_message_size          = number
    message_retention_seconds = number
    receive_wait_time_seconds = number
  }))
  default = [{
    name                      = "EmailNotificationQueue"
    delay_seconds             = 0
    max_message_size          = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    },
    {
      name                      = "ProductStockQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
    },
    {
      name                      = "InvoiceQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
  }]
}

variable "order_topic" {
  description = "The configuration for the SNS topic for order confirmation notifications"
  type = object({
    name          = string
    subscriptions = list(string)
  })
}

variable "sns_role_policy" {
  description = "The policy to attach to the SNS topic role"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonSNSRole"
}

variable "s3_application_bucket" {
  description = "The policy to attach to the SQS queue role"
  type = object({
    name = string
  })
  default = {
    name = "nsse-application-bucket"
  }
}

variable "rds_cluster" {
  description = "The configuration for the RDS Aurora Serverless cluster"
  type = object({
    cluster_identifier          = string
    engine                      = string
    engine_mode                 = string
    database_name               = string
    master_username             = string
    manage_master_user_password = bool
    storage_encrypted           = bool
    final_snapshot_identifier   = string
    availability_zones          = list(string)
    deletion_protection         = bool
    serverlessv2_scaling_configuration = object({
      min_capacity = number
      max_capacity = number
    })
    instances = list(object({
      instance_class    = string
      availability_zone = string
      identifier        = string
    }))
  })
  default = {
    cluster_identifier          = "nsse-aurora-serverless-cluster"
    engine                      = "aurora-postgresql"
    engine_mode                 = "provisioned"
    database_name               = "notSoSimpleEcommerce"
    master_username             = "nsseAdmin"
    manage_master_user_password = true
    storage_encrypted           = true
    final_snapshot_identifier   = "nsse-aurora-serverless-cluster-final-snapshot"
    availability_zones          = ["us-east-1a", "us-east-1b"]
    deletion_protection         = false
    serverlessv2_scaling_configuration = {
      min_capacity = 0.5
      max_capacity = 1
    }
    instances = [
      {
        instance_class    = "db.serverless"
        availability_zone = "us-east-1a"
        identifier        = "nsse-aurora-serverless-cluster-instance-1a"
      },
      {
        instance_class    = "db.serverless"
        availability_zone = "us-east-1b"
        identifier        = "nsse-aurora-serverless-cluster-instance-1b"
      }
    ]
  }
}

variable "security_groups_names" {
  description = "Name of the RDS security group"
  type = object({
    rds           = string
    control_plane = string
    worker_nodes  = string
  })
  default = {
    rds           = "nsse-production-rds-security-group"
    control_plane = "nsse-default-control-plane-security-group"
    worker_nodes  = "nsse-default-worker-nodes-security-group"
  }
}

variable "db_subnet_group_name" {
  description = "The name of the RDS DB subnet group"
  type        = string
  default     = "nsse"
}

variable "rds_proxy" {
  description = "The configuration for the RDS Proxy"
  type = object({
    name          = string
    debug_logging = bool
    engine_family = string
    role_name     = string
  })
  default = {
    name          = "nsse-db-proxy"
    debug_logging = false
    engine_family = "POSTGRESQL"
    role_name     = "nsse-rds-proxy-role"
  }
}
