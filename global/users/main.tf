provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_user" "demo" {
  for_each = toset(var.user_list)
  name = each.value
}

output "all_users" {
  value = values(aws_iam_user.demo)[*].arn
}

# output "AWS" {
#   value = [for name, role in var.AWS_CC : "${name} serves as ${role} in AWS CC SJIT"]
# }

output "AWS" {
  value = "%{for name in var.AWS_CC} ${name}, %{endfor}"
}