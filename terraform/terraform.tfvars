# Required Variables
project_id = "akhila-gcp-1"  # Replace with your actual GCP project ID
region     = "us-central1"          # Replace with your desired GCP region

# Optional Variables (Customize as needed)
function_name        = "hello-world-function"  # Name of the Cloud Function
function_runtime     = "python310"            # Runtime for the Cloud Function (e.g., python310, nodejs16)
function_entry_point = "hello_world"          # Entry point for the Cloud Function
bucket_name          = "hello-world-bucket-akhila-1" # Replace with a unique name
load_balancer_name   = "hello-world-lb"       # Name of the Load Balancer