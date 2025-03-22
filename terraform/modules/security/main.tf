resource "google_cloudfunctions_function_iam_binding" "invoker" {
  cloud_function = var.function_name
  role           = "roles/cloudfunctions.invoker"
  members        = ["allUsers"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "${var.function_name}-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}