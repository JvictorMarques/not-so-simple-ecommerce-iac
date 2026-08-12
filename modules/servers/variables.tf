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

variable "launch_template" {
  description = "Launch template configuration settings."
  type = object({
    instance_type = string
    ebs = object({
      volume_size           = number
      delete_on_termination = bool
    })
  })
  default = {
    instance_type = "t3.micro"
    ebs = {
      volume_size           = 20
      delete_on_termination = true
    }
  }
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group."
  type        = list(string)
}

variable "asg" {
  description = "Auto Scaling Group configuration settings."
  type = object({
    max_size                  = optional(number, 5)
    min_size                  = optional(number, 2)
    desired_capacity          = optional(number, 4)
    health_check_grace_period = optional(number, 180)
    health_check_type         = optional(string, "EC2")
    tags                      = map(string)
  })
}
