provider "aws" {
  region  =  var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-adam-canterill"
    key    = "web_app/terraform.tfstate"
    region = "us-east-1"
    required_version = ">= 1.5.0"
  }
}
