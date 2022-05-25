# Provisioning AWS resources Terraform
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

   
