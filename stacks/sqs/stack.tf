resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-example-${var.env}"
  tags = var.tags
}