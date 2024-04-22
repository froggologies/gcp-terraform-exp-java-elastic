resource "google_service_account" "main_cluster" {
  project    = google_project.main_project.project_id
  account_id = "main-cluster"
}
