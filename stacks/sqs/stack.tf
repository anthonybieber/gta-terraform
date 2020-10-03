resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sqs-${var.env}"
  tags = var.tags
}