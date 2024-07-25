provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-01e444924a2233b07"
  instance_type = "t2.nano"

  # Instanz einen Name-Tag für AWS-Management-Konsole geben

  # Instanz mit Security-Group verknüpfen
}

# Security Group erstellen

# Instanz-IP ausgeben