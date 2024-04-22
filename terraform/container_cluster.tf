resource "google_container_cluster" "main_cluster" {
  depends_on = [google_project_service.services.1]

  project  = google_project.main_project.project_id
  name     = "main-cluster"
  location = "us-central1-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  network             = google_compute_network.default.name
  subnetwork          = google_compute_subnetwork.us-central1.name
  deletion_protection = false
}

resource "google_container_node_pool" "main_node_pool" {
  project    = google_project.main_project.project_id
  cluster    = google_container_cluster.main_cluster.name
  name       = "main-node-pool"
  location   = "us-central1-a"
  node_count = 1

  node_config {
    disk_size_gb = 30
    machine_type = "e2-standard-2"

    service_account = google_service_account.main_cluster.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  provisioner "local-exec" {
    command    = "gcloud container clusters get-credentials ${google_container_cluster.main_cluster.name} --zone ${google_container_cluster.main_cluster.location} --project ${self.project}"
    on_failure = continue
  }
}
