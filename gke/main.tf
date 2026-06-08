resource "google_container_cluster" "main" {
  name     = var.cluster_name
  location = var.region

  # Remove default node pool immediately after creation
  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false
}

resource "google_container_node_pool" "main" {
  name       = "${var.cluster_name}-nodes"
  location   = var.region
  cluster    = google_container_cluster.main.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = 50
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
