module "vpc" {
  source   = "../../modules/aws/networking/vpc"
  name     = "portfolio-vpc"
  vpc_cidr = "10.10.0.0/16"
}

# Add subnet, security group, and EC2 module calls here.
