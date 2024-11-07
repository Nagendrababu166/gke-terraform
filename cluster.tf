resource "google_container_cluster" "prod" {
  name = var.clustername
  network = google_compute_network.prodvpc.id
  subnetwork = google_compute_subnetwork.priavtesubnet.id
  location = var.clusterzone
  initial_node_count = var.cluster_initial_node_count
  remove_default_node_pool = true
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  networking_mode          = "VPC_NATIVE"
   ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }
    private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
    workload_identity_config {
    workload_pool = "${var.projectid}.svc.id.goog"
  }
  
}