resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sqqs-${var.env}"
  tags = var.tags
}