# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "EffulgenceTech"
    workspaces {
      name = "NewTerraformCloud"
    }
  }
}


terraform {

  # required_version = ">= 1.6.6"
  required_version = ">= 1.1.0, < 2.0.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.53.0"
    }
  }
}

# Use the TFE_TOKEN environment variable for TFE authentication
