terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "tushar02-terraform-state-bucket"
    key            = "terraform-third-project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}
module "my_instance" {
  source        = "./modules/ec2-instance"
  ami_id        = "ami-0fa52f1a01deb1658"
  instance_name = "ec2-conditional-instance-01"
  instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
} 