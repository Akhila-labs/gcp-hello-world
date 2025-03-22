output "function_name" {
  description = "The name of the Cloud Function"
  value       = google_cloudfunctions_function.hello_world.name
}