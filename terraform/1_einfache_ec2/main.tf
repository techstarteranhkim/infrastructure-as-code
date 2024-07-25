# Dies ist ein Kommentar

# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}

# Eine Ubuntu EC2 Instanz im kleinen t2.nano-Format
resource "aws_instance" "erste_instanz" {
  ami           = "ami-096b8af6e7e8fb927"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  tags = {
    Name = "Spekulatius"
  }
}

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow SSH traffic"
  
  # Inbound rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this to restrict the source IP range if needed
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP von überall (IPv4)
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTPS von überall (IPv4)
  }

  # Ausgehende Regel für HTTP (Port 80)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Alle Ziele erlauben (z. B. für Updates)
  }
}

output "public_ip" {
  value = aws_instance.erste_instanz.public_ip
}

output "security_group_name" {
  value = aws_security_group.ssh.name
}

output "security_group_rules_arn" {
  value = aws_security_group.ssh.arn
}
