
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dev" {
  ami           = "ami-0593d733c2fc5bd2e"
  instance_type = "t2.micro"
  subnet_id     = "subnet-07a1b04028081083e"

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "Rajveer-1"
  }
}
