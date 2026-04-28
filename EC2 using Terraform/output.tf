
output "aws_instance_public_ip" {
    value = aws_instance.Nginx.public_ip
    description = "The public IP address of the EC2 instance"
  
}

output "aws_instance_public_dns" {

    value = aws_instance.Nginx.public_dns
    description = "The public DNS of the EC2 instance"  
}

