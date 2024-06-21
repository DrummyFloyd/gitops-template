terraform {
  backend "s3" {
    endpoint = "nyc3.digitaloceanspaces.com"
    key      = "terraform/vault/terraform.tfstate"
    bucket   = "<KUBEFIRST_STATE_STORE_BUCKET>"
    // Don't change this.
    region = "us-east-1"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    vault = {
      source = "hashicorp/vault"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "17.1.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "vault" {
  skip_tls_verify = "true"
}
