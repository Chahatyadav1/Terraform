provider "google"{
    project ="gcp-project-name-474303-n7"
    region="us-central1"
    zone = "us-central1-a"
    credentials = " /Path/to/sa/key/on/localMachine/sa.json "
}
terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "7.4.0"
    }
  }
}


resource "google_compute_instance" "default" {
  name         = "terraform-vm-instance-day-1"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default" 

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hello Dostoh !  > /test.txt"

  service_account {
   
    email  = "Sa.account.email.iam.gserviceaccount.com"

    scopes = ["cloud-platform"]
  }
}
