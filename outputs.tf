output "vpc_id" {
  description = "Id of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnets of the created VPC"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnets of the created VPC"
  value       = module.vpc.private_subnets
}
