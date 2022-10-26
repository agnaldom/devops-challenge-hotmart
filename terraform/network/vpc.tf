data "aws_availability_zones" "available" {}

resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy

  tags = merge(
    {
      "Name" = var.vpc_name
    },
    var.tags,
    var.vpc_tags,
    var.eks_network_tags
  )
}

###
# Internet Gateway
# ----------------
# We only create this if we actually have public subnets
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.main_vpc.id
  tags = merge(
    {
      "Name" = "${var.environment}-igw"
    },
    var.tags,
  )
}



###
# Elastic IP(s) for NAT Gateway(s) 
# --------------------------------
# See NAT Gateway(s) for the logic on enable_igw
###
resource "aws_eip" "elastic_ip" {
  count = length(var.private_subnet_cidrs)

  vpc = true
  tags = merge(
    {
      "Name" = "${var.environment}-natgw-elasticIP-${count.index + 1}"
    },
    var.tags,
  )
}

###
# NAT Gateway(s)
# --------------
resource "aws_nat_gateway" "nat_gw" {
  count = 1

  allocation_id = element(aws_eip.elastic_ip.*.id, count.index)
  #allocation_id = aws_eip.elastic_ip.id
  subnet_id = element(aws_subnet.public_subnets.*.id, count.index)
  tags = merge(
    {
      "Name" = "${var.environment}-natgw-${count.index + 1}"
    },
    var.tags,
  )
  depends_on = [aws_internet_gateway.this]
}
