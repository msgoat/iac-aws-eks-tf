# dns_records.tf
# ---------------------------------------------------------------------
# adds all DNS alias records referring to the EKS cluster
# ---------------------------------------------------------------------
#

locals {
  dns_route_names = [
    "traefik",
    "iam",
    "grafana",
    "prometheus",
    "kibana",
    "jaeger",
    "apps"]
}

resource "aws_route53_record" "routes" {
  count = length(local.dns_route_names)
  zone_id = aws_route53_zone.cluster.zone_id
  name = "${local.dns_route_names[count.index]}.${var.cluster_domain_name}"
  type = "A"

  alias {
    name = aws_lb.loadbalancer.dns_name
    zone_id = aws_lb.loadbalancer.zone_id
    evaluate_target_health = false
  }
}