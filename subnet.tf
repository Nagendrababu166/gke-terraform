resource "google_compute_subnetwork" "priavtesubnet" {
  name = var.subnetname
  network = google_compute_network.prodvpc.id
  ip_cidr_range = var.subnet_cidr
  private_ip_google_access = var.private_ip_google_access
  region = var.subnetregion

  secondary_ip_range {
    range_name = "k8s-pod-range"
    ip_cidr_range = var.k8s_pod_cidr
  }

  secondary_ip_range {
    range_name = "k8s-service-range"
    ip_cidr_range = var.k8s_service_cidr
  }
}