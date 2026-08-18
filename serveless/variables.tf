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
  default = {
    name          = "OrderConfirmedTopic"
    subscriptions = []
  }
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