# terraform {
#   backend "s3" {
#     bucket = "terraform-state-bucket-akira"
#     key = "live/prod/services/webserver-cluster/terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
#     dynamodb_table = "Prod-ASG-DDB-table"
#   }
# }