provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm_a" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  tags = { Name = "technova-vm-a" }
}

resource "aws_instance" "vm_b" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  tags = { Name = "technova-vm-b" }
}
