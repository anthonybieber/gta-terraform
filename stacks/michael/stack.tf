resource "aws_sqs_queue" "terraform_queue" {
  name = "michael-sqs-${var.env}"
  tags = var.tags
}