provider "aws" {
  region = "us-east-1"
}

module "webserver-cluster" {
  source = "git@github.com:Samster21/Terraform-versioning-modules.git//services/webserver-cluster?ref=v0.0.1"
  asg_name = "Prod-ASG"
  asg_db_name = "Prod-ASG-DDB-table"
  bucket_data = ["terraform-state-bucket-akira","live/prod/services/webserver-cluster/terraform.tfstate"]
  rds_db_remote = ["terraform-state-bucket-akira","live/prod/data-stores/mysql/terraform.tfstate"]
}

output "DNS_name" {
  value = module.webserver-cluster.DNS_name
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver-cluster.security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}