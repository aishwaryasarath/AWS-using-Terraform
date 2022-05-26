# Provisioning AWS resources using Terraform
Demos on provisioning AWS res

**Table of Contents**
- [1.1. Terraform SetUp](#11-Terraform-Setup)
- [1.2. Terraform 101](#12-Terraform-101)
- [1.3. EC2](#13-EC2)
- [1.4. Modules](#14-Modules)
- [1.5. IAM](#15-IAM)
- [1.6. RDS](#16-RDS)
- [1.7. Terraform Backend](#17-Terraform-Backend)
- [1.8. Dependencies](#18-Dependencies)
- [1.9. Count](#19-Count)
- [1.10 Multiple Environments using multiple variable files](#110-Multiple-environments-using-multiple-variable-files)
- [1.11 Import](#111-Import)
- [1.12 Data Sources](#112-Data-Sources)

## 1.1 Terraform Setup
1. Install Terraform & verfiy
   - On Windows
   ```
   choco install terraform
   terraform -help
   ```
   - On Linux (Centos
   ```
   sudo yum install -y yum-utils
   sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
   sudo yum -y install terraform
   terraform -help
   ```
2. Create an AWS Account - root user
3. Create an IAM user with programmatic access, attach existing Policies, add permissions AdministratorAccess
4. Keep the Access Key ID and Secret Access Key extremely safe.
   - Use an env variables
   ```
   export AWS_ACCESS_KEY_ID=aaaaaabbbbbbcccc # in linux
   setx  AWS_ACCESS_KEY_ID=aaaaaabbbbbbcccc # in windows
   ```
   - AWS CLI
   ```
   aws configure
   ```
   - Using HashiCorp Vault
   - 
## 1.2 Terraform 101

1. Create a simple vpc resource for AWS using the below code and save it as main.tf
```
provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}
```

2. Run terraform init, terraform plan & terraform apply
```
terraform init
terraform plan
terraform apply
```
3. Confirm that it is created
<img width="883" alt="image" src="https://user-images.githubusercontent.com/49971693/170300494-ad92df6f-58f8-48fa-9c69-0cc5e56a28ab.png">
<img width="525" alt="image" src="https://user-images.githubusercontent.com/49971693/170300546-7bea1496-7143-4bcb-bdd2-73f8e4e16765.png">

4. Delete the VPC
```
terraform destroy
```

Confirm
<img width="309" alt="image" src="https://user-images.githubusercontent.com/49971693/170300986-f8eff18a-10ed-44aa-a045-d6009caa646c.png">

### State File
- terraform.tfstate
- terraform.tfstate.backup
- On terraform apply, this file gets updated with the resources added, changed or destroyed.
- Don't delete the state file

### Variables
[Variables-demo](02-variables)

## 1.3 EC2
- [EC2 demo](03-ec2)
- [EIP demo](04-eip)
- [Security Group Demo](05-sg)
- [Dynamic Blocks Demo](06-dynamic-blocks)

## 1.4 Modules

- [Module-demo](07-module)
- [Module Outputs](08-module-outputs)

## 1.5 IAM
- Create an IAM policy on the AWS console and copy the JSON.
- Include the json in the terraform file as shown [here](09-IAM)[09-IAM]

## 1.6 RDS
- [RDS Demo](10-rds)

## 1.7 Terraform Backend
- [Backend Demo](11-backend)

## 1.8 Dependencies
- [Dependencies Demo](12-dependencies)

## 1.9 Count
- [Count simple demo](13-count/simple)
- [Count Advanced demo](13-count/advanced)

## 1.10 Multiple Environments using multiple variable files
- [Env with varfile demo](14-multiple-env-with-varfile)
``` 
terraform plan -var-file=test.tfvars
terraform plan -var-file=prod.tfvars
```

## 1.11 Import
```
provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}
```
```
terraform apply
```
- create a vpc on console with the cidr_block = "192.168.0.0/24" and also add the below code snippet
```
resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}
```
```
terraform import aws_vpc.myvpc2 vpcid_from_console
```
- On terraform destroy, it will show that it deleted 2 resources.

## 1.12 Data Sources
![image](https://user-images.githubusercontent.com/49971693/170597270-fef8b647-9eaa-4264-991b-5c7b0bd594d0.png)
