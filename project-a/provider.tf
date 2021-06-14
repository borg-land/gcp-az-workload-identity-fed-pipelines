terraform {
  required_version = "1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.64.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.64.0"
    }
    archive = {
      version = "~> 2.0.0"
    }
  }

  backend "gcs" {
    bucket = "videndum-tmp"
    prefix = "project-b"
  }

}

provider "google" {
  project = var.project_id
}

provider "google-beta" {
  project = var.project_id
}