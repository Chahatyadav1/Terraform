terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.8.0"
    }
  }
}

provider "google" {
    project = "strategic-well-474303-n7"
    region  = "us-central1"
}

