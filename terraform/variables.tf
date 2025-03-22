variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region where resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "function_name" {
  description = "The name of the Cloud Function"
  type        = string
  default     = "hello-world-function"
}

variable "function_runtime" {
  description = "The runtime for the Cloud Function"
  type        = string
  default     = "python310" # or "nodejs16" for Node.js
}

variable "function_entry_point" {
  description = "The entry point for the Cloud Function"
  type        = string
  default     = "hello_world" # or "helloWorld" for Node.js
}

variable "bucket_name" {
  description = "The name of the GCS bucket for the Cloud Function code"
  type        = string
  default     = "hello-world-bucket"
}

variable "load_balancer_name" {
  description = "The name of the Load Balancer"
  type        = string
  default     = "hello-world-lb"
}
