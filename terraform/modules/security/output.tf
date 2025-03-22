output "cloud_function_invoker_role" {
  description = "The IAM role binding for the Cloud Function invoker"
  value       = google_cloudfunctions_function_iam_binding.invoker.role
}

output "firewall_rule_name" {
  description = "The name of the firewall rule"
  value       = google_compute_firewall.allow_http.name
}
