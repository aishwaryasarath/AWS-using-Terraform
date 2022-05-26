
variable "ec2name" {

    type = string
  
}

resource "aws_instance" "ec2" {

    ami = "ami-0022f774911c1d690"
    instance_type = "t2.micro"
    tags = {
      "Name" = var.ec2name
    }
  
}
