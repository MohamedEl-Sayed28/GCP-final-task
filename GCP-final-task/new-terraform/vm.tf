resource "google_compute_instance" "vm_instance" {
  name         = "vm_instance"
  machine_type = "e2-micro"
  zone         = "asia-east1-b"

  tags = ["muhammed"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20
    }
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.management_subnet.name
  }

  service_account {
    email  = google_service_account.Last-task-Service-Account.email
    scopes = ["cloud-platform"]
  }
}


