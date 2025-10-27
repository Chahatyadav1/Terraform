resource "google_artifact_registry_repository" "my_repository" {
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
  depends_on = [google_project_service.api]
}