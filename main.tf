provider "aws" {
  region = "us-east-1"
}

# Security Group para permitir SSH y HTTP
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = "vpc-0019f54128ee2e6e5"   # tu VPC

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instancia VM-A
resource "aws_instance" "vm_a" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = "ea2_lab"   # clave creada en AWS
  vpc_security_group_ids = [aws_security_group.allow_web.id]

  tags = {
    Name = "technova-vm-a"
  }
}

# Instancia VM-B
resource "aws_instance" "vm_b" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = "ea2_lab"   # clave creada en AWS
  vpc_security_group_ids = [aws_security_group.allow_web.id]

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

# Outputs para mostrar DNS públicos
output "vm_a_public_dns" {
  value = aws_instance.vm_a.public_dns
}

output "vm_b_public_dns" {
  value = aws_instance.vm_b.public_dns
}
