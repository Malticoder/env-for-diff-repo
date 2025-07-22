terraform {
  backend "s3" {
    bucket         = "krishna-bucket-for-backend"
    key            = "statefile/dev/terraform.tfstate"
    region         = "us-east-1"
  }
}
