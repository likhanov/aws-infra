terraform {
  backend "s3" {
    bucket         = "mediterraneum-infra-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "mediterraneum-infra-terraform-lock-id"
    encrypt        = true
  }
}
