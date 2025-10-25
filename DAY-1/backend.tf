
terraform {
  backend "gcs" {
    bucket  = "chahat-demo-bucket-12345"
    prefix  = "terraform/state"      # path inside  the bucket 
  }
} 
