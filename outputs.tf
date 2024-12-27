output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "instance_id" {
  value = aws_instance.jenkins_instance.id
}

output "public_ip" {
  value = aws_instance.jenkins_instance.public_ip
}

output "private_key_path" {
  value = local_file.private_key.filename
}
