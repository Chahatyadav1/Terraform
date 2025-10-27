terraform {
  backend "gcs" {
    bucket  = "gke-tfstate-bucket"
    prefix  = "terraform/state"
  }
}