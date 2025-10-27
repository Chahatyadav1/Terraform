resource "google_project_service" "api" {
  project = var.project_id
  for_each = toset(local.apis)
  service = each.key
  disable_on_destroy = false
}

resource "google_compute_network" "vpc_network" {
  name                    = "traffic-analyzer-vpc"
  auto_create_subnetworks = false
  mtu=1460
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "pod"
    ip_cidr_range = "10.3.10.0/24"
  }
  secondary_ip_range {
    range_name = "service"
    ip_cidr_range = "10.3.20.0/24"
  }
  lifecycle {
    ignore_changes = [
      # Ignore all fields that are causing Terraform to try to update in-use subnet
      secondary_ip_range,
      ip_cidr_range
    ]
  }
}

resource "google_compute_route" "default" {
  name        = "network-route"
  dest_range  = "0.0.0.0/0"
  network     = google_compute_network.vpc_network.name
  next_hop_gateway = "default-internet-gateway"
  priority    = 100
}

resource "google_compute_firewall" "allow-ssh-http" {
  name    = "allow-ssh-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000","22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
