provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("${path.module}/secrets.json") 
}

module "cloud_function" {
  source = "./modules/cloud_function"

  function_name        = var.function_name
  function_runtime     = var.function_runtime
  function_entry_point = var.function_entry_point
  bucket_name          = var.bucket_name
  region               = var.region
}

module "load_balancer" {
  source = "./modules/load_balancer"
  region = "us-central1"
  load_balancer_name = var.load_balancer_name
  function_name      = var.function_name
}

module "security" {
  source = "./modules/security"

  function_name = module.cloud_function.function_name
  region        = var.region
}
