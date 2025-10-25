
---

## 🔹 Prerequisites

Before running this project, you need:

1. **Google Cloud Project**  
   - Create a project in GCP or use an existing one.  

2. **GCS Bucket for Terraform State**  
   - Create a bucket in GCP Console:  
     ```
     gsutil mb -p YOUR_PROJECT_ID -c standard -l us-central1 gs://YOUR_BUCKET_NAME
     ```
   - This bucket will store Terraform state and lock objects.  

3. **Service Account**  
   - Create a service account with permissions:  
     - `Compute Admin` → To create/manage VM  
     - `Service Account User` → Assign service account to VM  
     - `Storage Admin` → Access the GCS bucket for backend  

4. **Generate Service Account Key**  
   - Download the JSON key file for the service account.  
   - Save it locally, e.g., `/Path/to/sa/key/on/localMachine/sa.json`  

5. **Install Terraform**  
   - Ensure Terraform is installed locally. [Install Terraform](https://developer.hashicorp.com/terraform/downloads)  

6. **Set Environment Variable**  
   - Terraform backend will use the service account for authentication:
     
   ```bash
    # Export your service account key path (replace with your own path)
    # export GOOGLE_APPLICATION_CREDENTIALS="/Path/to/sa/key/on/localMachine/sa.json"
