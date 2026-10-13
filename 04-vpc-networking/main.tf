terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

# --------------------------------- VPC ------------------------------ 

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-practice-vpc"
  }
}

# ------------------------------ PUBLIC SUBNET ------------------------------ 

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-subnet"
  }
}

# ------------------------------ INTERNET GATEWAY ------------------------------ 

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-practice-igw"
  }
}

# ------------------------------ PUBLIC ROUTE TABLE ------------------------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-public-route-table"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ------------------------------ PRIVATE SUBNET ------------------------------ 

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-subnet"
  }
}

# ------------------------------ PRIVATE ROUTE TABLE ------------------------------ 

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-private-route-table"
  }
}

resource "aws_route_table_association" "private_rt_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}


# ------------------------------ SECURITY GROUP ------------------------------  

resource "aws_security_group" "vpc_practice_sg" {
  name   = "vpc-practice-sg"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-practice-sg"
  }
}

# ------------------------------ EXISTING SSH KEY ------------------------------  

resource "aws_key_pair" "vpc_practice_key" {
  key_name   = "vpc-practice-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

# ------------------------------ PUBLIC INSTANCE ------------------------------ 

resource "aws_instance" "vpc_test_instance" {
  ami                    = "ami-0fa52f1a01deb1658"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.vpc_practice_key.key_name
  vpc_security_group_ids = [aws_security_group.vpc_practice_sg.id]

  tags = {
    Name = "vpc-test-instance"
  }
}

# ------------------------------ PRIVATE INSTANCE ------------------------------ 

resource "aws_instance" "private_test_instance" {
  ami                    = "ami-0fa52f1a01deb1658"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.vpc_practice_key.key_name
  vpc_security_group_ids = [aws_security_group.vpc_practice_sg.id]

  tags = {
    Name = "private-test-instance"
  }
} 