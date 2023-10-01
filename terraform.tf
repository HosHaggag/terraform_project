terraform {
  backend "s3" {
    bucket = "terraf0rm"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tfstate"
  }
}
