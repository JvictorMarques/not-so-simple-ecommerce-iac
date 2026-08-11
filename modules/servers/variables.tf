variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "key_algorithm" {
  description = "The algorithm to use for the key pair."
  type        = string
  default     = "RSA"
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group."
  type        = string
  default     = "allow_ssh"
}

variable "ssh_allowed_cidr" {
  description = "The CIDR block allowed to reach the instances via SSH (e.g. \"203.0.113.10/32\" for a single IP)."
  type        = string
}