# Fluent Bit module for the EFK stack

resource "helm_release" "fluentbit" {
  name       = "fluent-bit"
  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluent-bit"
  version    = var.fluentbit_chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.module}/values.yaml", {
      elasticsearch_host = "elasticsearch-master"
      elasticsearch_port = 9200
      daemonset_enabled  = var.fluentbit_daemonset_enabled
    })
  ]

  set {
    name  = "resources.requests.cpu"
    value = "100m"
  }

  set {
    name  = "resources.requests.memory"
    value = "128Mi"
  }

  set {
    name  = "resources.limits.cpu"
    value = "200m"
  }

  set {
    name  = "resources.limits.memory"
    value = "256Mi"
  }

  set {
    name  = "tolerations[0].key"
    value = "node-role.kubernetes.io/master"
  }

  set {
    name  = "tolerations[0].operator"
    value = "Exists"
  }

  set {
    name  = "tolerations[0].effect"
    value = "NoSchedule"
  }
}