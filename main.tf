
provider "aws" {
  region = "ap-south-1"
}

variable "environment" {
  default = "dev"
}

resource "aws_instance" "example" {
  ami           = "ami-0593d733c2fc5bd2e"

  # Conditional Expression
  instance_type = var.environment == "prod" ? "t2.medium" : "t2.micro"

  tags = {
    Name = var.environment == "prod" ? "Production-Server" : "Development-Server"
  }
}

output "environment" {
  value = var.environment
}

output "instance_type" {
  value = aws_instance.example.instance_type
}
