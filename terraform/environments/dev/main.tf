locals {
  environment = "dev"
  ami_id = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  vpc_id = "vpc-0affcc89643f1e634"
  subnet_id = "subnet-098e8c22744310155"
}
provider "aws" {
    region = "us-east-1"
  
}


terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
module "web_sg" {
  source = "../../modules/security_group"

  vpc_id = local.vpc_id
  environment = local.environment
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "web_ec2" {
  source = "../../modules/ec2"

  ami_id           = local.ami_id
  instance_type    = local.instance_type
  security_group_ids = [module.web_sg.security_group_id]
  subnet_id        = local.subnet_id
  environment      = local.environment
}
