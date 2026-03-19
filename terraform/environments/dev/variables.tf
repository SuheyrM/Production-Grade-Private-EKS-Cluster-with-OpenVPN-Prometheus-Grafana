variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "openvpn_instance_type" {
  description = "Instance type for OpenVPN server"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "eks_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "node_group_instance_types" {
  description = "EKS node group instance types"
  type        = list(string)
}

variable "node_group_desired_size" {
  description = "Desired node count"
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum node count"
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum node count"
  type        = number
}

variable "grafana_private_zone_name" {
  description = "Private Route53 zone name"
  type        = string
}

variable "grafana_hostname" {
  description = "Grafana private DNS record"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR format for SSH access, e.g. 1.2.3.4/32"
  type        = string
}

variable "openvpn_ami_id" {
  description = "AMI ID for the OpenVPN instance"
  type        = string
}

variable "openvpn_key_name" {
  description = "EC2 key pair name for SSH access to OpenVPN instance"
  type        = string
}
