terraform {
  backend "gcs" {
    bucket = "<KUBEFIRST_STATE_STORE_BUCKET>"
    prefix = "terraform/vault/terraform.tfstate"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.35.0"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.gcp_region
}

provider "vault" {
  skip_tls_verify = "true"
}
