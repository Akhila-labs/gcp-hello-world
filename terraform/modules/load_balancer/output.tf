output "load_balancer_ip" {
  description = "The IP address of the load balancer"
  value       = google_compute_global_address.lb_ip.address
}

output "load_balancer_url" {
  description = "The URL of the load balancer"
  value       = "http://${google_compute_global_address.lb_ip.address}"
}
