# 💀Devils-Anus

A single home for everything you need to **collect, store and explore logs** with an EFK (Elasticsearch, Fluent Bit, Kibana) stack.  
Here you'll find the **Elastic Stack deployment assets**:

* **Elasticsearch** – data node / master / ingest
* **Kibana** – dashboards & search UI
* **Fluent Bit** – log shipper (tiny, stateless)

All packaged with **Terraform + Helm** so the same recipes run on every cloud.
It's called Devils-Anus cause logging is a shit-hole.

## Repository Structure

```
.
├── terraform/                  # Terraform configurations
│   ├── main.tf                 # Main Terraform configuration
│   ├── variables.tf            # Terraform variables
│   └── modules/                # Terraform modules
│       ├── elasticsearch/      # Elasticsearch module
│       ├── kibana/             # Kibana module
│       └── fluentbit/          # Fluent Bit module
└── helm/                       # Helm chart configurations
    ├── elasticsearch/          # Elasticsearch Helm chart
    ├── kibana/                 # Kibana Helm chart
    └── fluentbit/              # Fluent Bit Helm chart
```

## Prerequisites

- Kubernetes cluster
- Terraform >= 0.14
- Helm >= 3.0
- kubectl configured to access your cluster

## Deployment

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/devils-anus.git
   cd devils-anus
   ```

2. Initialize Terraform:
   ```
   cd terraform
   terraform init
   ```

3. Review and customize the variables in `terraform/variables.tf` or create a `terraform.tfvars` file.

4. Deploy the EFK stack:
   ```
   terraform apply
   ```

5. Access Kibana:
   ```
   kubectl port-forward svc/kibana-kibana 5601:5601 -n efk
   ```
   Then open http://localhost:5601 in your browser.

## Customization

You can customize the deployment by:

1. Modifying the Terraform variables in `terraform/variables.tf`
2. Creating a `terraform.tfvars` file with your custom values
3. Modifying the Helm chart values in the module-specific `values.yaml` files

## Cleanup

To remove the EFK stack:
```
terraform destroy
```

## Contributing

1. **Fork** the repository and create a branch for your feature or bug fix.
2. **Open a Pull Request** describing your changes and the motivation behind them.
3. **Adhere to** any style or naming guidelines detailed in our [CONTRIBUTING.md](CONTRIBUTING.md)

## Roadmap

1. Consider Adding ALL operators to be used in this repo (including Argo-CD)
2. To decide how to communicate resource needs that were decided in Dev Testing to be translated to SREs so that is added in staging at COSMOS

## License

This repository is released under the [GNU General Purpose License V3](./LICENSE) (or whichever license you choose). See the `LICENSE` file for details.

### Contact
**Maintainers**: [sefire-octopi](mailto:origin@sefire.org)
- **Issues**: Please open an [issue](./issues) for questions, bugs, or feature requests.

Thanks for using **cosmos**! We hope it streamlines your Kubernetes provisioning and multi-cloud infrastructure management.