

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  subnet_id     = var.subnet_id
  tags = {
    Name        = "${var.environment}-ec2-instance"
    Environment = var.environment
  }
}