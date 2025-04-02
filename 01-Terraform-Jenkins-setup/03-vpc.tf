#Main vpc for deployment
resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = local.aws_tags
}

#Subnet for jenkins
resource "aws_subnet" "j-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"
  enable_resource_name_dns_a_record_on_launch = true
  tags = local.aws_tags
}

#Security group for jenkins vpc
resource "aws_security_group" "j-security-group" {
  name        = "jenkins-sec-group"
  vpc_id      = aws_vpc.main-vpc.id
  tags = local.aws_tags
}

#Egress allowed to anywhere
resource "aws_vpc_security_group_egress_rule" "j-egress" {
  security_group_id = aws_security_group.j-security-group.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}

#Ingress for SSH from anywhere
resource "aws_vpc_security_group_ingress_rule" "j-ingress" {
  security_group_id = aws_security_group.j-security-group.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port = 22
  ip_protocol = "ssh"
}

#Ingress for Port 80
resource "aws_vpc_security_group_ingress_rule" "j-ingress" {
  security_group_id = aws_security_group.j-security-group.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port = 80
  ip_protocol = "tcp"
}

#Port 8080
resource "aws_vpc_security_group_ingress_rule" "j-ingress" {
  security_group_id = aws_security_group.j-security-group.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8080
  to_port = 8080
  ip_protocol = "tcp"
}

#Port 8000
resource "aws_vpc_security_group_ingress_rule" "j-ingress" {
  security_group_id = aws_security_group.j-security-group.id
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8000
  to_port = 8000
  ip_protocol = "tcp"
}

#Internet gateway for the VPC
resource "aws_internet_gateway" "j-igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = local.aws_tags
}

# Route table
resource "aws_route_table" "j-routetable" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.j-igw.id
  }

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = local.aws_tags
}

#Route table - Subnet association 
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.j-subnet.id
  route_table_id = aws_route_table.j-routetable.id
}

