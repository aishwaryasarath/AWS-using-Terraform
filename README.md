# AWS-using-Terraform
Demos on provisioning AWS res

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

   
