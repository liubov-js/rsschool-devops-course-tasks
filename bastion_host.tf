resource "aws_instance" "bastion" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  key_name      = "bastion"

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  subnet_id              = aws_subnet.public_subnets[0].id

  tags = {
    Name = "k3s Bastion"
  }
}