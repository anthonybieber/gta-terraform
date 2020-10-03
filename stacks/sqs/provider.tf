variable "workspace_iam_roles" {
  default = {
    qa      = ""
    hotfix  = ""
    prod    = "arn:aws:iam::081685684219:role/CrossAccountAdmin"
    load    = "arn:aws:iam::314906392532:role/CrossAccountAdmin"
  }
}

provider "aws" {
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  version = "~> 3.3"
  region = "us-east-1"
}