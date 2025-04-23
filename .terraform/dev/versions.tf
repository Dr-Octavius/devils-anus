#----------------------------
# Terraform Configuration
# - for terraform block only
#----------------------------

# Ref: https://developer.hashicorp.com/terraform/language/terraform
terraform {
  cloud {
    organization = "sefire"
    workspaces {
      name = "cosmos-sgp1-dev"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.50.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.36.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
  }
}