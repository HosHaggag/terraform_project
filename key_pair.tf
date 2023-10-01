resource "tls_private_key" "private_ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "private_ec2_key_file" {
  content  = tls_private_key.private_ec2_key.private_key_pem
  filename = "id_rsa"
  file_permission = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "id_rsa"
  public_key = tls_private_key.private_ec2_key.public_key_openssh
}





