terraform {
  backend "s3" {
    bucket         = "krishna-bucket-for-backend"
    key            = "${var.environment}/terraform.tfstate"
    region         = "us-east-1"
  }
}
