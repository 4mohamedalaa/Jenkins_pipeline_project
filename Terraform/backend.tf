terraform {
  backend "s3" {
    bucket         = "targetbucket-batanouny"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend"
  }
}
