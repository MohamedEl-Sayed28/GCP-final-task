resource "google_compute_subnetwork" "management_subnet" {
  name                     = "management_subnet"
  ip_cidr_range            = "10.2.0.0/24"
  network                  = google_compute_network.vpc.id
  region                   = var.region
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "restricted_subnet" {
  name                     = "restricted_subnet"
  ip_cidr_range            = "10.3.0.0/24"
  network                  = google_compute_network.vpc.id
  region                   = var.region
  private_ip_google_access = true
}
