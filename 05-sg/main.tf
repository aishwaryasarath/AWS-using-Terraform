terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.15.1"
    }
  }
}

provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "ec2" {

    ami = "ami-0022f774911c1d690"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
  
}

resource "aws_security_group" "webtraffic" {

    name = "Allow HTTPS"
    ingress {
        
    cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 443
      protocol = "TCP"
      to_port = 443

    }
    egress  {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 443
      protocol = "TCP"
      to_port = 443
    } 
}
