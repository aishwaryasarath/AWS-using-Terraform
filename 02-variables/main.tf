

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

variable "vpcname" {
    type = string
    default = "myvpc" 
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string)
  default = [ "Value1","Value2" ]
}

variable "mymap" {
    type = map(any)
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
  
}

variable "inputname" {
    type = string
    description = "Set the name of the VPC: "
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
      Name = var.vpcname 
      Name2 = var.mylist[0] // from list
      Name3 = var.mymap["Key1"] // from map
      Name4 = var.inputname // from input variable
    }
  
}

output "vpcid" {
    value = aws_vpc.myvpc.id 
}

// similar to list but can support multiple datatypes
variable "mytuple" {
    type = tuple([string, number, string])
    default = ["vpc",1,"ec2"]
}

// similar to maps but can support multiple datatypes
variable "myobject" {
    type = object({name = string, port = list(number) })
    default = {
      name = "AR"
      port = [ 22, 25, 80]
    }
}

