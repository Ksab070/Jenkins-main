locals {
  region     = "us-east-1"
  access_key = "AKIAXYKJUF3N5UJLK7C6"
  secret_key = "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"
  aws_tags = {
    "Terraform"   = "True"
    "Purpose"     = "Jenkins-infra"
    "Environment" = "Dev"
  }
}
