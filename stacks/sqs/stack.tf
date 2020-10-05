resource "aws_sqs_queue" "terraform_queue" {
  name = "test-anthony-sql-${var.env}"
  tags = var.tags
}