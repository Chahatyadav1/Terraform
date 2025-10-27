resource "google_storage_bucket" "dataflow_temp" {
  name     = "my-dataflow-temp-bucket-for-gke-logging-project"
  location = "US"
}

resource "google_dataflow_job" "pubsub_to_bq" {
  name              = "pubsub-to-bq-job"
  project           = var.project_id
  region            = "us-central1"
  temp_gcs_location = "gs://${google_storage_bucket.dataflow_temp.name}/temp"
  template_gcs_path = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
  on_delete         = "cancel"

  parameters = {
    # Required parameters for this template only
    inputTopic      = "projects/${var.project_id}/topics/${google_pubsub_topic.gke_topic.name}"
    outputTableSpec = "${var.project_id}:${google_bigquery_dataset.default.dataset_id}.${google_bigquery_table.default.table_id}"
  }

  depends_on = [
    google_storage_bucket.dataflow_temp,
    google_bigquery_table.default,
    google_bigquery_dataset.default,
    google_pubsub_topic.gke_topic
  ]
}
