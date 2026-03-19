resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  source_dest_check = false

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y docker
              systemctl enable docker
              systemctl start docker
              docker run -d \
                --name openvpn \
                --cap-add=NET_ADMIN \
                -p 1194:1194/udp \
                -p 8080:8080/tcp \
                -v openvpn_data:/etc/openvpn \
                kylemanna/openvpn
              EOF

  tags = {
    Name = "${var.name_prefix}-openvpn"
  }
}
