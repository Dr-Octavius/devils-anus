# Kibana Helm Chart

This directory contains configuration for deploying Kibana using the official Kibana Helm chart from Elastic.

## Chart Details

- Chart: [kibana](https://github.com/elastic/helm-charts/tree/master/kibana)
- Repository: https://helm.elastic.co
- Version: 7.17.3 (default, can be configured in Terraform)

## Configuration

The Kibana deployment is configured through Terraform. The main configuration parameters include:

- Number of replicas
- Resource limits and requests
- Security settings
- Elasticsearch connection details

See the Terraform module in `terraform/modules/kibana` for the complete configuration.

## Customization

To customize the Kibana deployment beyond what's provided in the Terraform module, you can:

1. Modify the `values.yaml` template in the Terraform module
2. Override specific values using the `set` blocks in the Terraform configuration
3. Create a custom values file and reference it in the Terraform configuration

## Usage

This chart is deployed automatically when applying the Terraform configuration. You don't need to manually deploy it using Helm.

## Accessing Kibana

By default, Kibana is deployed with a ClusterIP service. To access Kibana, you can:

1. Use port forwarding: `kubectl port-forward svc/kibana-kibana 5601:5601 -n efk`
2. Configure an Ingress (sample configuration is provided in the values.yaml file)
3. Change the service type to LoadBalancer or NodePort in the Terraform configuration