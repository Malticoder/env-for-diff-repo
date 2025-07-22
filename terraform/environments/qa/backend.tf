terraform {
  backend "s3" {
    bucket         = "krishna-bucket-for-backend"
    key            = "statefile/qa/terraform.tfstate"
    region         = "us-east-1"
  }
}
