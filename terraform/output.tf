output "function_name" {
  description = "The name of the Cloud Function"
  value       = module.cloud_function.function_name
}

output "cloud_function_url" {
  description = "The URL of the deployed Cloud Function"
  value       = module.cloud_function.function_url
}

output "load_balancer_ip" {
  description = "The IP address of the load balancer"
  value       = module.load_balancer.load_balancer_ip
}
