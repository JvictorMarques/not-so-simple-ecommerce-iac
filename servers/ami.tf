data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-13*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
