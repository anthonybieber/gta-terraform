resource "aws_sqs_queue" "terraform_queue" {
  name = "test-fabio-sqs-${var.env}"
  tags = var.tags
}