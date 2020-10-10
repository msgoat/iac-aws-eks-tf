# ----------------------------------------------------------------------------
# main.tf
# ----------------------------------------------------------------------------

provider "aws" {
  region = var.region_name
  version = "~> 3.0"
}

data aws_route53_zone master {
  zone_id = "Z02498303TWIX5YYKO8BJ"
}

module "network" {
  source = "../.."
  region_name = var.region_name
  organization_name = var.organization_name
  department_name = var.department_name
  parent_domain_name = var.parent_domain_name
  cluster_domain_name = var.cluster_domain_name
  cluster_name = var.cluster_name
  inbound_traffic_cidrs = var.inbound_traffic_cidrs
  network_cidr = var.network_cidr
  project_name = var.project_name
  stage = var.stage
}
