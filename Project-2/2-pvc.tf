resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}
resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

resource "google_compute_network" "vpc_network" {
  project                 = "strategic-well-474303-n7"
  name                    = "vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
  delete_default_routes_on_create = true
  depends_on = [ 
    google_project_service.compute,
    google_project_service.container
   ]
}