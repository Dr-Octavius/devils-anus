# Elasticsearch Helm Chart

This directory contains configuration for deploying Elasticsearch using the official Elasticsearch Helm chart from Elastic.

## Chart Details

- Chart: [elasticsearch](https://github.com/elastic/helm-charts/tree/master/elasticsearch)
- Repository: https://helm.elastic.co
- Version: 7.17.3 (default, can be configured in Terraform)

## Configuration

The Elasticsearch deployment is configured through Terraform. The main configuration parameters include:

- Number of replicas
- Storage size
- Resource limits and requests
- Security settings

See the Terraform module in `terraform/modules/elasticsearch` for the complete configuration.

## Customization

To customize the Elasticsearch deployment beyond what's provided in the Terraform module, you can:

1. Modify the `values.yaml` template in the Terraform module
2. Override specific values using the `set` blocks in the Terraform configuration
3. Create a custom values file and reference it in the Terraform configuration

## Usage

This chart is deployed automatically when applying the Terraform configuration. You don't need to manually deploy it using Helm.