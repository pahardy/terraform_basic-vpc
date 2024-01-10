module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>5.0.0"

  #VPC basic details
  name = "my-terraform-vpc"
  cidr = var.cidr_block
  azs                 = var.vpc_availability_zones
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets

  #Database subnets
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = var.vpc_db_subnets

  #NAT Gateway for private subnets' outbound communication
  enable_nat_gateway = true
  single_nat_gateway = true

  #VPC DNS parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner = "patrick"
  }

  vpc_tags = {
    Name = "basic-terraform-vpc"
  }
  #Give instances launched into the public subnet a public IP
  map_public_ip_on_launch = true
}
