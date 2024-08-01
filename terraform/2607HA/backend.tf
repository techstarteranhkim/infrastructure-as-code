resource "aws_s3_bucket" "my-terraform-state-bucket-anh" {
  bucket = "my-terraform-state-bucket-anh"
}

resource "aws_s3_bucket_public_access_block" "my-terraform-state-bucket-anh" {
  bucket                  = aws_s3_bucket.my-terraform-state-bucket-anh.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-anh"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
