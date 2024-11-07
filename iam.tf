resource "google_service_account" "gke_cluster_service_account" {
  account_id   = "gke-cluster-service-account"
  display_name = "Service Account for GKE Cluster"
  project      = var.projectid
}
# resource "google_service_account" "gke_node_service_account" {
#   account_id = "gke-node-service-account"
#   display_name = "service account for gke worker nodes"
#   project = var.projectid
# }
resource "google_project_iam_binding" "cluster_admin" {
  project = var.projectid
  role    = "roles/container.clusterAdmin"
  members = [
    "serviceAccount:${google_service_account.gke_cluster_service_account.email}",
  ]
}

resource "google_project_iam_binding" "instance_admin" {
  project = var.projectid
  role    = "roles/compute.instanceAdmin"
  members = [
    "serviceAccount:${google_service_account.gke_cluster_service_account.email}",
  ]
}

# resource "google_project_iam_binding" "workernodesa" {
#   project = var.projectid
#   role = "roles/storage.objectViewer"
#   members = [
#     "serviceAccount:${google_service_account.gke_node_service_account.email}",
#   ]
# }