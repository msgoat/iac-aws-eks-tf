# hosted_zone.tf
#----------------------------------------------------------------
# creates a public hosted zone for all DNS names referring to the EKS cluster
#----------------------------------------------------------------
#

# retrieve public parent hosted zone
data aws_route53_zone parent {
  name = var.parent_domain_name
  private_zone = false
}

# create public hosted zone for EKS cluster
resource aws_route53_zone cluster {
  name = var.cluster_domain_name
  tags = local.common_tags
}

# create NS record with nameservers of newly created zone in subdomain zone
resource "aws_route53_record" "nameservers"  {
  zone_id = data.aws_route53_zone.parent.id
  name = var.cluster_domain_name
  type = "NS"
  records = [for ns in aws_route53_zone.cluster.name_servers : "${ns}."]
  ttl = 3600
}
