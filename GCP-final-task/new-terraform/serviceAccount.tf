# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account

resource "google_service_account" "Last-task-Service-Account" {
  account_id   = "muhammed-1"
  display_name = "Last-task-Service-Account"
  description  = "It's my service account"
}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_binding

resource "google_project_iam_binding" "iam-project" {
  project = var.project_id
  role    = "roles/container.admin"
  members = ["serviceAccount:${google_service_account.Last-task-Service-Account.email}"]
}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_binding

resource "google_project_iam_binding" "project_storage_iam" {
  project = var.project_id
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.Last-task-Service-Account.email}"]
}
