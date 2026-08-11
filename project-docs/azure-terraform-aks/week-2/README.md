# Week 2 Reliability and Platform Patterns

Goal: add production safety rails to the 3-service app.

## Daily Plan

1. Day 1: ResourceQuota and LimitRange per namespace
2. Day 2: HorizontalPodAutoscaler — enable and test against api
3. Day 3: PodDisruptionBudget — safe node drain behavior
4. Day 4: NetworkPolicy — restrict inter-namespace and inter-service traffic
5. Day 5: Secrets management — move APPLICATIONINSIGHTS_CONNECTION_STRING to a Kubernetes Secret

## Why These Matter

| Pattern | Without it | With it |
|---|---|---|
| ResourceQuota | One bad deploy starves the whole cluster | Each namespace is bounded |
| HPA | You over-provision or under-serve | Pods scale with real demand |
| PDB | Node drain evicts all replicas at once | At least N replicas always alive |
| NetworkPolicy | Any pod can talk to any pod | Traffic is explicitly allowed |
| Secrets | Credentials in env vars, visible in manifests | Credentials referenced, not embedded |

## Files You Will Modify

- `k8s/namespaces/dev.yaml` — add ResourceQuota and LimitRange
- `k8s/helm/api/values.yaml` — enable HPA
- `k8s/helm/api/templates/` — add pdb.yaml
- New: `k8s/helm/api/templates/networkpolicy.yaml`

## Exit Criteria

- You can explain why a pod is Pending due to quota vs node pressure
- HPA scales api pods under load and scales back down
- Node drain does not take api below minimum replicas
- Frontend cannot reach worker directly (NetworkPolicy enforced)
