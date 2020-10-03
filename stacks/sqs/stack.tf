resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sqs-ii-${var.env}"
  tags = var.tags
}