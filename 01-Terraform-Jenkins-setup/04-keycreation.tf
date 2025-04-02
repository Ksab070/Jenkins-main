#Create random private key for jenkins
resource "tls_private_key" "key_for_jenkins" {
  algorithm = "ED25519"
  rsa_bits = 2048
}

#Save private key locally
resource "local_file" "create_local" {
  filename = "${path.module}/jenkins.pem"
  content = tls_private_key.key_for_jenkins.private_key_pem
  file_permission = "0400"
}

#Send the public key to AWS
resource "aws_key_pair" "key_pair_jenkins" {
  key_name = "jenkins_key_pair"
  public_key = tls_private_key.key_for_jenkins.public_key_pem
  tags = local.aws_tags
}
