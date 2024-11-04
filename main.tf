module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Managed-by  = "terraform"
  }
}
