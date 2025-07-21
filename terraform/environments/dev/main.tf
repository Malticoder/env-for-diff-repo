
variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "environment" {
  type = string
}

module "web_sg" {
  source      = "../../modules/security_group"
  vpc_id      = var.vpc_id
  environment = var.environment

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
  source             = "../../modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  security_group_ids = [module.web_sg.security_group_id]
  subnet_id          = var.subnet_id
  environment        = var.environment
}


locals {
  environment = "dev"
  ami_id = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  vpc_id = "vpc-0affcc89643f1e634"
  subnet_id = "subnet-098e8c22744310155"
}
