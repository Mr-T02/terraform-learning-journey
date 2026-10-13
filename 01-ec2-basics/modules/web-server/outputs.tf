output "instance_id" {
    description = "ID of the created instance"
    value       = aws_instance.this.id     
}

output "public_ip" {
    description = "Public IP of the created instance"
    value       = aws_instance.this.public_ip
}