provider "aws" {
  region  = "us-east-1"
}

variable "cidr_block"{
  type=string
}

variable "cidr_block_subnet_1"{
  type=string
}

variable "cidr_block_availability_zones_1"{
  type=string
}

variable "cidr_block_subnet_2"{
  type=string
}

variable "cidr_block_availability_zones_2"{
  type=string
}

variable "cidr_block_subnet_3"{
  type=string
}

variable "cidr_block_availability_zones_3"{
  type=string
}

resource "aws_vpc" "csye6225_a4" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_classiclink_dns_support = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "csye6225_a4"
  }
}

resource "aws_subnet" "subnet_1"{
    cidr_block = var.cidr_block_subnet_1
    vpc_id = aws_vpc.csye6225_a4.id
    availability_zone = var.cidr_block_availability_zones_1
    map_public_ip_on_launch = true
    tags = {
        Name = "subnet_1"
    }
}

resource "aws_subnet" "subnet_2"{
    cidr_block = var.cidr_block_subnet_2
    vpc_id = aws_vpc.csye6225_a4.id
    availability_zone = var.cidr_block_availability_zones_2
    map_public_ip_on_launch = true
    tags = {
        Name = "subnet_2"
    }
}

resource "aws_subnet" "subnet_3"{
    cidr_block = var.cidr_block_subnet_3
    vpc_id = aws_vpc.csye6225_a4.id
    availability_zone = var.cidr_block_availability_zones_3
    map_public_ip_on_launch = true
    tags = {
        Name = "subnet_3"
    }
}

resource "aws_internet_gateway" "gateway" {
       vpc_id = "${aws_vpc.csye6225_a4.id}"
       tags = {
           Name = "Internet_gateway_1_csye6225_a4"
      }
}
resource "aws_route_table" "route" {
  vpc_id = "${aws_vpc.csye6225_a4.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway.id}"
  }


  tags = {
    Name = "Route_1_csye6225_a4"
  }
}
resource "aws_route_table_association" "a1" {
 subnet_id = "${aws_subnet.subnet_1.id}"
  route_table_id = "${aws_route_table.route.id}"
}
resource "aws_route_table_association" "a2" {
  subnet_id = "${aws_subnet.subnet_2.id}"
  route_table_id = "${aws_route_table.route.id}"
}
resource "aws_route_table_association" "a3" {
  subnet_id = "${aws_subnet.subnet_3.id}"
  route_table_id = "${aws_route_table.route.id}"
}

