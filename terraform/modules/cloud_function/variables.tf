variable "function_name" {
  description = "The name of the Cloud Function"
  type        = string
}

variable "function_runtime" {
  description = "The runtime for the Cloud Function"
  type        = string
}

variable "function_entry_point" {
  description = "The entry point for the Cloud Function"
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket for the Cloud Function code"
  type        = string
}

variable "region" {
  description = "The GCP region where resources will be deployed"
  type        = string
}