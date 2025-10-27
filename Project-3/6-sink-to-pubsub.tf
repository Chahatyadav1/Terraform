
resource "google_logging_project_sink" "my_sink" {
  name        = "my-pubsub-instance-sink"
  destination = "pubsub.googleapis.com/projects/${var.project_id}/topics/${google_pubsub_topic.gke_topic.name}"

  filter = "resource.type=\"k8s_container\" AND resource.labels.cluster_name=\"my-gke-cluster\" AND resource.labels.namespace_name=\"default\" AND resource.labels.container_name=\"busybox\""
  
  unique_writer_identity = true

  depends_on = [google_pubsub_topic.gke_topic]
}

resource "google_pubsub_topic_iam_member" "sink_pubsub_publisher" {
  topic  = google_pubsub_topic.gke_topic.name
  role   = "roles/pubsub.publisher"
  member = google_logging_project_sink.my_sink.writer_identity

  depends_on = [google_logging_project_sink.my_sink]
}
