resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.public_subnets[*].id

  ingress {
    description = "Allow inbound HTTP"
    protocol    = "tcp"
    rule_no     = 100
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
  }

  ingress {
    description = "Allow inbound HTTPS"
    protocol    = "tcp"
    rule_no     = 110
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }

  ingress {
    description = "Allow inbound SSH"
    protocol    = "tcp"
    rule_no     = 120
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 22
    to_port     = 22
  }

  ingress {
    description = "Allow inbound ephemeral ports"
    protocol    = "tcp"
    rule_no     = 130
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 1024
    to_port     = 65535
  }

  ingress {
    description = "Allow inbound ICMP (ping) traffic"
    protocol    = "icmp"
    rule_no     = 140
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 8
    to_port     = 0
  }

  egress {
    description = "Allow all outbound traffic"
    protocol    = "-1"
    rule_no     = 100
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
  }

  egress {
    description = "Allow outbound traffic to a private subnet"
    protocol    = "-1"
    rule_no     = 110
    action      = "allow"
    cidr_block  = aws_vpc.main.cidr_block
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "Public Network ACL"
  }
}

resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.private_subnets[*].id

  ingress {
    description = "Allow inbound traffic from public subnets"
    protocol    = "-1"
    rule_no     = 100
    action      = "allow"
    cidr_block  = aws_vpc.main.cidr_block
    from_port   = 0
    to_port     = 0
  }

  ingress {
    description = "Allow inbound ephemeral ports"
    protocol    = "tcp"
    rule_no     = 110
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 1024
    to_port     = 65535
  }

  egress {
    description = "Allow all outbound traffic"
    protocol    = "-1"
    rule_no     = 100
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "Private Network ACL"
  }
}