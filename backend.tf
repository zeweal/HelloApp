terraform {
  backend "s3" {
    bucket       = "hello-devops-terraform-state-956646644379"
    key          = "eks/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}

