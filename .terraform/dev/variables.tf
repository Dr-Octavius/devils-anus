#--------------
# variables.tf
#--------------

# All secrets must be passed via variable
# Ref: https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables
variable "do_token" {
  description = "Digital Ocean API token"
  type        = string
  sensitive   = true
}

# Ref: https://stackoverflow.com/questions/15694724/shards-and-replicas-in-elasticsearch
variable "elasticsearch_replicas" {
  description = "Number of Elasticsearch replicas"
  type        = number
  default     = 3
}

# Ref: https://www.elastic.co/blog/filebeat-modiles-access-logs-and-elasticsearch-storage-requirements
variable "elasticsearch_storage_size" {
  description = "Storage size for each Elasticsearch node"
  type        = string
  default     = "30Gi"
}

# Ref: https://www.elastic.co/docs/deploy-manage/production-guidance/kibana-load-balance-traffic#load-balancing-kibana
variable "kibana_replicas" {
  description = "Number of Kibana replicas"
  type        = number
  default     = 1
}

variable "fluentbit_daemonset_enabled" {
  description = "Whether to deploy Fluent Bit as a DaemonSet"
  type        = bool
  default     = true
}