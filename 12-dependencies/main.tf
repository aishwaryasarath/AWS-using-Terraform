provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {

    ami = "ami-0022f774911c1d690"
    instance_type = "t2.micro"

    depends_on = [
      aws_instance.db
    ]
  
}

resource "aws_instance" "db" {

    ami = "ami-0022f774911c1d690"
    instance_type = "t2.micro"
  
}
