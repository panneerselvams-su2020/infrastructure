variable "region" {
  type=string
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

variable "AMI_ID" {
  type    = "string"
  description = "AMI ID for the instance"
}

variable "EC2_INSTANCE_SIZE" {
  type    = "string"
  description = "The EC2 instance size"
}

variable "EC2_ROOT_VOLUME_SIZE" {
  type    = "string"
  description = "The volume size for the root volume in GiB"
}

variable "EC2_ROOT_VOLUME_TYPE" {
  type    = "string"
  description = "The type of data storage: standard, gp2, io1"
}

variable "EC2_ROOT_VOLUME_DELETE_ON_TERMINATION" {
  description = "Delete the root volume on instance termination."
}

variable "ENGINE" {
  type = "string"
  description = "Database Engine"  
}

variable "INSTANCE_CLASS" {
    type = "string"
    description = "db instance class"
}

variable "MULTI_AZ" {
  description = "multi-az"
}

variable "IDENTIFIER" {
  type = "string"
  description = "DB instance identifier"
}

variable "USERNAME" {
  type = "string"
  description = "username"
}

variable "PASSWORD" {
  type = "string"
  description = "password"
}

variable "PUBLICLY_ACCESSIBLE" {
  description = "publicly accessible"
}

variable "NAME" {
  type = "string"
  description = "db name"
}

variable "ALLOCATED_STORAGE" {
  type = "string"
  description = "allocated storage"
}

variable "FINAL_SNAPSHOT_IDENTIFIER" {
  type = "string"
  description = "snapshot"
}

variable "SKIP_FINAL_SHOT" {
  description = "skip final shot"
}

variable "ASS5" {
  type= "string"
  description = "key pair for assignment 5"
}

variable "SQLPORT" {
  type= "string"
  description = "sql port for MySql"
}

variable "API_TERMINATION" {
  description = "disable api termination"
}

variable "HASH_KEY" {
  description = "Hash Key"
}

variable "PROVISIONED" {
  type = "string"
  description = "provisioned"
}

variable "ATTRIBUTE1_NAME" {
  type = "string"
  description = "attribute1 name"
}

variable "ATTRIBUTE1_TYPE" {
  type = "string"
  description = "attribute1 type"
}

variable "LIFE_CYCLE_RULE_ENABLE" {
  description = "Enable life cycle"
}

variable "READ_CAPACITY" {
  description = "read capacity"
}

variable "WRITE_CAPACITY" {
  description = "write capacity"
}

variable "TRANSITION_DAYS" {
  description = "transition days"
}

variable "STANDARD_IA" {
  description = "standard ia"
}

variable "SSE_ALGORITHM" {
  type = "string"
  description = "sse algorithm"
}

variable "ACL" {
  type = "string"
  description = "acl"
}

variable "BUCKET" {
  type = "string"
  description = "description name"
}

variable "FRONTEND_PORT" {
  description = "frontend port"
}

variable "BACKEND_PORT" {
  description = "backend port"
}


//provider
provider "aws" {
  region  = var.region
}

//vpc
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

//subnet
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

//internet gateway
resource "aws_internet_gateway" "gateway" {
       vpc_id = "${aws_vpc.csye6225_a4.id}"
       tags = {
           Name = "Internet_gateway_1_csye6225_a4"
      }
}


//route table
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


//route table association
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



//security group - application
resource "aws_security_group" "application" {
  name = "application"
  description = "Create application Security group for EC2 instance and allow ports for webapp application"
  vpc_id = "${aws_vpc.csye6225_a4.id}"

  ingress {
    from_port= 443
    to_port=443
    protocol="tcp"
    description = "HTTPS"
    cidr_blocks=["0.0.0.0/0"]
  }

  ingress {
    from_port= 80
    to_port=80
    protocol="tcp"
    description = "HTTP"
    cidr_blocks=["0.0.0.0/0"]
  }

  ingress {
    from_port= 22
    to_port=22
    protocol="tcp"
    description = "Telnet"
    cidr_blocks=["0.0.0.0/0"]
  }

  ingress {
    from_port= "${var.FRONTEND_PORT}"
    to_port="${var.FRONTEND_PORT}"
    protocol="tcp"
    description = "Front End Port"
    cidr_blocks=["0.0.0.0/0"]
  }

    ingress {
    from_port= "${var.BACKEND_PORT}"
    to_port="${var.BACKEND_PORT}"
    protocol="tcp"
    description = "Back End port"
    cidr_blocks=["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // egress {
  //   from_port= 443
  //   to_port=443
  //   protocol="tcp"
  //   cidr_block=["0.0.0.0/0"]
  // }

  // egress {
  //   from_port= 80
  //   to_port=80
  //   protocol="tcp"
  //   cidr_block=["0.0.0.0/0"]
  // }

  // egress {
  //   from_port= 22
  //   to_port=22
  //   protocol="tcp"
  //   cidr_block=["0.0.0.0/0"]
  // }
}


//security group - database
resource "aws_security_group" "database" {
    name = "database"
    description = "Create database Security group for EC2 instance and allow ports for db"
    vpc_id = "${aws_vpc.csye6225_a4.id}"

  ingress {
    from_port= "${var.SQLPORT}"
    to_port= "${var.SQLPORT}"
    protocol="tcp"
    security_groups = [aws_security_group.application.id]
    cidr_blocks=["0.0.0.0/0"]
  }
  // egress {
  //   from_port= 3306
  //   to_port= 3306
  //   protocol="tcp"
  //   cidr_block=["0.0.0.0/0"]
  // }  
}


//subnet_group
resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds_subnet"
  subnet_ids = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]

  tags = {
    Name = "My DB subnet group for rds1"
  }
}


//rds instance
resource "aws_db_instance" "rds1" {
  engine = "${var.ENGINE}"
  instance_class = "${var.INSTANCE_CLASS}"
  multi_az = "${var.MULTI_AZ}"
  identifier = "${var.IDENTIFIER}"
  username = "${var.USERNAME}"
  password = "${var.PASSWORD}"
  db_subnet_group_name = "${aws_db_subnet_group.rds_subnet.name}"
  publicly_accessible = "${var.PUBLICLY_ACCESSIBLE}"
  name = "${var.NAME}"
  allocated_storage= "${var.ALLOCATED_STORAGE}"
  final_snapshot_identifier = "${var.FINAL_SNAPSHOT_IDENTIFIER}"
  skip_final_snapshot = "${var.SKIP_FINAL_SHOT}"
  vpc_security_group_ids = [aws_security_group.database.id]
}

 

//key pair
resource "aws_key_pair" "ass5" {
  key_name   = "ass5"
  public_key = "${var.ASS5}"
}

//ec2 instance
resource "aws_instance" "ec2Instance1" {
  ami = "${var.AMI_ID}"
  instance_type = "${var.EC2_INSTANCE_SIZE}"
  //role = "${aws_iam_role.csyerole.name}"
  vpc_security_group_ids = [aws_security_group.application.id]
  subnet_id = "${aws_subnet.subnet_2.id}"
  disable_api_termination = "${var.API_TERMINATION}"
  key_name = "${aws_key_pair.ass5.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.ec2InstanceProfile.name}"
  //user_data = "${data.template_file.init.rendered}"
  user_data = "${file("userdata.sh")}"
  tags = {
    Name = "ec2_ass5"
  } 
  root_block_device {
    delete_on_termination = "${var.EC2_ROOT_VOLUME_DELETE_ON_TERMINATION}"
    volume_size = "${var.EC2_ROOT_VOLUME_SIZE}"
    volume_type = "${var.EC2_ROOT_VOLUME_TYPE}"
  }
}

//
  // vars = {
  //   hostname = ${aws_db_instance.rds1.endpoint}"
  // }

//   data "template_file" "init" {
//   template = "${file("userdata.sh.tpl")}"

//   vars = {
//     hostname = "aws_instance.rds1.endpoint"
//   }
// }

//dynamo db table
resource "aws_dynamodb_table" "csye6225" {
  name = "csye6225"
  hash_key = "${var.HASH_KEY}"
  billing_mode   = "${var.PROVISIONED}"   
  read_capacity  = "${var.READ_CAPACITY}"
  write_capacity = "${var.WRITE_CAPACITY}"
  attribute {
    name = "${var.ATTRIBUTE1_NAME}"
    type = "${var.ATTRIBUTE1_TYPE}"
  }
}


//IAM role
resource "aws_iam_role" "EC2-CSYE6225" {
  name = "EC2-CSYE6225"
  assume_role_policy = "${file("EC2-CSYE6225.json")}"
}

//IAM policy
resource "aws_iam_policy" "WebAppS3" {
  name        = "WebAppS3"
  description = "WebAppS3 policy will allow EC2 instances to perform S3 buckets. This is required for applications on your EC2 instance to talk to S3 bucket."
  policy = "${file("WebAppS3.json")}"
}

//IAM policy attachment
resource "aws_iam_role_policy_attachment" "csyeroleAttach" {
  role       = "${aws_iam_role.EC2-CSYE6225.name}"
  policy_arn = "${aws_iam_policy.WebAppS3.arn}"
}

//Instance Profile
resource "aws_iam_instance_profile" "ec2InstanceProfile" {
  name = "ec2InstanceProfile"
  role = "${aws_iam_role.EC2-CSYE6225.name}"
}

//S3 bucket
resource "aws_s3_bucket" "s3bucket" {
  bucket = "${var.BUCKET}"
  acl = "${var.ACL}"
  lifecycle_rule {
    enabled = "${var.LIFE_CYCLE_RULE_ENABLE}"
    transition {
      days = "${var.TRANSITION_DAYS}"
      storage_class = "${var.STANDARD_IA}"
    }
  }
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "${var.SSE_ALGORITHM}"
      }
    }
  }
  
}


