# Fluent Bit Helm Chart

This directory contains configuration for deploying Fluent Bit using the official Fluent Bit Helm chart.

## Chart Details

- Chart: [fluent-bit](https://github.com/fluent/helm-charts/tree/main/charts/fluent-bit)
- Repository: https://fluent.github.io/helm-charts
- Version: 0.20.8 (default, can be configured in Terraform)

## Configuration

The Fluent Bit deployment is configured through Terraform. The main configuration parameters include:

- Deployment type (DaemonSet by default)
- Resource limits and requests
- Elasticsearch connection details
- Log collection and processing configuration

See the Terraform module in `terraform/modules/fluentbit` for the complete configuration.

## Customization

To customize the Fluent Bit deployment beyond what's provided in the Terraform module, you can:

1. Modify the `values.yaml` template in the Terraform module
2. Override specific values using the `set` blocks in the Terraform configuration
3. Create a custom values file and reference it in the Terraform configuration

## Usage

This chart is deployed automatically when applying the Terraform configuration. You don't need to manually deploy it using Helm.

## How Fluent Bit Works

Fluent Bit is deployed as a DaemonSet by default, which means it runs on every node in the Kubernetes cluster. It collects logs from the following sources:

1. Container logs from `/var/log/containers/*.log`
2. Kubernetes metadata is added to the logs using the Kubernetes filter
3. Logs are then sent to Elasticsearch with the Logstash format

The configuration can be customized to collect logs from additional sources or to send logs to different destinations.