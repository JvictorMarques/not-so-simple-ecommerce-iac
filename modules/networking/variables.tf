variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_azs" {
  description = "The availability zones where the subnets will be created"
  type        = list(string)
}
