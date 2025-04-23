# ECK Operator module for the EFK stack

resource "helm_release" "eck_operator" {
  name       = "eck-operator"
  repository = "https://helm.elastic.co"
  chart      = "eck-operator"
  version          = "3.0.0"
  namespace  = var.namespace
  force_update = true
  dependency_update = true

  #-------------------------------------------------
  # To remove on better support for ambient/ if I
  # find a way to make it work on ambient lol
  #-------------------------------------------------
  #   set {
  #     name  = "podAnnotations.traffic\\.sidecar\\.istio\\.io/includeInboundPorts"
  #     value = "*"
  #   }
  #   set {
  #     name  = "podAnnotations.traffic\\.sidecar\\.istio\\.io/excludeInboundPorts"
  #     value = "\"9443\""
  #   }

  set {
    name  = "nodeSelector.nodepool"
    value = "eck-np"
  }

  set {
    name  = "managedNamespaces"
    value = jsonencode({
      (kubernetes_namespace.eck.metadata.0.name) = true
    })
  }

  # Add labels here
  set {
    name  = "podLabels.app"
    value = "eck-operator"
  }

  set {
    name  = "podLabels.version"
    value = "2.14.0"  # Set the appropriate version
  }
}