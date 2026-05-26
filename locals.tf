locals {
  project_name = "enterprise"

  naming_prefix = "${local.project_name}-${var.environment}"

  common_tags = {
    environment = var.environment
    project     = "Enterprise-Terraform-Environment-Management"
    managed_by  = "Terraform"
  }
}
