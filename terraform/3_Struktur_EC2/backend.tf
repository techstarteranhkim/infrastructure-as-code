terraform {
  backend "s3" {
    bucket = "terraform-bucket-anh"
    key    = "ec2-example/terraform.tfstate"
    region = "eu-central-1"
  }
}
