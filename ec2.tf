

resource "aws_instance" "jenkins_instance" {
  ami             = data.aws_ami.latest_amazon_linux2.id
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.public_subnet.id
  key_name        = aws_key_pair.main_key.key_name
  security_groups = [aws_security_group.instance_sg.id]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "jenkins-instance"
  }
}
