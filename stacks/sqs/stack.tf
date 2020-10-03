resource "aws_sqs_queue" "terraform_queue" {
  name = "anthony-ss-${var.env}"
  tags = var.tags
}