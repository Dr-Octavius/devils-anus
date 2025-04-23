#------------------------
# Provider Configuration
# - provider blocks only
#------------------------

# Digital Ocean Provider
provider "digitalocean" {
  token = var.do_token
}

# Helm Charts Provider
provider "helm" {
  kubernetes {
    host  = data.digitalocean_kubernetes_cluster.dev_cluster.endpoint
    token = data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.token
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.cluster_ca_certificate
    )
  }
}

# Kubernetes Provider
provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.dev_cluster.endpoint
  token = data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.cluster_ca_certificate
  )
}