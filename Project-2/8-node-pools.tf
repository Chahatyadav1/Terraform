resource "google_service_account" "kubernetes" {
account_id   = "kubernetes-node-pool"
}
resource "google_container_node_pool" "general" {
  name = "general"
  cluster = google_container_cluster.primary.name
  location  = "us-central1"
  node_count = 1

  management {
    auto_repair = true
    auto_upgrade = true
  }
  node_config {
    preemptible = false
    machine_type = "e2-medium"
    service_account = "github-actions@strategic-well-474303-n7.iam.gserviceaccount.com"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}