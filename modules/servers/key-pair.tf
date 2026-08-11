resource "tls_private_key" "this" {
  algorithm = var.key_algorithm
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = var.project_name
  public_key = tls_private_key.this.public_key_openssh
}