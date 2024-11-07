resource "google_compute_router" "privaterouter" {
  name = var.router_name
  network = google_compute_network.prodvpc.id
  region = var.region
}
