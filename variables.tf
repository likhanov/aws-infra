variable "region" {
  description = "AWS region for deploying resources"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prod)"
  type        = string
}
