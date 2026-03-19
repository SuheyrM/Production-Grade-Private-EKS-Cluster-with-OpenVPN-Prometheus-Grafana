variable "name_prefix" {
  description = "Common name prefix"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EKS"
  type        = list(string)
}

variable "node_group_instance_types" {
  description = "Managed node group instance types"
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

variable "eks_nodes_security_group_id" {
  description = "Security group ID for EKS worker nodes"
  type        = string
}
