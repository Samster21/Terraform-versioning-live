# provider "aws" {
#   region = "us-east-1"
# }

# module "webserver-cluster" {
#   source = "/home/akira/DevOps-2/modules/services/webserver-cluster"
#   asg_name = "Suji-ASG"
#   asg_db_name = "Suji-DDB-table"
#   bucket_data = ["terraform-state-bucket-akira","prod/services/webserver-cluster/terraform.tfstate"]
#   rds_db_remote = ["terraform-state-bucket-akira","prod/data-stores/mysql/terraform.tfstate"]
# }

# output "DNS_name" {
#   value = module.webserver-cluster.DNS_name
# }

# resource "aws_security_group_rule" "allow_testing_inbound" {
#   type              = "ingress"
#   security_group_id = module.webserver-cluster.security_group_id

#   from_port   = 12345
#   to_port     = 12345
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
# }