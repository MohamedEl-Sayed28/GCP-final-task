
resource "google_container_cluster" "gke_cluster" {
  name                     = "gke_cluster"
  location                 = "asia-east1-a"
  network                  = google_compute_network.vpc.id
  subnetwork               = google_compute_subnetwork.restricted_subnet.id
  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "192.168.0.0/21"
    services_ipv4_cidr_block = "192.168.8.0/27"
  }
  network_policy {
    enabled = false
  }
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = google_compute_subnetwork.management_subnet.ip_cidr_range
      display_name = "management "
    }
  }

}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "asia-east1-a"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "e2-standard-2"


    service_account = google_service_account.Last-task-Service-Account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

}
