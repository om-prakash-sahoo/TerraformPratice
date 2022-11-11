provider "aws" {
    region = "us-east-2"
}

module "s1" {
    source = "/home/ec2-user/environment/terraform/aws/child_module"
    name = "Om-module-server1"
    hw = "t2.micro"
    bucket_name = "Om-bucket1"
}

module "abc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "Om-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
