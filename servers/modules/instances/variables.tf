variable "name_prefix" {
  description = "The prefix name of the resources."
  type        = string
}

variable "name" {
  description = "The name of the resources."
  type        = string
}

variable "launch_template" {
  description = "Launch template configuration settings."
  type = object({
    key_name               = string
    image_id               = string
    instance_type          = string
    vpc_security_group_ids = list(string)
    user_data              = string
    ebs = object({
      volume_size           = number
      delete_on_termination = bool
    })
    iam_instance_profile = object({
      name = string
    })
  })
}

variable "asg" {
  description = "Auto Scaling Group configuration settings."
  type = object({
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    health_check_grace_period = number
    health_check_type         = string
    vpc_zone_identifier       = list(string)
    tags                      = map(string)
  })
}
