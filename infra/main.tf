/*
  Indicates the terraform cloud provider: aws
*/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.14.9"
#  backend "s3" {
#    encrypt = false
#    bucket = "edgui-terraform-stage"
#    key = "tfstate/terraform.tfstate"
#    region  = "us-east-1"
#  }
  backend "local" {
    path = ".terraform/terraform.tfstate"
  }
}

/*
  Define the default region us east 1 - north virginia
*/
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
