provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

# after first terraform apply
# create a vpc on console with the cidr_block = "192.168.0.0/24" and also include the below code snippet
resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}

# then do 
# terraform import aws_vpc.myvpc2 vpcid_from_console
# and on doing terraform destroy, it will show that it deleted 2 resources.
