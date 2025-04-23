# Elasticsearch module for the EFK stack

resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  version    = var.elasticsearch_chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.module}/values.yaml", {
      replicas     = var.elasticsearch_replicas
      storage_size = var.elasticsearch_storage_size
    })
  ]

  set {
    name  = "antiAffinity"
    value = "soft"
  }

  set {
    name  = "esJavaOpts"
    value = "-Xmx1g -Xms1g"
  }

  set {
    name  = "resources.requests.cpu"
    value = "100m"
  }

  set {
    name  = "resources.requests.memory"
    value = "1Gi"
  }

  set {
    name  = "resources.limits.cpu"
    value = "1000m"
  }

  set {
    name  = "resources.limits.memory"
    value = "2Gi"
  }
}