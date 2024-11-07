provider "google" {
  project = var.projectid
  region = var.region
}
terraform {
  backend "gcs" {
    bucket = "k8s-prod-nginx-tfstate"
    prefix = "terrform/state"
  }
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 6.8.0"
    }
  }
}