resource "aws_subnet" "public" {
  count                   = length(var.subnet_azs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 3, count.index)
  availability_zone       = var.subnet_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.name_prefix}-public-${count.index + 1}${substr(var.subnet_azs[count.index], -1, 1)}"
    Kind = "public"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.subnet_azs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 3, count.index + length(var.subnet_azs))
  availability_zone       = var.subnet_azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.name_prefix}-private-${count.index + 1}${substr(var.subnet_azs[count.index], -1, 1)}"
    Kind = "private"
  }
}