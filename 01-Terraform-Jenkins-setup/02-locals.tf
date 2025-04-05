locals {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
  aws_tags = {
    "Terraform"   = "True"
    "Purpose"     = "Jenkins-infra"
    "Environment" = "Dev"
  }
}
