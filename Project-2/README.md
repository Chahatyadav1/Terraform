# Custom GKE Cluster with VPC, Subnets, NAT & Firewall

Terraform project to create a **custom GKE cluster** with networking:

- **VPC** with private/public subnets  
- **Secondary IP ranges** for Pods & Services  
- **NAT Gateway** for private node internet access  
- **Firewall rules** for secure traffic  
- **Remote backend** for Terraform state  

---

## Architecture

                         Internet
                            |
                        [Cloud NAT]
                            |
                 +----------------------+
                 |      VPC Network     |
                 +----------------------+
                   |                |
            Public Subnet       Private Subnet
             (Optional)           (GKE Nodes)
                                   |
                             +------------+
                             | GKE Cluster|
                             +------------+
                                   |
                  ---------------------------------
                  |                               |
           Node Primary IPs (10.0.0.0/18)     Firewall Rules
                  |
        -----------------------------
        |                           |
  Pods (10.48.0.0/14)           Services (10.52.0.0/28)
(ClusterIP / LoadBalancer)          (ClusterIP)



---

## Prerequisites
- Terraform >= 1.5  
- Google Cloud SDK  
- GCP Project with Compute Admin, Kubernetes Engine Admin, Service Account User, Storage Admin  
- Service account key JSON  

---

## Setup

```bash
git clone https://github.com/chahatyadav1/Terraform.git
cd Project-2 

export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account-key.json"

terraform init
terraform plan
terraform apply

