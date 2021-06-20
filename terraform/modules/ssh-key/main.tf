# resource "aws_key_pair" "key_pair" {
#   key_name   = "${var.environment}-key"
#   public_key ="${file("C:/Users/sagar/.ssh/id_rsa.pub")}"
  
#  }

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
  filename          = "${var.environment}-key.pem"
  sensitive_content = tls_private_key.key.private_key_pem
  file_permission   = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.environment}-key"
  public_key = tls_private_key.key.public_key_openssh
}