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