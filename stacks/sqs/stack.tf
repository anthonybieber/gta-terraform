resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sqs-stuff-${var.env}"
  tags = var.tags
}