# Dies ist ein Kommentar

# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}

# Eine Ubuntu EC2 Instanz im kleinen t2.nano-Format
resource "aws_instance" "erste_instanz" {
  instance_type = "t2.nano"
  ami = "ami-01e444924a2233b07"
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
}
