output "instance_public_ip" {
    value = aws_instance.example-0000.public_ip
    description = "The public IP of instance"
}

output "instance_private_ip" {
    value = aws_instance.example-0000.private_ip
    description = "The private Ip of instance"
}