resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "main_key" {
  key_name   = var.key_name
  public_key = tls_private_key.key_pair.public_key_openssh
}
