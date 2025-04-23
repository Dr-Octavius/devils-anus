# Variables for the Elasticsearch module

variable "namespace" {
  description = "Kubernetes namespace for Elasticsearch"
  type        = string
}

variable "nodepool" {
  description = "Kubernetes nodepool for the EFK stack"
  type        = string
  default     = "core-np"
}

variable "elasticsearch_chart_version" {
  description = "Version of the Elasticsearch Helm chart"
  type        = string
  default     = "7.17.3"
}

variable "elasticsearch_replicas" {
  description = "Number of Elasticsearch replicas"
  type        = number
  default     = 3
}

variable "elasticsearch_storage_size" {
  description = "Storage size for each Elasticsearch node"
  type        = string
  default     = "30Gi"
}