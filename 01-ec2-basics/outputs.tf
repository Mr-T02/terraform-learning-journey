output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.web_server.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.web_server.instance_id
}

output "S3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.bucket
}