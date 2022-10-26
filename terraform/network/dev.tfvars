aws_profile = "default"
aws_region  = "us-east-1"

## VPC ##
vpc_cidr = "10.0.0.0/16"
vpc_name = "deconve-vpc"

project_name = "deconve-cluster-eks"

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
## Subnet Public ##
public_subnet_cidrs = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]

## Subnet Private ##
private_subnet_cidrs = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]

environment = "dev"
###### tags #######
tags = {
  company     = "deconv"
  board       = "ti"
  environment = "dev"
  system      = "network"
  terraform   = "true"
}
vpc_tags = {
  Name        = "deconve-vpc"
  application = "vpc"
}

eks_public_subnet_tags = {
  "kubernetes.io/cluster/deconve-eks" = "shared"
  "kubernetes.io/role/elb"            = 1
}

eks_private_subnet_tags = {
  "kubernetes.io/cluster/deconve-eks" = "shared"
  "kubernetes.io/role/internal-elb"   = 1
}
