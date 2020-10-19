resource "aws_sqs_queue" "terraform_queue" {
  name = "chaim-sqs-${var.env}"
  tags = var.tags
}