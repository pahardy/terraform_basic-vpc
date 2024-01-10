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
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}

variable "vpc_private_subnets" {
  description = "VPC private subnets"
  type = list(string)
  default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
}

variable "vpc_db_subnets" {
  description = "VPC DB subnets"
  type = list(string)
  default = [ "10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24" ]
}
