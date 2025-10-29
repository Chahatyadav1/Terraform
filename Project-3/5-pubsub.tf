resource "google_pubsub_topic" "gke_topic" {
  name = "gke-topic1"
  message_retention_duration = "89600s"
}
