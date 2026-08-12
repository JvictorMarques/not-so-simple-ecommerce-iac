output "private_key" {
  sensitive = true
  value     = module.ec2.private_key
}
