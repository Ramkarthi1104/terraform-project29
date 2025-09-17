terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-987654"
    key            = "project29/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
