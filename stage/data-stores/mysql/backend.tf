terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-akira"
    key = "live/stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Prod-RDS-Dynamo-Table"
    encrypt = true
  }
}
