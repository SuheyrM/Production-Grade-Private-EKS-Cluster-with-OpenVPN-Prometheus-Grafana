output "name_prefix" {
  description = "Common resource name prefix"
  value       = local.name_prefix
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "openvpn_security_group_id" {
  description = "OpenVPN security group ID"
  value       = module.security.openvpn_security_group_id
}

output "eks_nodes_security_group_id" {
  description = "EKS worker node security group ID"
  value       = module.security.eks_nodes_security_group_id
}

output "openvpn_instance_id" {
  description = "OpenVPN EC2 instance ID"
  value       = module.openvpn.instance_id
}

output "openvpn_public_ip" {
  description = "OpenVPN public IP"
  value       = module.openvpn.public_ip
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Private EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_name" {
  description = "EKS managed node group name"
  value       = module.eks.node_group_name
}
