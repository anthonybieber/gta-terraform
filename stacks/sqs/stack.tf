resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-sql-${var.env}"
  tags = var.tags
}