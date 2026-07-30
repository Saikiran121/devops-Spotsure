terraform {
  backend "s3" {
    bucket         = "saikiran-spotsure"
    key            = "chatapp/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
