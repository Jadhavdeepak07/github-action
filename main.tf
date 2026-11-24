
provider "aws" {
  region = "ap-south-1"
}
variable "environment" {
  default = "dev"
}

resource "aws_instance" "example" {
  ami           = "ami-0593d733c2fc5bd2e"
  instance_type = var.environment == "prod" ? "t2.medium" : "t2.micro"
}

# Environment Variable
# variable "environment" {
#   default = "dev"
# }

# # EC2 Instance
# resource "aws_instance" "my_server" {
# #   ami           = "ami-0593d733c2fc5bd2e"

#   # Conditional Expression
#   instance_type = var.environment == "prod" ? "t2.medium" : "t2.micro"

#   tags = {
#     Name = var.environment == "prod" ? "Production-Server" : "Development-Server"
#   }
# }

# Output
output "instance_id" {
  value = aws_instance.my_server.id
}

output "instance_type" {
  value = aws_instance.my_server.instance_type
}

output "environment" {
  value = var.environment
}
