##################PROVIDER###########################
provider "aws" {
  region = "ap-south-1"
}

###################STATE###########################
# terraform {
#  backend "s3" {
#  encrypt        = true
#  bucket         = "kpi-non-prod-terraform-state-storage-s3"
#  dynamodb_table = "kpi-non-prod-terraform-state-lock-dynamodb"
#  region         = "ap-south-1"
#  key            = "statefile/terraform.tfstate"
#  }
# }