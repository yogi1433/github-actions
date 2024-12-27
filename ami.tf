data "aws_ssm_parameter" "latest_amazon_linux2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_ami" "latest_amazon_linux2" {
  most_recent = true
  filter {
    name   = "image-id"
    values = [data.aws_ssm_parameter.latest_amazon_linux2_ami.value]
  }
  owners = ["amazon"]
}
