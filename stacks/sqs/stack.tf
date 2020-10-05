resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sq-${var.env}"
  tags = var.tags
}