data "aws_vpc" "this" {
  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  tags = {
    Kind = "private"
  }
}
