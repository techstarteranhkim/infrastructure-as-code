output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.my_instance.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.my_instance.public_ip
}
