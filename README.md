# 📦 Terraform Infrastructure Projects

This repository contains hands-on Terraform projects demonstrating Infrastructure as Code (IaC) principles for provisioning and managing cloud infrastructure.

The goal of this repository is to practice writing clean, modular, and reusable Terraform configurations following industry best practices.

---

## 🚀 What This Repository Covers

- Terraform fundamentals (providers, resources, variables, outputs)
- Infrastructure provisioning using code
- Modular Terraform structure
- State management concepts
- Best practices for clean IaC workflows

Each project folder represents a separate Terraform configuration that can be executed independently.

---

## 🛠 Tech Stack

- Terraform (HCL)
- Google Cloud Platform (GCP)
- Infrastructure as Code (IaC)
- Git for version control

---

## 📁 Repository Structure
Terraform/
├── Project-1/
├── Project-2/
├── Project-3/

Each project contains Terraform configuration files such as:

- `main.tf` – Core resource definitions  
- `variables.tf` – Input variables  
- `outputs.tf` – Output values  
- `terraform.tfvars` – Variable values (if used)

---

## ⚙️ How to Use

1. Clone the repository:

```bash
git clone https://github.com/Chahatyadav1/Terraform.git
cd Terraform
cd Project-1
terraform init
terraform plan
terraform apply
terraform destroy
