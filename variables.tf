# Input Variables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ca-central-1"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  description = "VPC AZs"
  type = list(string)
  default = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}

variable "vpc_public_subnets" {
  description = "VPC public subnets"
  type = list(string)
  default = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
}

variable "vpc_private_subnets" {
  description = "VPC private subnets"
  type = list(string)
  default = ["10.0.48.0/20", "10.0.64.0/20", "10.0.80.0/20"]
}

variable "vpc_db_subnets" {
  description = "VPC DB subnets"
  type = list(string)
  default = ["10.0.96.0/20", "10.0.112.0/20", "10.128.0.0/20"]
}