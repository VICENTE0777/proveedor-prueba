provider "aws" {
  region = "us-east-1"
}

# Instancia VM A
resource "aws_instance" "vm_a" {
  ami           = "ami-0fc5d935ebf8bc3bc"   # Ubuntu Server 22.04 LTS válido en us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "technova-vm-a"
  }
}

# Instancia VM B
resource "aws_instance" "vm_b" {
  ami           = "ami-0fc5d935ebf8bc3bc"   # mismo AMI
  instance_type = "t2.micro"

  tags = {
    Name = "technova-vm-b"
  }
}

# Outputs para mostrar IPs públicas
output "vm_a_public_ip" {
  value = aws_instance.vm_a.public_ip
}

output "vm_b_public_ip" {
  value = aws_instance.vm_b.public_ip
}
