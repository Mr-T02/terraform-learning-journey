
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "my_key" {
  key_name   = "terraform-practice-key_name"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "my_sg" {
  name        = "terraform-practice-sg"
  description = "Allow SSH access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
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

module "web_server" {
  source = "./modules/web-server"

  ami_id            = "ami-0fa52f1a01deb1658"
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my_key.key_name
  security_group_id = aws_security_group.my_sg.id
  instance_name     = "my-first-terraform-instance"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "tushar-terraform-practice-bucket-01"
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content  = <<-EOT
    [webserver]
    ${module.web_server.public_ip} ansible_user = ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519 ansible_ssh_common_args=' -o StrictHostKeyChecking=no'
    EOT
}
