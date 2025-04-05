locals {
  region     = "us-east-1"
  aws_tags = {
    "Terraform"   = "True"
    "Purpose"     = "Jenkins-infra"
    "Environment" = "Dev"
  }
}
