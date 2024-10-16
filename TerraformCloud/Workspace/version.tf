terraform {

  #   required_version = ">= 1.7.4"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.53.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
