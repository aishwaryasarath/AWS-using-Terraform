
provider "aws" {
    region = "us-east-1"
  
}

module "ec2module" {
    source = "./ec2-module"
    ec2name = "Name from module"
}

output "module_output" {
    value = module.ec2module.instance_id
}
