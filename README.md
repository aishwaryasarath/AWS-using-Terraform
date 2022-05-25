# Provisioning AWS resources using Terraform
Demos on provisioning AWS res

**Table of Contents**
- [1.1. Terraform-SetUp](#11-Terraform-Setup)
- [1.2. Terraform-101](#12-Terraform-101)



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
