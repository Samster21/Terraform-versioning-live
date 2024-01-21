output "s3-bucket-arn" {
  value = aws_s3_bucket.my_state_bucket.arn
  description = "ARN of Terraform bucket"
}

output "dynamodb-table-name" {
  value = aws_dynamodb_table.terraform_DB.name
  description = "Terraform DDB's name"
}