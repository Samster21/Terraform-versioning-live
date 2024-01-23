variable "user_list" {
  type = list(string)
  default = [ "Isaac", "Mugesh", "Darshini", "Shivani" , "Dinesh"]
}

variable "AWS_CC" {
  type = map(string)
  default = {
    "Isaac" = "Serverless Architect"
    "Rajasekar" = "Serverless Co-ordinator"
    "Raghul G" = "Cloud Club Captain"
    "Shaline" = "Overall Co-ordinator"
    "Jensen" = "Overall Co-ordinator"
    "Linus" = "Technical Co-ordinator and Solutions Specialist"
  }
}