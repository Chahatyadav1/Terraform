resource "google_bigquery_dataset" "default" {
  dataset_id                  = "foo"
  friendly_name               = "test"
  description                 = "This contain data of GKE microservices logs"
  location                    = "US"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "bar"
  deletion_protection = false
  schema = jsonencode([
    {
      "name": "insertId",
      "type": "STRING",
      "mode": "NULLABLE"
    },
    {
      "name": "timestamp",
      "type": "TIMESTAMP",
      "mode": "NULLABLE"
    },
    {
      "name": "message",
      "type": "STRING",
      "mode": "NULLABLE"
    },
    {
      "name": "container_name",
      "type": "STRING",
      "mode": "NULLABLE"
    }
  ])
  depends_on = [ google_bigquery_dataset.default ]
}
