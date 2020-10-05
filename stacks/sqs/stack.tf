resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-s-${var.env}"
  tags = var.tags
}