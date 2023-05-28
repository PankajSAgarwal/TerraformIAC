# -------- networking/main.tf--------------
resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "aws_vpc" "pankaj_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "pankaj-vpc-${random_integer.random.id}"
  }
}

resource "aws_subnet" "pankaj_public_subnet" {
  vpc_id = aws_vpc.pankaj_vpc.id
  count = length(var.public_cidrs)
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = ["us-west-2a","us-west-2b","us-west-2c","us-west-2d"][count.index]
  tags = {
    Name = "pankaj_public_${count.index + 1}"
  }
}
