resource "aws_instance" "G1-public" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.network.public-G1.id
  security_groups = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.key_pair.key_name

   provisioner "file" {
  source      = "id_rsa"
  destination = "/home/ec2-user/.ssh/id_rsa"
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = tls_private_key.private_ec2_key.private_key_pem
    host     = self.public_ip
  }
}


  tags = {
    Name = "G1-public"
  }
}

resource "null_resource" "print_ip" {

  provisioner "local-exec" {
    command = "echo ${aws_instance.G1-public.public_ip} > inventory"
    
  }
  
}

# ami           = "ami-03a6eaae9938c858c"

resource "aws_instance" "G1-private" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id = module.network.private-G1.id
  security_groups = [aws_security_group.allow_ssh_3k.id]
  key_name = aws_key_pair.key_pair.key_name

    tags = {
        Name = "G1-private"
    }
}