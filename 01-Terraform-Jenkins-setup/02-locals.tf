locals {
  region     = "us-east-1"
  access_key = "AKIATCKATS3SCOMXRLHH"
  secret_key = "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"
  aws_tags = {
    "Terraform"   = "True"
    "Purpose"     = "Jenkins-infra"
    "Environment" = "Dev"
  }
}
