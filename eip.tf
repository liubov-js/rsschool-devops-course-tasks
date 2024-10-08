resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Name = "NAT Elastic IP 1"
  }
}