terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.availability_zone_name    # "us-east-1"
  #access_key = "AKIAT7EVD2KBERXXXXX"
  #secret_key = "rnucH1/Th8CHKIgPa4W+PCYEEZXXXXXXXXXX"
}

#launch template is OK 

resource "aws_launch_template" "hw36-launch-template" {
  name = "hw36-lt"
  instance_type = var.istance_type_name   #"t2.micro"
  image_id = var.image_id_n               #"ami-0e472ba40eb589f49"
    block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 8
      volume_type = "gp3"
      iops = 3000
    }
  }
  tags = {
      Name = "hw36-lt"
  }
   lifecycle {
     create_before_destroy = true
   }

   network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.sg_hw36_alb.id]
   }
  key_name = "mykeypairsergey"  
  user_data = filebase64("nginx_and_page.sh") 
    
}
#launch template is OK 

resource "aws_vpc" "vpc-for-hw36" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  #enable_dns_hostnames = true
  tags = {
    Name = "vpc-for-hw36"
  }
}
resource "aws_internet_gateway" "gateway-hw36" {
  vpc_id = aws_vpc.vpc-for-hw36.id
  tags = {
    Name = "gateway-hw36"
  }
}

resource "aws_route_table" "route-table-hw36" {
  vpc_id = aws_vpc.vpc-for-hw36.id
   tags = {
    Name = "route-table-hw36"
  }
}
resource "aws_route" "route-gateway-hw36" {
  route_table_id            = aws_route_table.route-table-hw36.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gateway-hw36.id
  depends_on                = [aws_route_table.route-table-hw36]
}

resource "aws_main_route_table_association" "rote-table-association-hw36" {
  vpc_id         = aws_vpc.vpc-for-hw36.id
  route_table_id = aws_route_table.route-table-hw36.id
}


data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet-hw36" {
  count = 2               #"${length(data.aws_availability_zones.available.names)}" 
  vpc_id     = aws_vpc.vpc-for-hw36.id
  cidr_block = "10.0.${count.index+1}.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    Name = "subnet-hw36"
  }
}

resource "aws_security_group" "sg_hw36_alb" {
  name        = "sg_hw36"
  description = "Traffic 80,22 and icmp only internal network"
  vpc_id = aws_vpc.vpc-for-hw36.id
  ingress {
    description      = "22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc-for-hw36.cidr_block]

  }
  ingress {
    description      = "80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc-for-hw36.cidr_block]
  }

  ingress {
    description      = "ICMP"
    from_port        = 0
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = [aws_vpc.vpc-for-hw36.cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "terraform-hw36-alb-security-group"
  }

}

resource "aws_security_group" "sg_hw36_for_alb_only" {
  name        = "sg_hw36_alb_only"
  description = "Traffic 80 only"
  vpc_id = aws_vpc.vpc-for-hw36.id
  ingress {
    description      = "80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "sg_hw36_for_alb_only"
  }

}

resource "aws_alb" "alb-hw36" {
  name            = "terraform-alb-hw36"
  security_groups = ["${aws_security_group.sg_hw36_for_alb_only.id}"]
  subnets         = aws_subnet.subnet-hw36.*.id
  tags = {
    Name = "terraform-alb-hw36"
  }
}
resource "aws_lb_target_group" "traget-group-hw36" {
  name     = "target-group-hw36"
  port     = 80
  protocol = "HTTP"
  #target_type = "ip"
  vpc_id   = aws_vpc.vpc-for-hw36.id
}
resource "aws_lb_listener" "listener-hw36-port80" {
  load_balancer_arn = aws_alb.alb-hw36.arn 
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.traget-group-hw36.arn
  }
}

resource "aws_autoscaling_group" "autoscaling-group-hw36" {
  vpc_zone_identifier  = aws_subnet.subnet-hw36.*.id
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2
  launch_template {
    id      = aws_launch_template.hw36-launch-template.id
    version = "$Latest"
  }
  tag {
    key   = "Name"
    value = "autoscaling-group-hw36"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_attachment" "asg_attachment_hw36" {
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling-group-hw36.id}"
  alb_target_group_arn   = aws_lb_target_group.traget-group-hw36.arn  
}
output "Load-balancer-DNS-name" {
   value = aws_alb.alb-hw36.dns_name
}
output "vpc-id" {
   value = aws_vpc.vpc-for-hw36.id
}