terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #access_key = "AKIAT7EVD2KBERXXXXX"
  #secret_key = "rnucH1/Th8CHKIgPa4W+PCYEEZXXXXXXXXXX"
}

#launch template is OK 

resource "aws_launch_template" "hw36-launch-template" {
  name = "hw36-lt"
  instance_type = "t2.micro"
  image_id = "ami-0e472ba40eb589f49"
 # security_group_names = [aws_security_group.sg_hw36.name]
 

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
    #subnet_id = [aws_security_group.sg_hw36.vpc_id]
    security_groups = [aws_security_group.sg_hw36_alb.id]
  }
  key_name = "mykeypairsergey"  
  user_data = filebase64("nginx_and_page.sh") 

}

#launch template is OK 

resource "aws_vpc" "vpc-for-hw36" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true


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
  description = "Traffic 80 and 22"
  vpc_id = aws_vpc.vpc-for-hw36.id
  ingress {
    description      = "22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
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
    Name = "terraform-hw36-alb-security-group"
  }

}
resource "aws_alb" "alb-hw36" {
  name            = "terraform-alb-hw36"
  security_groups = ["${aws_security_group.sg_hw36_alb.id}"]
  subnets         = aws_subnet.subnet-hw36.*.id
  
 # ["${aws_subnet.main.*.id}"]
  tags = {
    Name = "terraform-alb-hw36"
  }
}

resource "aws_lb_target_group" "target-group-hw36" {
  name     = "target-group-hw36"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-for-hw36.id
}

resource "aws_lb_listener" "listener-hw36-port80" {
  load_balancer_arn = aws_alb.alb-hw36.arn 
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-hw36.arn
  }
}






# resource "aws_key_pair" "key" {
#   key_name   = "mykey"
#   public_key = file("~/.ssh/mykey.pub")
# }

# resource "aws_instance" "nginx-hw35" {
#   ami           = "ami-04505e74c0741db8d"
#   instance_type = "t2.micro"
#   key_name = aws_key_pair.key.key_name
#   security_groups = [aws_security_group.my-sg-hw35-p1.name]
#   user_data = "${file("inst-nginx.sh")}" 
#   tags = {
#     Name = "nginx-hw35"
#   }

# }

# output "ec2instance" {
#   value = aws_instance.nginx-hw35.public_ip
# }