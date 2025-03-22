# gcp-hello-world
gcp-hello-world/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   ├── modules/
│       ├── cloud_function/
│           ├── main.tf
│           ├── variables.tf
│           ├── outputs.tf
├── cloud_function/
│   ├── main.py
│   ├── requirements.txt
│   ├── function.zip
├── README.md


# Prerequisites:
enable required API
Compute Engine API
Cloud Functions API

Authenticate with GCP
Use a service account key or gcloud CLI to authenticate Terraform with your GCP project. gcloud auth application-default login # copy it in browser and copy the code and paste in cloud shell. GCP account and project set up. Verify GCP Authentication Ensure that you are authenticated with Google Cloud and have the necessary permissions.
Ensure that you are authenticated with Google Cloud and have the necessary permissions.

Steps:
Check if you are logged in:
gcloud auth list
If no account is listed, log in using:
gcloud auth login
Set the correct project:
gcloud config set project akhila-gcp-1
Verify application default credentials:
gcloud auth application-default login
This command ensures that Terraform can use your credentials to authenticate with GCP.

# Steps to Create a Service Account Key:
Go to the Google Cloud Console.
Navigate to IAM & Admin > Service Accounts.
Create a new service account or select an existing one.
Click on the service account, then go to the Keys tab.
Click Add Key > Create New Key and choose JSON.
Download the key file and save it as creds.json in your Terraform directory.

# Check permissions: 
Ensure the account you are using has the necessary permissions to create and manage resources in GCP. The following roles are typically
required: roles/editor roles/iam.securityAdmin roles/compute.networkAdmin

GCP credentials configured locally.

# terraform installation process
https://developer.hashicorp.com/terraform/install
Terraform installed.

# Testing Instructions:

Provide the Load Balancer IP or URL to test the "Hello World" function.

# If you're using Python, you need a requirements.txt file to list the dependencies.

File: cloud_function/requirements.txt
List your Python dependencies here
flask==2.3.2
functions-framework==3.*

 File: cloud_function/main.py
import functions_framework

@functions_framework.http
def hello_world(request):
    return "Hello World!"

# Zip the Cloud Function Code
Before deploying, zip the Cloud Function code along with the requirements.txt file:
zip the Cloud Function code:
cd cloud_function
zip -r function.zip main.py requirements.txt # For Python


# Testing the Cloud Function Locally
Testing Locally
1. Navigate to the `cloud_function` directory.
2. Install dependencies:
   - For Python: `pip install -r requirements.txt`
   - For Node.js: `npm install`
3. Run the function locally:
   - For Python: `functions-framework --target hello_world`
   - For Node.js: `npx functions-framework --target=helloWorld`

# Deploying the Function
1. Zip the Cloud Function code:
   ```bash
   cd cloud_function
   zip -r function.zip main.py requirements.txt # For Python
   zip -r function.zip index.js package.json node_modules # For Node.js

# Deployment Instructions:
cd terraform
terraform init
terraform validate
terraform plan
terraform apply

# Deploy the Cloud Function
Now that the function.zip file exists, you can deploy the Cloud Function using the --source flag with the .zip file:
gcloud functions deploy hello-world-function \
  --runtime=python310 \
  --trigger-http \
  --entry-point=hello_world \
  --region=us-central1 \
  --source=./function.zip \
  --project=akhila-gcp-1
# Verify the Cloud Function Creation
Ensure the Cloud Function is created successfully before applying the IAM policy. You can check this in the Google Cloud Console or using the gcloud command:
gcloud functions describe hello-world-function --region=us-central1

# You can use the gcloud functions describe command to get the URL of your Cloud Function.

Run the Command:
gcloud functions describe hello-world-function \
  --region=us-central1 \
  --project=akhila-gcp-1

# Look for the httpsTrigger.url Field

In the output, you’ll see a field called httpsTrigger.url. This is the URL of your Cloud Function.
Example output:
  url: https://us-central1-akhila-gcp-1.cloudfunctions.net/hello-world-function
  Using a Web Browser:
Paste the URL into your browser’s address bar and press Enter.
You should see the response Hello World!.

Using curl:
Run the following command in your terminal:
curl https://us-central1-akhila-gcp-1.cloudfunctions.net/hello-world-function
You should see the response Hello World!.

# Destroy Instructions
terraform destroy

# If you want confirmation before deleting each file inside the directory, use
rm -ri cloud_function_basic_project
