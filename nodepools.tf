resource "google_container_node_pool" "pool1" {
  name = "${var.clustername}-node-pool-1"
  cluster = google_container_cluster.prod.id
  node_count = var.pool1_nodecount
    management {
    auto_repair  = true
    auto_upgrade = true
  }
  node_config {
    preemptible  = false
    machine_type = var.pool1_machinetype
    disk_size_gb = "10"
    labels = {
        role = var.pool1_labels
    }
    service_account = google_service_account.gke_cluster_service_account.email
        oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]  
}
}

resource "google_container_node_pool" "pool2" {
  name = "${var.clustername}-node-pool-2"
  cluster = google_container_cluster.prod.id
  node_count = var.pool2_nodecount
    management {
    auto_repair  = true
    auto_upgrade = true
  }
    autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  node_config {
    preemptible  = false
    machine_type = var.pool2_machinetype
    disk_size_gb = "10"
    labels = {
        role = var.pool2_labels
    }
    service_account = google_service_account.gke_cluster_service_account.email
        oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]  
}
}