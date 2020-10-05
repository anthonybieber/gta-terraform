resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sqqqs-${var.env}"
  tags = var.tags
}