project_name = "production-grade-private-eks"
environment  = "dev"
aws_region   = "us-east-1"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24"
]

private_subnet_cidrs = [
  "10.0.2.0/24",
  "10.0.3.0/24"
]

openvpn_instance_type = "t3.micro"

eks_cluster_name = "production-grade-private-eks"
eks_version      = "1.31"

node_group_instance_types = ["t3.small"]
node_group_desired_size   = 3
node_group_min_size       = 3
node_group_max_size       = 3

grafana_private_zone_name = "devops.private"
grafana_hostname          = "grafana.devops.private"

my_ip_cidr       = "62.49.236.115/32"
openvpn_ami_id   = "ami-0c02fb55956c7d316"
openvpn_key_name = "production-grade-private-eks-key"
