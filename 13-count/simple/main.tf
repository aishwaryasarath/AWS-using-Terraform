provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "ec2" {
    ami = "ami-0022f774911c1d690"
    instance_type = "t2.micro"
    count = 3
  
}
