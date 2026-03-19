output "instance_id" {
  description = "OpenVPN EC2 instance ID"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "OpenVPN public IP"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "OpenVPN private IP"
  value       = aws_instance.this.private_ip
}
