resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id
  direction = "EGRESS"
  allow {
    protocol = "tcp"
    ports    = ["443", "80"]
  }
  source_ranges = ["0.0.0.0/0"]
  priority           = 1000
}