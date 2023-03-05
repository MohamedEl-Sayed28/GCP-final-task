resource "google_compute_firewall" "allow_firewalles" {
  project       = var.project_id
  name          = "allow_firewalles"
  network       = google_compute_network.vpc.name
  description   = "Creates firewall rules targeting instances"
  source_ranges = ["35.235.240.0/20"]
  direction     = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "433"]
  }

}


