# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "EffulgenceTech"
    workspaces {
      name = "project_onboarding_ws"
    }
  }
}


terraform {

  # required_version = ">= 1.6.6"
  required_version = ">= 1.1.0, < 2.0.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.59.0"
    }
  }
}

# Use the TFE_TOKEN environment variable for TFE authentication
