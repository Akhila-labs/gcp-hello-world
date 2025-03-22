resource "google_compute_global_address" "lb_ip" {
  name = var.load_balancer_name
}

resource "google_compute_backend_service" "hello_world_backend" {
  name = "${var.function_name}-backend"
  backend {
    group = google_compute_region_network_endpoint_group.function_neg.id
  }
  # Remove the health_checks argument
}

resource "google_compute_region_network_endpoint_group" "function_neg" {
  name                  = "${var.function_name}-neg"
  region                = var.region
  cloud_function {
    function = var.function_name
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.function_name}-url-map"
  default_service = google_compute_backend_service.hello_world_backend.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "${var.function_name}-http-proxy"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = "${var.function_name}-http-forwarding-rule"
  target     = google_compute_target_http_proxy.http_proxy.id
  port_range = "80"
  ip_address = google_compute_global_address.lb_ip.address
}
