#------------------------
# Variable Definitions
# - variable blocks only
#------------------------

variable "namespace" {
  description = "Kubernetes namespace for Fluent Bit"
  type        = string
}

variable "fluentbit_chart_version" {
  description = "Version of the Fluent Bit Helm chart"
  type        = string
  default     = "0.20.8"
}

variable "fluentbit_daemonset_enabled" {
  description = "Whether to deploy Fluent Bit as a DaemonSet"
  type        = bool
  default     = true
}