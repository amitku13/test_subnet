resource "aws_subnet" "public" {
  count                  = 2
  vpc_id                 = var.vpc_id
  cidr_block             = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone      = element(var.availability_zones, count.index)
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count                  = 2
  vpc_id                 = var.vpc_id
  cidr_block             = element(var.private_subnet_cidrs, count.index)
  availability_zone      = element(var.availability_zones, count.index)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
