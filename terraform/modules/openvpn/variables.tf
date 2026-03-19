variable "name_prefix" {
  description = "Common name prefix"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for OpenVPN instance"
  type        = string
}

variable "instance_type" {
  description = "OpenVPN instance type"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for OpenVPN"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
