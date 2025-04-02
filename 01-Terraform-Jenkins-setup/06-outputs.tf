#Output instance details 

output "Master_pub_ip" {
  value = aws_eip.master-eip.public_ip
}

output "Master_pub_dns" {
  value = aws_instance.master-instance.public_dns
}

output "Slave_pub_ip" {
  value = aws_eip.slave-eip.public_ip
}

output "Slave_pub_dns" {
  value = aws_instance.slave-instance.public_dns
}

