provider "aws" {
  region = "eu-west-2"
  access_key = "AKIAQOCCNIKNIN5N7HNY"
  secret_key = "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"
  
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_instance" "web-id" {
  id = "i-091ffdebe901da058"
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld-nano"
  }
}