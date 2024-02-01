##################PROVIDER###########################
provider "aws" {
  region = "ap-south-1"
}

#############S3 STATE BUCKET###########################
resource "aws_s3_bucket" "mybucket" {
  bucket = "kpi-non-prod-terraform-state-storage-s3"
  versioning {
      enabled = true
  }
  server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
  }
}

#############DYNAMODB TABLE###########################
resource "aws_dynamodb_table" "state-lock" {
    name           = "kpi-non-prod-terraform-state-lock-dynamodb"
    billing_mode = "PAY_PER_REQUEST"
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}    