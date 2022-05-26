terraform {
  backend "s3" {
      key = "terraform/tfstate.tfstate"
      bucket = "aish-terrabackend"
      region = "us-east-1"
      access_key = ""
      secret_key = ""
  }
}
