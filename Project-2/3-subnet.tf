resource "google_compute_subnetwork" "my_subnetwork" {
  name   = "default-us-central1"
  region = "us-central1"
  ip_cidr_range= "10.0.0.0/18"           # kuberneties node use them
  network= google_compute_network.vpc_network.id

  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "k8s-pods-range"
    ip_cidr_range = "10.48.0.0/14"     # kuberneties pod use them
  }
   secondary_ip_range {
    range_name    = "k8s-services-range"
    ip_cidr_range = "10.52.0.0/28"  # kuberneties service use them for like for ClusterIP 
} 
}