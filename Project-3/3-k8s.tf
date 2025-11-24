
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"
  network = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnetwork.name
  remove_default_node_pool = true
  initial_node_count = 1
  deletion_protection = false
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  
  node_count = 1
  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    service_account = var.service_account
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  depends_on = [ google_compute_network.vpc_network,google_compute_subnetwork.subnetwork ]
  
}
