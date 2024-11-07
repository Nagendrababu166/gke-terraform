resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

resource "google_compute_network" "prodvpc" {
  name = var.vpcname
  routing_mode = var.routingmode
  auto_create_subnetworks = false
  delete_default_routes_on_create = false
  depends_on = [ 
    google_project_service.compute,
    google_project_service.container
   ]
}