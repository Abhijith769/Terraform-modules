##################PROVIDER###########################
provider "aws" {
  region = "ap-south-1"
}

###################STATE###########################
# terraform {
#  backend "s3" {
#  encrypt        = true
#  bucket         = "non-prod-terraform-state-storage-s3"
#  dynamodb_table = "non-prod-terraform-state-lock-dynamodb"
#  region         = "ap-south-1"
#  key            = "statefile/terraform.tfstate"
#  }
# }
