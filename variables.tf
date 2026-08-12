variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "nsse"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"

}

variable "subnet_azs" {
  description = "The availability zones where the subnets will be created"
  type        = set(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ssh_allowed_cidr" {
  description = "The CIDR block allowed to reach the instances via SSH (e.g. \"203.0.113.10/32\" for a single IP)"
  type        = string
}
