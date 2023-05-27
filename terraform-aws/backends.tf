terraform {
  cloud {
    organization = "pankaj-tf-aws"
    workspaces {
      name = "terraform-dev"
    }
  }
}