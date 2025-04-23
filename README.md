# 💀Devils-Anus

A single home for everything you need to **collect, store and explore logs** with an EFK set-up  
Here you’ll only find the **Elastic Stack deployment assets**:

* **Elasticsearch** – data node / master / ingest
* **Kibana** – dashboards & search UI
* **Fluent Bit** – log shipper (tiny, stateless)

All packaged with **Terraform + Helm** so the same recipes run on every cloud.
It's called Devils-Anus cause logging is a shit-hole.

## Repo layout

```
devils-anus/
├── README.md
├── .terraform/            # local state/cache (git-ignored)
├── terraform.tfvars.example
├── modules/               # reusable TF modules
│   └── elastic-stack/
│        ├── main.tf
│        ├── values.yaml   # Helm values
│        └── ...           # variables, outputs
└── deployments/
├── civo/
│   └── main.tf        # uses modules/elastic-stack
└── digitalocean/
└── main.tf
```

**Why this structure?**

| Folder                | Purpose                                                       |
|-----------------------|---------------------------------------------------------------|
| `modules/elastic-stack` | Cloud-agnostic Helm release (namespaces, PVCs, resource limits, network policies, etc.) |
| `deployments/<provider>` | One thin wrapper per provider: sets kubeconfig backend + small provider-specific overrides |
| `terraform.tfvars.*`  | Copy to `terraform.tfvars` to fill in cluster endpoint, Helm chart versions, storage class, etc. |

---

## 2 ► Prerequisites

| Tool | Version (tested) | Notes |
|------|------------------|-------|
| Terraform | ≥1.6         | `brew install terraform` |
| Helm      | ≥3.12        | `brew install helm` |
| kubectl   | ≥1.28        | Matches your cluster version |
| A working **kubeconfig** that points at the target cluster (Cosmos gave you this) |

---

## 3 ► Quick-start (DigitalOcean example)

```bash
# 1. Clone
git clone git@github.com:your-org/devils-anus.git
cd devils-anus/deployments/digitalocean

# 2. Copy & edit variables
cp ../../terraform.tfvars.example terraform.tfvars
$EDITOR terraform.tfvars    # set kubeconfig_path, storage_class, chart versions, etc.

# 3. Deploy
terraform init   # pulls helm & kubernetes providers
terraform plan   # preview
terraform apply  # deploys Elasticsearch, Kibana, Fluent Bit

# 4. Access Kibana
kubectl -n logging port-forward svc/kibana 5601:5601
open http://localhost:5601
```

> **Namespace layout**
> * `logging` — Elasticsearch StatefulSet, Kibana Deployment
> * `log-ingest` — Fluent Bit DaemonSet (runs on every node)

---

## 4 ► Module variables (excerpt)

| Variable | Default | Meaning |
|----------|---------|---------|
| `es_heap_size`         | `"1g"`      | JVM heap per ES pod |
| `es_replica_count`     | `3`         | StatefulSet replicas |
| `kibana_cpu_limit`     | `"500m"`    | CPU limit |
| `storage_class`        | `""`        | Empty = default SC of cluster |
| `fluentbit_extra_args` | `[]`        | Extra CLI flags |

See `modules/elastic-stack/variables.tf` for the full list.

---

## 5 ► Extending to another cloud

1. Create `deployments/<provider>/main.tf`
2. Point the **kubernetes** provider to that cluster’s api-server.
3. Pass any provider-specific overrides (e.g., `storage_class = "gp2"`).
4. `terraform init && terraform apply`.

No changes inside `modules/elastic-stack` should be needed.

---

## 6 ► Dev workflow

1. **Feature branch** → open PR.
2. GitHub Actions lints Terraform (`tflint`) & Helm (`helm lint`).
3. If green, merge → Argo CD (or Flux) pulls `main` and syncs the live cluster.

---

## 7 ► Caveats / TODO

- [ ] Add optional Curator job or ILM for index retention
- [ ] HorizontalPodAutoscaler examples
- [ ] Docs for multi-AZ ES node topology
- [ ] Option to swap Fluent Bit for Logstash

---

## 8 ► License

MIT © Your Company Name

---

Happy logging, sinner. 🔥
