terraform {
  backend "s3" {
    key     = "kinn/terraform.tfstate"
    bucket = "a3k-sysops"
    region = "us-east-1"
    workspace_key_prefix = "anthony-terraform-test"
  }
}
