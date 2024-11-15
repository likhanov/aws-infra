data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.15.0"

  name = var.project_name
  cidr = "10.0.0.0/16"

  azs             = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  public_subnets  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true

  create_egress_only_igw = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${var.project_name}-default" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${var.project_name}-default" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${var.project_name}-default" }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/internal-elb"     = 1
    "karpenter.sh/discovery"              = var.project_name
  }

  tags = var.common_tags
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
