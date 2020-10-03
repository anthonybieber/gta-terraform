terraform {
  backend "s3" {
    key     = "elasticache/terraform.tfstate"
    bucket = "a3k-sysops"
    region = "us-east-1"
    workspace_key_prefix = "anthony-terraform-test"
  }
}