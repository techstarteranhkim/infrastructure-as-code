provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token
  region     = var.aws_region
}

resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0e872aee57663ae2d"
  instance_type = "t2.micro"
  count         = 3

  vpc_security_group_ids = [aws_security_group.my_sg.id]

  key_name = "ansible"

  tags = {
    Name = "my-instance-${count.index}"
  }
}

resource "local_file" "inventory" {
  filename = "${path.module}/inventory.ini"
  content  = <<EOF
[all]
${join("\n", formatlist("%s ansible_host=%s ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/ansible.pem", aws_instance.my_instance.*.tags.Name, aws_instance.my_instance.*.public_ip))}
EOF
}