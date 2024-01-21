provider "aws" {
  region = "us-east-1"
}

module "mysql" {
  source = "git@github.com:Samster21/Terraform-versioning-modules.git//data-stores/mysql?ref=v0.0.2"
  rds_name = "Staging"
  rds_dynamo_table = "Stage-RDS-Dynamo-Table"
  db_username = "akira"
  db_password = "Thorfinn"
}

output "dynamodb_table_name" {
  value = module.mysql.dynamodb_table_name
}

output "DDB_address" {
  value = module.mysql.DDB_address
}

output "DDB_port" {
  value = module.mysql.DDB_port
}