#Output instance details 

output "Master_pub_ip" {
  value = aws_eip.master-eip.public_ip
}

output "Slave_pub_ip" {
  value = aws_eip.slave-eip.public_ip
}
