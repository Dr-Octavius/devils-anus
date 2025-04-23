# Variables for the Kibana module

variable "namespace" {
  description = "Kubernetes namespace for Kibana"
  type        = string
}

variable "kibana_chart_version" {
  description = "Version of the Kibana Helm chart"
  type        = string
  default     = "7.17.3"
}

variable "kibana_replicas" {
  description = "Number of Kibana replicas"
  type        = number
  default     = 1
}