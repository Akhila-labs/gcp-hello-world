variable "load_balancer_name" {
  description = "The name of the Load Balancer"
  type        = string
}

variable "function_name" {
  description = "The name of the Cloud Function"
  type        = string
}

variable "region" {
  type        = string
  description = "The region where the resources will be deployed."
}