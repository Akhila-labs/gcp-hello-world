# gcp-hello-world
1. Prerequisites:

Authenticate with GCP
Use a service account key or gcloud CLI to authenticate Terraform with your GCP project. gcloud auth application-default login # copy it in browser and copy the code and paste in cloud shell. GCP account and project set up. Verify GCP Authentication Ensure that you are authenticated with Google Cloud and have the necessary permissions.

Steps: Check if you are logged in: gcloud auth list

If no account is listed,

log in using: gcloud auth login

Set the correct project: gcloud config set project akhila-gcp-1

Verify application default credentials: gcloud auth application-default login

This command ensures that Terraform can use your credentials to authenticate with GCP.
Check permissions: Ensure the account you are using has the necessary permissions to create and manage resources in GCP. The following roles are typically required: roles/editor roles/iam.securityAdmin roles/compute.networkAdmin

GCP credentials configured locally.

terraform installation process
https://developer.hashicorp.com/terraform/install


Terraform installed.

2. Testing Instructions:

Provide the Load Balancer IP or URL to test the "Hello World" function.

3. ZIP command

zip the Cloud Function code:

cd cloud_function
zip -r function.zip main.py requirements.txt # For Python



**4. Testing the Cloud Function Locally**

Before deploying, you can test the Cloud Function locally to ensure it works as expected.
Python

cd cloud_function

a. Install the dependencies:
pip install -r requirements.txt

b. Run the function locally:
functions-framework --target hello_world

c. Test the function by visiting http://localhost:8080 in your browser or using curl:

curl http://localhost:8080

**5. Deployment Instructions:**

terraform init
terraform plan
terraform apply

**6.Destroy Instructions:**
terraform destroy

**7. If you want confirmation before deleting each file inside the directory, use:**
rm -ri cloud_function_basic_project
