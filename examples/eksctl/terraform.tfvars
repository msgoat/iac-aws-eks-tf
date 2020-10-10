# terraform.tfvars
# ---------------------------------------------------------------------------
# Provides values for all variables used in this demo which will be picked
# up automatically when running Terraform.
# ---------------------------------------------------------------------------
region_name = "eu-central-1"
organization_name = "msg systems"
department_name = "Automotive Technology"
project_name = "CloudTrain"
stage = "dev"
network_cidr = "10.31.0.0/16"
inbound_traffic_cidrs = ["0.0.0.0/0"]
cluster_name = "cloudtrain"
parent_domain_name = "k8s.aws.msgoat.eu"
cluster_domain_name = "cloudtrain.k8s.aws.msgoat.eu"

