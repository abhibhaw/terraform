terraform {
  required_version = ">= 1.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "torchcompass-tfstate"
    prefix = "gke"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
