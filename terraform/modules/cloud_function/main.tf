resource "google_storage_bucket" "function_bucket" {
  name     = var.bucket_name
  location = var.region
}

resource "google_storage_bucket_object" "function_archive" {
  name   = "function.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "${path.module}/../cloud_function/function.zip"
}

resource "google_cloudfunctions_function" "hello_world" {
  name        = var.function_name
  runtime     = var.function_runtime
  entry_point = var.function_entry_point

  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_archive.name

  trigger_http = true
  region       = var.region
}