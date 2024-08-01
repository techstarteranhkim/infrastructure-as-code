provider "aws" {
  region = "eu-central-1"
}

# Erstelle eine VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}
