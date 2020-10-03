resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-${var.env}"
  tags = var.tags
}