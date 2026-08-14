variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "nsse"
}

variable "key_algorithm" {
  description = "The algorithm to use for the key pair."
  type        = string
  default     = "RSA"
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the IAM role for the instance profile."
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

variable "control_plane" {
  description = "Launch template configuration settings."
  type = object({
    name = optional(string, "control-plane")
    launch_template = object({
      instance_type = string
      ebs = object({
        volume_size           = number
        delete_on_termination = bool
      })
    })
    asg = object({
      max_size                  = number
      min_size                  = number
      desired_capacity          = number
      health_check_grace_period = number
      health_check_type         = string
    })
  })
}

variable "worker_nodes" {
  description = "Launch template configuration settings."
  type = object({
    name = optional(string, "worker-nodes")
    launch_template = object({
      instance_type = string
      ebs = object({
        volume_size           = number
        delete_on_termination = bool
      })
    })
    asg = object({
      max_size                  = number
      min_size                  = number
      desired_capacity          = number
      health_check_grace_period = number
      health_check_type         = string
    })
  })
}
