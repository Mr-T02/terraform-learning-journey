variable "instance_name" {
    description = "Name tag for the instance"
    type        = string
}
variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
}
variable "instance_type" {
    description = "Type of EC2 instance"
    type        = string
} 
resource "aws_instance" "this" {
    ami           = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = var.instance_name
    }
}
output "instance_id" {
    value = aws_instance.this.id
}

output "public_ip" {
    value = aws_instance.this.public_ip
} 