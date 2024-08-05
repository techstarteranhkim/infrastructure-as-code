provider "aws" {
  region = "eu-central-1" 
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0e872aee57663ae2d" 
  instance_type = "t2.micro"
  count         = 3 
}
