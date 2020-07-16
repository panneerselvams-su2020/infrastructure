variable "region" {
  description = "aws-region"
}

variable "cidr_block"{
  description = "cidr-block"
}

variable "cidr_block_subnet_1"{
  description = "cidr block subnet1 "
}

variable "cidr_block_availability_zones_1"{
  description = "zone 1"
}

variable "cidr_block_subnet_2"{
  description = "cidr block subnet2 "
}

variable "cidr_block_availability_zones_2"{
  description = "zone 2"
}

variable "cidr_block_subnet_3"{
  description = "cidr block subnet3 "
}

variable "cidr_block_availability_zones_3"{
  description = "zone 3"
}

variable "AMI_ID" {
  description = "AMI ID for the instance"
}

variable "EC2_INSTANCE_SIZE" {
  description = "The EC2 instance size"
}

variable "EC2_ROOT_VOLUME_SIZE" {
  description = "The volume size for the root volume in GiB"
}

variable "EC2_ROOT_VOLUME_TYPE" {
  description = "The type of data storage: standard, gp2, io1"
}

variable "EC2_ROOT_VOLUME_DELETE_ON_TERMINATION" {
  description = "Delete the root volume on instance termination."
}

variable "ENGINE" {
  description = "Database Engine"  
}

variable "INSTANCE_CLASS" {
    description = "db instance class"
}

variable "MULTI_AZ" {
  description = "multi-az"
}

variable "IDENTIFIER" {
  description = "DB instance identifier"
}

variable "USERNAME" {
  description = "username"
}

variable "PASSWORD" {
  description = "password"
}

variable "PUBLICLY_ACCESSIBLE" {
  description = "publicly accessible"
}

variable "NAME" {
  description = "db name"
}

variable "ALLOCATED_STORAGE" {
  description = "allocated storage"
}

variable "FINAL_SNAPSHOT_IDENTIFIER" {
  description = "snapshot"
}

variable "SKIP_FINAL_SHOT" {
  description = "skip final shot"
}

variable "ASS5" {
  description = "key pair for assignment 5"
}

variable "SQLPORT" {
  description = "sql port for MySql"
}

variable "API_TERMINATION" {
  description = "disable api termination"
}

variable "HASH_KEY" {
  description = "Hash Key"
}

variable "PROVISIONED" {
  description = "provisioned"
}

variable "ATTRIBUTE1_NAME" {
  description = "attribute1 name"
}

variable "ATTRIBUTE1_TYPE" {
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
  description = "sse algorithm"
}

variable "ACL" {
  description = "acl"
}

variable "FORCE_DESTROY" {
  description = "force destroy s3 bucket"
}

variable "BUCKET" {
  description = "description name"
}

variable "BUCKETA" {
  description = "description name"
}

variable "FRONTEND_PORT" {
  description = "frontend port"
}

variable "BACKEND_PORT" {
  description = "backend port"
}

variable "MAP_PUBLIC_IP_ON_LAUNCH" {
  description = "to map public ip on launch"
}

variable "ENABLE_DNS_HOSTNAMES" {
  description = "enable dns hostnames"
}

variable "ENABLE_DNS_SUPPORT" {
  description = "enable dns support"
}

variable "ENABLE_CLASSICLINK_DNS_SUPPORT" {
  description = "enable classiclink dns support"
}

variable "ASSIGN_GENERATED_IPV6_CIDR_BLOCK" {
  description = "assign generated ipv6 cidr block"
}

variable "IAM_USER" {
  description = "IAM User"
}

variable "AWSCODEDEPLOYPOLICYARN" {
  description = "code deploy policy arn"
}

variable "COMPUTE_PLATFORM" {
  description = "compute platform"
}

variable "HOSTCOUNT" {
  description = "host count"
}

variable "HOSTSVALUE" {
  description = "hosts value"
}

variable "ALARM" {
  description = "alarm"
}

variable "ROLLBACK" {
  description = "rollback"
}

variable "CloudWatchPolicyARN" {
  description = "CloudWatchPolicy ARN"
}

variable "PUBLIC_IP_ASSOCIATE" {
  description = "associate public ip address"
}

variable "VOLUME_SIZE" {
  description = "Volume Size"
}

variable "VOLUME_TYPE" {
  description = "Volume Type"
}

variable "DESIRED_CAPACITY" {
  description = "desired capacity"
}

variable "ADJUSTMENTTYPE" {
  description = "adjustment type"
}

variable "DEFAULT_COOLDOWN" {
  description = "default cooldown"
}

variable "SCALINGDOWNADJUSTMENT" {
  description = "scaling down adjustment"
}

variable "SCALINGUPADJUSTMENT" {
  description = "scaling up adjustment"
}

variable "PROPOGATE" {
  description = "propogate at launch"
}

variable "COMPARISONOPERATOR_GREATERTHAN" {
  description = "greater than threshold"
}

variable "COMPARISONOPERATOR_LESSTHAN" {
  description = "lesser than threshold"
}

variable "METRIC_NAME" {
  description = "Metric Name"
}

variable "NAMESPACE" {
  description = "namespace"
}

variable "STATISTIC" {
  description = "statistic"
}

variable "PERIOD" {
  description = "period"
}

variable "EVALUATION_PERIODS" {
  description = "evaluation periods"
}

variable "THRESHOLD_HIGH" {
  description = "high threshold"
}

variable "THRESHOLD_LOW" {
  description = "low threshold"
}

variable "INTERNAL" {
  description = "internal"
}

variable "LOAD_BALANCER_TYPE" {
  description = "load balancer type"
}

variable "ENABLE_DELETION_PROTECTION" {
  description = "enable deletion protection"
}

variable "TARGET_PORT" {
  description = "target port"
}

variable "PROTOCOL" {
  description = "protocol"
}

variable "TARGET_TYPE" {
  description = "instance"
}

variable "TYPE" {
  description = "type"
}

variable "ZONEID" {
  description = "zoneid"
}

variable "ZONETYPE" {
  description = "zone type"
}

variable "ZONENAME" {
  description = "zone name"
}

variable "EVALUATE_TARGET_HEALTH" {
  description = "evaluate target health"
}

//provider
provider "aws" {
  region  = var.region
}

//vpc
resource "aws_vpc" "csye6225_a4" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = "${var.ENABLE_DNS_HOSTNAMES}"
  enable_dns_support = "${var.ENABLE_DNS_SUPPORT}"
  enable_classiclink_dns_support = "${var.ENABLE_CLASSICLINK_DNS_SUPPORT}"
  assign_generated_ipv6_cidr_block = "${var.ASSIGN_GENERATED_IPV6_CIDR_BLOCK}"
  tags = {
    Name = "csye6225_a4"
  }
}

//subnet
resource "aws_subnet" "subnet_1"{
    cidr_block = var.cidr_block_subnet_1
    vpc_id = aws_vpc.csye6225_a4.id
    availability_zone = var.cidr_block_availability_zones_1
    map_public_ip_on_launch = "${var.MAP_PUBLIC_IP_ON_LAUNCH}"
    tags = {
        Name = "subnet_1"
    }
}

resource "aws_subnet" "subnet_2"{
    cidr_block = var.cidr_block_subnet_2
    vpc_id = aws_vpc.csye6225_a4.id
    availability_zone = var.cidr_block_availability_zones_2
    map_public_ip_on_launch = "${var.MAP_PUBLIC_IP_ON_LAUNCH}"
    tags = {
        Name = "subnet_2"
    }
}

resource "aws_subnet" "subnet_3"{
    cidr_block = var.cidr_block_subnet_3
    vpc_id = aws_vpc.csye6225_a4.id
    availability_zone = var.cidr_block_availability_zones_3
    map_public_ip_on_launch = "${var.MAP_PUBLIC_IP_ON_LAUNCH}"
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
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//security group - loadbalancer

resource "aws_security_group" "loadbalancer" {
    name = "loadbalancer"
    description = "Create loadbalancer Security group"
    vpc_id = "${aws_vpc.csye6225_a4.id}"

    ingress {
    from_port= 80
    to_port=80
    protocol="tcp"
    description = "HTTP"
    cidr_blocks=["0.0.0.0/0"]
    }
    ingress {
    from_port= 8080
    to_port=8080
    protocol="tcp"
    description = "HTTP"
    cidr_blocks=["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
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
  //final_snapshot_identifier = "${var.FINAL_SNAPSHOT_IDENTIFIER}"
  skip_final_snapshot = "${var.SKIP_FINAL_SHOT}"
  vpc_security_group_ids = [aws_security_group.database.id]
}

 

//key pair
resource "aws_key_pair" "ass5" {
  key_name   = "ass5"
  public_key = "${var.ASS5}"
}

data "template_file" "init" {
  template = "${file("./userdata.sh")}"
  vars = {
    hostname = aws_db_instance.rds1.address
    dbname = var.NAME
    region = var.region
    s3bucket = var.BUCKET
    username = var.USERNAME
    password = var.PASSWORD
  }
}

//ec2 instance
// resource "aws_instance" "ec2Instance1" {
//   ami = "${var.AMI_ID}"
//   instance_type = "${var.EC2_INSTANCE_SIZE}"
//   vpc_security_group_ids = [aws_security_group.application.id]
//   subnet_id = "${aws_subnet.subnet_2.id}"
//   depends_on = [aws_db_instance.rds1]
//   disable_api_termination = "${var.API_TERMINATION}"
//   key_name = "${aws_key_pair.ass5.key_name}"
//   iam_instance_profile = "${aws_iam_instance_profile.ec2InstanceProfile1.name}"
//   user_data = "${data.template_file.init.rendered}"
//   tags = {
//     Name = "webapp"
//   } 
//   root_block_device {
//     delete_on_termination = "${var.EC2_ROOT_VOLUME_DELETE_ON_TERMINATION}"
//     volume_size = "${var.EC2_ROOT_VOLUME_SIZE}"
//     volume_type = "${var.EC2_ROOT_VOLUME_TYPE}"
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

resource "aws_iam_policy" "CodeDeployAllPolicies" {
  name        = "CodeDeployAllPolicies"
  //description = "WebAppS3 policy will allow EC2 instances to perform S3 buckets. This is required for applications on your EC2 instance to talk to S3 bucket."
  policy = "${file("CodeDeployAllPolicies.json")}"
}

resource "aws_iam_policy" "CodeDeploy-EC2-S3" {
  name        = "CodeDeploy-EC2-S3"
  //description = "WebAppS3 policy will allow EC2 instances to perform S3 buckets. This is required for applications on your EC2 instance to talk to S3 bucket."
  policy = "${file("CodeDeploy-EC2-S3.json")}"
}


//IAM policy attachment
resource "aws_iam_role_policy_attachment" "csyeroleAttach" {
  //user = "${var.IAM_USER}"
  role       = "${aws_iam_role.EC2-CSYE6225.name}"
  policy_arn = "${aws_iam_policy.WebAppS3.arn}"
}

resource "aws_iam_user_policy_attachment" "codedeployallpoliciesAttach" {
  user = "${var.IAM_USER}"
  policy_arn = "${aws_iam_policy.CodeDeployAllPolicies.arn}"
}

resource "aws_iam_role_policy_attachment" "codedeployec2s3Attach" {
  role       = "${aws_iam_role.EC2-CSYE6225.name}"
  policy_arn = "${aws_iam_policy.CodeDeploy-EC2-S3.arn}"
}

resource "aws_iam_role_policy_attachment" "CloudWatchAgentServerPolicyAttach" {
  role = "${aws_iam_role.EC2-CSYE6225.name}"
  policy_arn = "${var.CloudWatchPolicyARN}"
}

//Instance Profile
resource "aws_iam_instance_profile" "ec2InstanceProfile1" {
  name = "ec2InstanceProfile1"
  role = "${aws_iam_role.EC2-CSYE6225.name}"
}

//S3 bucket
resource "aws_s3_bucket" "s3bucket" {
  bucket = "${var.BUCKET}"
  acl = "${var.ACL}"
  force_destroy= "${var.FORCE_DESTROY}"
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

//S3 bucket
resource "aws_s3_bucket" "s3bucket1" {
  bucket = "${var.BUCKETA}"
  force_destroy= "${var.FORCE_DESTROY}"
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

resource "aws_iam_role" "CodeDeployIAMRole" {
  name = "CodeDeployIAMRole"
  assume_role_policy = "${file("CodeDeployAgentPolicy.json")}"

}
resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "${var.AWSCODEDEPLOYPOLICYARN}"
  role       = "${aws_iam_role.CodeDeployIAMRole.name}"
}

resource "aws_codedeploy_app" "csye6225-webapp" {
  compute_platform = "${var.COMPUTE_PLATFORM}"
  name             = "csye6225-webapp"
}

resource "aws_codedeploy_deployment_config" "webapp" {
  deployment_config_name = "test-deployment-config"

  minimum_healthy_hosts {
    type  = "${var.HOSTCOUNT}"
    value = "${var.HOSTSVALUE}"
  }
}

resource "aws_codedeploy_deployment_group" "csye6225-webapp-deployment" {
  app_name               = "${aws_codedeploy_app.csye6225-webapp.name}"
  deployment_group_name  = "csye6225-webapp-deployment"
  service_role_arn       = "${aws_iam_role.CodeDeployIAMRole.arn}"
  deployment_config_name = "${aws_codedeploy_deployment_config.webapp.id}"

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = "webapp"
  }

  auto_rollback_configuration {
    enabled = "${var.ROLLBACK}"
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = "${var.ALARM}"
  }
}

resource "aws_launch_configuration" "asg_launch_config" {
  name = "asg_launch_config"
  image_id = "${var.AMI_ID}"
  instance_type = "${var.EC2_INSTANCE_SIZE}"
  associate_public_ip_address = "${var.PUBLIC_IP_ASSOCIATE}"
  security_groups = [aws_security_group.application.id]
  depends_on = [aws_db_instance.rds1]
  iam_instance_profile = "${aws_iam_instance_profile.ec2InstanceProfile1.name}"
  user_data = "${data.template_file.init.rendered}"
  root_block_device {
    volume_size = "${var.VOLUME_SIZE}"
    volume_type = "${var.VOLUME_TYPE}"
  } 
  key_name = "${aws_key_pair.ass5.key_name}"
}

resource "aws_autoscaling_group" "autoscale_webapp_group" {
  name = "autoscale_webapp_group"
  min_size = "2"
  max_size = "5"
  launch_configuration = "${aws_launch_configuration.asg_launch_config.name}"
  desired_capacity = "${var.DESIRED_CAPACITY}"
  default_cooldown = "${var.DEFAULT_COOLDOWN}"
  vpc_zone_identifier = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
  tag {
    key                 = "Name"
    value               = "webapp"
    propagate_at_launch = "${var.PROPOGATE}"
  }
}

resource "aws_autoscaling_policy" "scale_up" {
    name = "scale_up"
    autoscaling_group_name = "${aws_autoscaling_group.autoscale_webapp_group.name}"
    adjustment_type = "${var.ADJUSTMENTTYPE}"
    cooldown = "${var.DEFAULT_COOLDOWN}"
    scaling_adjustment = "${var.SCALINGUPADJUSTMENT}"  
}

resource "aws_autoscaling_policy" "scale_down" {
    name = "scale_down"
    autoscaling_group_name = "${aws_autoscaling_group.autoscale_webapp_group.name}"
    adjustment_type = "${var.ADJUSTMENTTYPE}"
    cooldown = "${var.DEFAULT_COOLDOWN}"
    scaling_adjustment = "${var.SCALINGDOWNADJUSTMENT}"
}
  

resource "aws_cloudwatch_metric_alarm" "CPUAlarmHigh" {
    alarm_name = "CPUAlarmHigh"
    comparison_operator = "${var.COMPARISONOPERATOR_GREATERTHAN}"
    evaluation_periods = "${var.EVALUATION_PERIODS}"
    metric_name = "${var.METRIC_NAME}"
    namespace = "${var.NAMESPACE}"
    period = "${var.PERIOD}"
    statistic = "${var.STATISTIC}"
    threshold = "${var.THRESHOLD_HIGH}"
    alarm_description = "Scale-up if CPU > 90%"
    alarm_actions = [
        "${aws_autoscaling_policy.scale_up.arn}"
    ]
    dimensions = {
        AutoScalingGroupName = "${aws_autoscaling_group.autoscale_webapp_group.name}"
    }
    
}

resource "aws_cloudwatch_metric_alarm" "CPUAlarmLow" {
    alarm_name = "CPUAlarmLow"
    comparison_operator = "${var.COMPARISONOPERATOR_LESSTHAN}"
    evaluation_periods = "${var.EVALUATION_PERIODS}"
    metric_name = "${var.METRIC_NAME}"
    namespace = "${var.NAMESPACE}"
    period = "${var.PERIOD}"
    statistic = "${var.STATISTIC}"
    threshold = "${var.THRESHOLD_HIGH}"
    alarm_description = "Scale-down if CPU < 70%"
    alarm_actions = [
        "${aws_autoscaling_policy.scale_down.arn}"
    ]
    dimensions = {
        AutoScalingGroupName = "${aws_autoscaling_group.autoscale_webapp_group.name}"
    }
}

  resource "aws_lb" "loadbalancerwebapp" {
   name               = "loadbalancerwebapp"
   internal           = "${var.INTERNAL}"
   load_balancer_type = "${var.LOAD_BALANCER_TYPE}"
   security_groups    = [aws_security_group.loadbalancer.id]
   subnets            = ["${aws_subnet.subnet_1.id}","${aws_subnet.subnet_2.id}"]
   enable_deletion_protection = "${var.ENABLE_DELETION_PROTECTION}"
  tags = {
    Environment = "development"
  }
  }

  resource "aws_alb_target_group" "webapptargetgroup" {
  name        = "webapptargetgroup"
  port        = "${var.TARGET_PORT}"
  protocol    = "${var.PROTOCOL}"
  target_type = "${var.TARGET_TYPE}"
  vpc_id      = "${aws_vpc.csye6225_a4.id}"
  }

  resource "aws_alb_target_group" "webappbackendtargetgroup" {
  name        = "webappbackendtargetgroup"
  port        = "${var.BACKEND_PORT}"
  protocol    = "${var.PROTOCOL}"
  target_type = "${var.TARGET_TYPE}"
  vpc_id      = "${aws_vpc.csye6225_a4.id}"
}

resource "aws_autoscaling_attachment" "asg_attachment_webapp" {
  autoscaling_group_name = "${aws_autoscaling_group.autoscale_webapp_group.name}"
  alb_target_group_arn   = "${aws_alb_target_group.webapptargetgroup.arn}"
}
resource "aws_autoscaling_attachment" "asg_attachment_webapp_backend" {
  autoscaling_group_name = "${aws_autoscaling_group.autoscale_webapp_group.name}"
  alb_target_group_arn   = "${aws_alb_target_group.webappbackendtargetgroup.arn}"
}


resource "aws_lb_listener" "webapp_lb_listener" {
  load_balancer_arn = "${aws_lb.loadbalancerwebapp.arn}"
  port              = "${var.TARGET_PORT}"
  protocol          = "${var.PROTOCOL}"
  default_action {
    type             = "${var.TYPE}"
    target_group_arn = "${aws_alb_target_group.webapptargetgroup.arn}"
  }
}
resource "aws_lb_listener" "webapp_backend_lb_listener" {
  load_balancer_arn = "${aws_lb.loadbalancerwebapp.arn}"
  port              = "${var.BACKEND_PORT}"
  protocol          = "${var.PROTOCOL}"
  default_action {
    type             = "${var.TYPE}"
    target_group_arn = "${aws_alb_target_group.webappbackendtargetgroup.arn}"
  }
}

resource "aws_route53_record" "route53_webapp" {
  zone_id = "${var.ZONEID}"
  type    = "${var.ZONETYPE}"
  name = "${var.ZONENAME}"
  alias {
    name                   = "${aws_lb.loadbalancerwebapp.dns_name}"
    zone_id                = "${aws_lb.loadbalancerwebapp.zone_id}"
    evaluate_target_health = "${var.EVALUATE_TARGET_HEALTH}"
  }
}






