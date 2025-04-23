#--------------------
# Main Configuration
# - data blocks
# - resources blocks
# - modules blocks
# - locals blocks
#--------------------
data "digitalocean_kubernetes_cluster" "dev_cluster" {
  name = "sefire-sgp1-dev"
}

# Create a namespace for the EFK stack
resource "kubernetes_namespace" "efk" {
  metadata {
    name = var.namespace
  }
}

# Module for Elasticsearch deployment
module "elasticsearch" {
  source    = "./modules/elasticsearch"
  namespace = kubernetes_namespace.efk.metadata[0].name
  # Add other variables as needed
}

# Module for Kibana deployment
module "kibana" {
  source    = "./modules/kibana"
  namespace = kubernetes_namespace.efk.metadata[0].name
  # Add other variables as needed
  depends_on = [module.elasticsearch]
}

# Module for Fluent Bit deployment
module "fluentbit" {
  source    = "./modules/fluentbit"
  namespace = kubernetes_namespace.efk.metadata[0].name
  # Add other variables as needed
  depends_on = [module.elasticsearch]
}