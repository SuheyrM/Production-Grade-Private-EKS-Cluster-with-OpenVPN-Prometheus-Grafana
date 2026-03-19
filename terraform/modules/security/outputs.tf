output "openvpn_security_group_id" {
  description = "OpenVPN security group ID"
  value       = aws_security_group.openvpn.id
}

output "eks_nodes_security_group_id" {
  description = "EKS nodes security group ID"
  value       = aws_security_group.eks_nodes.id
}
