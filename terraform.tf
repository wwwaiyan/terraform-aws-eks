terraform {
  backend "s3" {
    bucket = "terracode"
    key    = "terraform-aws-eks/terraform.tfstate"
    region = "us-east-1"
  }
}
