locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

module "vpc" {
  source = "../../modules/vpc"

  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "security" {
  source = "../../modules/security"

  name_prefix = local.name_prefix
  vpc_id      = module.vpc.vpc_id
  vpc_cidr    = var.vpc_cidr
  my_ip_cidr  = var.my_ip_cidr
}

module "openvpn" {
  source = "../../modules/openvpn"

  name_prefix       = local.name_prefix
  ami_id            = var.openvpn_ami_id
  instance_type     = var.openvpn_instance_type
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security.openvpn_security_group_id
  key_name          = var.openvpn_key_name
}

module "eks" {
  source = "../../modules/eks"

  name_prefix                 = local.name_prefix
  cluster_name                = var.eks_cluster_name
  cluster_version             = var.eks_version
  private_subnet_ids          = module.vpc.private_subnet_ids
  node_group_instance_types   = var.node_group_instance_types
  node_group_desired_size     = var.node_group_desired_size
  node_group_min_size         = var.node_group_min_size
  node_group_max_size         = var.node_group_max_size
  eks_nodes_security_group_id = module.security.eks_nodes_security_group_id
}
