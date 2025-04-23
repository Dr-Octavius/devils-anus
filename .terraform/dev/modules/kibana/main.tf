# Kibana module for the EFK stack

resource "helm_release" "kibana" {
  name       = "kibana"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
  version    = var.kibana_chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.module}/values.yaml", {
      replicas = var.kibana_replicas
    })
  ]

  set {
    name  = "elasticsearchHosts"
    value = "http://elasticsearch-master:9200"
  }

  set {
    name  = "resources.requests.cpu"
    value = "100m"
  }

  set {
    name  = "resources.requests.memory"
    value = "512Mi"
  }

  set {
    name  = "resources.limits.cpu"
    value = "500m"
  }

  set {
    name  = "resources.limits.memory"
    value = "1Gi"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}