terraform {
  backend "s3" {
    bucket = "rs-school-s3"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
 
provider "aws" {
  region = var.region
  profile = "rs-school-admin"
}
