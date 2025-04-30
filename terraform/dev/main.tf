#----------------------
# main.tf
# - Local Expressions
# - Created Resources
# - Planned Resources
# - Referenced Configs
#----------------------

#----------------------
# Common Expressions
# - locals blocks only
#----------------------
locals {
  namespace = "efk-system"
  nodepool  = "core-np"
}

#--------------------
# Created Resources
# - data blocks only
#--------------------
# Destination Cluster for EFK stack
data "digitalocean_kubernetes_cluster" "dev_cluster" {
  name = "sefire-sgp1-dev"
}

#--------------------------------------------------------
# Planned Resources
# - resource blocks only
# - place here if speed is prioritised; modularise later
#--------------------------------------------------------

#----------------------
# Referenced Configs
# - module blocks only
#----------------------
# Module Config for efk namespace
module "efk" {
  source           = "./modules/kubernetes/namespace" # where to reference module
  namespace        = local.namespace          # Set the target namespace to be created
}

# Module Config for ECK Operator
module "eck" {
  source           = "./modules/eck-operator" # where to reference module
  namespace        = local.namespace          # Set the target namespace to place pod in
  nodepool         = local.nodepool           # Set the target nodepool to place pod in
  name             = "eck-operator"           # Set the appropriate name
  resource_version = "3.0.0"                  # Set the appropriate version
  depends_on = [module.eck]
}