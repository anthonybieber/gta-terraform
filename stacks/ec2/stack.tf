resource "aws_instance" "web" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = var.ec2_instance_size
  subnet_id = var.subnet_id

  tags = {
    Name = "anthony-test-again-${var.env}"
  }
}