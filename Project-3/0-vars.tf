variable "project_id" {
  default = "smart-cloud-traffic-analyzer"
}

variable "region" {
  default = "us-central1"
}
locals {
  apis = ["iam.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "artifactregistry.googleapis.com",
    "pubsub.googleapis.com",
    "bigquery.googleapis.com",
    "storage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "dataflow.googleapis.com",
    "logging.googleapis.com"
  ]
}
variable "service_account" {
  default = "cloud-traffic-analyzer-sa@smart-cloud-traffic-analyzer.iam.gserviceaccount.com"
}
