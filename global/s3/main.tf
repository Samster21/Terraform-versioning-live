provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_state_bucket" {
  bucket = "terraform-state-bucket-akira"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.my_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "mysse" {
  bucket = aws_s3_bucket.my_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.my_state_bucket.id
  ignore_public_acls = true
  block_public_acls = true
  block_public_policy = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_DB" {
  name = "terra_db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-akira"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terra_db"
  }
}