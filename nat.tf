resource "google_compute_router_nat" "nat" {
  name = "nat"
  router = google_compute_router.privaterouter.name
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option = "MANUAL_ONLY"
  region = var.region
  subnetwork {
    name = google_compute_subnetwork.priavtesubnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  nat_ips = [google_compute_address.nat.self_link]

}

resource "google_compute_address" "nat" {
  name = "nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  depends_on = [ google_project_service.compute ]
}