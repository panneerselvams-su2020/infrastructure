provider "aws" {
  region  = "us-east-1"
}

resource "aws_vpc" "assignment-4" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_classiclink_dns_support = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "assignment-4"
  }
}

resource "aws_subnet" "subnet"{
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.assignment-4.id
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "assignment-4-subnet"
    }
}