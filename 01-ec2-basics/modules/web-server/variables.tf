
variable "instance_type" {
    description = "Type of EC2 instance"
    type         = string
}
variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
}
variable "key_name" {
    description = "SSH key pair name"
    type        = string
} 
variable "security_group_id" {
    description = "Security group ID to attach"
    type        = string
}
variable "instance_name" {
    description = "Name tag for the instance"
    type        = string 
}