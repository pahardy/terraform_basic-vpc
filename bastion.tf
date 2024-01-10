#Adding bastion host to VPC created in main branch

#Acquiring the keypair
data "aws_key_pair" "MyKeyPair" {
  key_name = "MyKeyPair"
}

#Creating the SecurityGroup that will be required to access the bastion host, using the
#Terraform AWS security group module
module "sg-allow-ssh" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "allow-ssh"
  description = "Allow SSH access to the bastion host"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = [ "0.0.0.0/0" ]
  ingress_rules = [ "ssh-22-tcp" ]
  egress_rules = [ "all-all"]
}


#Using the AWS Terraform module to create an instance that will be the bastion host
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "bastion-host"
  ami = "ami-0a2e7efb4257c0907"  #Ubuntu AMI
  key_name = data.aws_key_pair.MyKeyPair.key_name
  subnet_id = var.vpc_public_subnets[0]  #placing in the first subnet in the VPC
  vpc_security_group_ids = module.sg-allow-ssh.security_group_id
}
