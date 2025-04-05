locals {
  region     = "us-east-1"
  access_key = "AKIATCKAO6IJUORUQKV4"
  secret_key = "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"
  aws_tags = {
    "Terraform"   = "True"
    "Purpose"     = "Jenkins-infra"
    "Environment" = "Dev"
  }
}
