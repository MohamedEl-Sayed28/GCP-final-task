resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name                    = "vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}


