# Week 2 Reliability and Platform Patterns

Goal: add production safety rails to the 3-service app and evolve the cluster toward a real-world multi-pool setup.

## Daily Plan

1. Day 1: ResourceQuota and LimitRange per namespace
2. Day 2: HorizontalPodAutoscaler — enable and test against api
3. Day 3: PodDisruptionBudget — safe node drain behavior
4. Day 4: NetworkPolicy — restrict inter-namespace and inter-service traffic
5. Day 5: Add a second node pool (worker pool) and move the worker service to it

## Why These Matter

| Pattern | Without it | With it |
|---|---|---|
| ResourceQuota | One bad deploy starves the whole cluster | Each namespace is bounded |
| HPA | You over-provision or under-serve | Pods scale with real demand |
| PDB | Node drain evicts all replicas at once | At least N replicas always alive |
| NetworkPolicy | Any pod can talk to any pod | Traffic is explicitly allowed |
| Multi-pool | All workloads compete for the same nodes | App and worker scale independently |

## Day 5: Multi-Node Pool Practice

You will add a dedicated worker node pool to the Terraform config:

```hcl
resource "azurerm_kubernetes_cluster_node_pool" "worker" {
  name                  = "worker"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  mode                  = "User"

  node_labels = {
    "workload-type" = "worker"
  }

  node_taints = ["workload-type=worker:NoSchedule"]
}
```

Then update the worker Deployment manifest to use a toleration and node selector so it only schedules on the worker pool:

```yaml
tolerations:
  - key: "workload-type"
    operator: "Equal"
    value: "worker"
    effect: "NoSchedule"
nodeSelector:
  workload-type: worker
```

## Files You Will Modify

- `k8s/manifests/dev/` — add ResourceQuota, PDB, NetworkPolicy manifests
- `k8s/manifests/dev/worker-deployment.yaml` — add toleration and nodeSelector
- `terraform/main.tf` — add worker node pool resource
- `terraform/environments/dev.tfvars` — add worker pool variables
- `k8s/helm/api/values.yaml` — enable HPA

## Exit Criteria

- You can explain why a pod is Pending due to quota vs node pressure
- HPA scales api pods under load and scales back down
- Node drain does not take api below minimum replicas
- Worker pods schedule exclusively on the worker node pool
- Frontend cannot reach worker directly (NetworkPolicy enforced)
