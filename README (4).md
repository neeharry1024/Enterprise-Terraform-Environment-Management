# Enterprise-Terraform-Environment-Management

## Project Overview

This project demonstrates enterprise-grade Terraform practices for managing Azure infrastructure across multiple environments.

Environments supported:

- dev
- test
- prod

Features included:

- Terraform Workspaces
- tfvars Management
- Sensitive Variables
- Validation Rules
- Locals
- Conditional Resources
- Naming Conventions
- Modular Design
- Outputs
- Azure Infrastructure Deployment

---

# Architecture

Resources created:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Public IP
- Linux Virtual Machine
- Storage Account

---

# Project Structure

```bash
Enterprise-Terraform-Environment-Management/
│
├── environments/
│   ├── dev.tfvars
│   ├── test.tfvars
│   └── prod.tfvars
│
├── modules/
│   └── linux-vm/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── versions.tf
├── terraform.tfvars.example
├── README.md
├── .gitignore
└── terraform-workspace.sh
```

---

# Prerequisites

Install:

- Terraform
- Azure CLI
- Git

Login to Azure:

```bash
az login
```

Verify subscription:

```bash
az account show
```

---

# Step 1 — Clone Repository

```bash
git clone <YOUR_GITHUB_REPO_URL>
cd Enterprise-Terraform-Environment-Management
```

---

# Step 2 — Initialize Terraform

```bash
terraform init
```

---

# Step 3 — Validate Configuration

```bash
terraform validate
```

---

# Step 4 — Create Terraform Workspaces

Create development workspace:

```bash
terraform workspace new dev
```

Create test workspace:

```bash
terraform workspace new test
```

Create production workspace:

```bash
terraform workspace new prod
```

List workspaces:

```bash
terraform workspace list
```

---

# Step 5 — Configure tfvars Files

## dev.tfvars

```hcl
environment = "dev"
location = "centralindia"
vm_size = "Standard_B1s"

admin_username = "azureuser"
admin_password = "AdminPassword123!"

enable_public_ip = true
enable_storage_account = false
```

## test.tfvars

```hcl
environment = "test"
location = "centralindia"
vm_size = "Standard_B1s"

admin_username = "azureuser"
admin_password = "TestPassword123!"

enable_public_ip = true
enable_storage_account = true
```

## prod.tfvars

```hcl
environment = "prod"
location = "centralindia"
vm_size = "Standard_B1s"

admin_username = "azureuser"
admin_password = "ProdPassword123!"

enable_public_ip = false
enable_storage_account = true
```

---

# Step 6 — Deploy DEV Environment

```bash
terraform workspace select dev

terraform apply -var-file="environments/dev.tfvars"
```

---

# Step 7 — Deploy TEST Environment

```bash
terraform workspace select test

terraform apply -var-file="environments/test.tfvars"
```

---

# Step 8 — Deploy PROD Environment

```bash
terraform workspace select prod

terraform apply -var-file="environments/prod.tfvars"
```

---

# Important Terraform Features Used

## 1. Validation Rules

```hcl
validation {
  condition = contains(["dev", "test", "prod"], var.environment)
  error_message = "Environment must be dev, test, or prod."
}
```

## 2. Sensitive Variables

```hcl
variable "admin_password" {
  sensitive = true
}
```

## 3. Conditional Resources

```hcl
count = var.enable_storage_account ? 1 : 0
```

## 4. Locals

```hcl
locals {
  project_name = "enterprise"
}
```

## 5. Naming Convention

```hcl
name = "${local.naming_prefix}-vnet"
```

---

# Common Issues & Fixes

## Azure Policy Restriction

Error:

```text
RequestDisallowedByAzure
```

Fix:

Use an allowed Azure region such as:

```hcl
location = "centralindia"
```

---

## Storage Account Already Taken

Error:

```text
StorageAccountAlreadyTaken
```

Fix:

Use random_string resource.

```hcl
resource "random_string" "storage_suffix" {
  length  = 5
  special = false
  upper   = false
}
```

---

## VM Quota Exceeded

Error:

```text
OperationNotAllowed
```

Fix:

Use smaller VM sizes:

```hcl
vm_size = "Standard_B1s"
```

---

# Destroy Infrastructure

DEV:

```bash
terraform destroy -var-file="environments/dev.tfvars"
```

TEST:

```bash
terraform destroy -var-file="environments/test.tfvars"
```

PROD:

```bash
terraform destroy -var-file="environments/prod.tfvars"
```

---

# GitHub Commands

```bash
git init

git add .

git commit -m "Initial commit"

git branch -M main

git remote add origin <repo-url>

git push -u origin main
```

---

# Enterprise Concepts Covered

| Feature | Status |
|---|---|
| Terraform Workspaces | ✅ |
| tfvars Management | ✅ |
| Environment Isolation | ✅ |
| Validation Rules | ✅ |
| Sensitive Variables | ✅ |
| Conditional Resources | ✅ |
| Modules | ✅ |
| Outputs | ✅ |
| Azure Infrastructure | ✅ |

---

# Interview Questions

1. What are Terraform workspaces?
2. What are tfvars files?
3. What are Terraform locals?
4. What are conditional resources?
5. How do you manage multiple environments?
6. What are sensitive variables?
7. Why use Terraform modules?
8. How do Azure quotas affect deployment?

---

# Author

Enterprise Terraform Environment Management Project
