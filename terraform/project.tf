resource "google_project" "main_project" {
  name            = "exp-java-elastic"
  project_id      = "exp-java-elastic-${random_id.project_suffix.hex}"
  folder_id       = var.folder_id
  billing_account = var.billing_account
}
