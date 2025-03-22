# Create a GCS bucket for the Cloud Function code
resource "google_storage_bucket" "function_bucket" {
  name     = var.bucket_name
  location = var.region
}

# Upload the Cloud Function code (function.zip) to the GCS bucket
resource "google_storage_bucket_object" "function_archive" {
  name   = "function.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "${path.module}/../../cloud_function/function.zip" # Corrected path
  depends_on = [google_storage_bucket.function_bucket] # Ensure bucket is created first
}

# Deploy the Cloud Function
resource "google_cloudfunctions_function" "hello_world" {
  name        = var.function_name
  runtime     = var.function_runtime
  entry_point = var.function_entry_point

  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_archive.name

  trigger_http = true
  region       = var.region
}
