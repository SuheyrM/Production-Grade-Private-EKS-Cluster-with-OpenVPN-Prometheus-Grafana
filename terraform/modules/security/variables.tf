variable "name_prefix" {
  description = "Common name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "my_ip_cidr" {
  description = "Admin IP CIDR for SSH"
  type        = string
}
