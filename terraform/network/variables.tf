variable "aws_region" {
  description = "Região em que os recursos serão criados"
  type        = string
}

variable "aws_profile" {
  description = "Qual profile vai rodar o terraform"
  type        = string
}

# -------------------------------------------------------------
# Network variables
# -------------------------------------------------------------

variable "environment" {
  description = "Name of the environment (terraform.workspace or static environment name for vpcs not managed with a workspace)"
  type        = string
}

## VPC ##
variable "vpc_cidr" {
  description = "The CIDR range for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "True if the DNS support is enabled in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "True if DNS hostnames is enabled in the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "The type of tenancy for EC2 instances launched into the VPC"
  type        = string
  default     = "default"
}
variable "vpc_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "azs" {
  description = "A list of Availability Zones to use in a specific Region"
  type        = list(string)
}

## Subnet Public ##
variable "public_subnet_cidrs" {
  description = "A list of the CIDR ranges to use for public subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "A list of the CIDR ranges to use for private subnets"
  type        = list(string)
  default     = []
}


# -------------------------------------------------------------
# Tagging
# -------------------------------------------------------------

variable "vpc_tags" {
  description = "A map of tags for the VPC resources"
  type        = map(string)
}
variable "tags" {
  description = "A map of tags for the VPC resources"
  type        = map(string)
  default     = {}
}

variable "eks_network_tags" {
  description = "A map of tags needed by EKS to identify the VPC and subnets"
  type        = map(string)
  default     = {}
}

variable "eks_private_subnet_tags" {
  description = "A map of tags needed by EKS to identify private subnets for internal LBs"
  type        = map(string)
  default     = {}
}

variable "eks_public_subnet_tags" {
  description = "A map of tags needed by EKS to identify public subnets for internet-facing LBs"
  type        = map(string)
  default     = {}
}
