resource "aws_sqs_queue" "terraform_queue" {
  name = "test-anthony-sqs-${var.env}"
  tags = var.tags
}