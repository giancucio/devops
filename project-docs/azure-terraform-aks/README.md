# Azure Terraform AKS Practice Docs

This directory tracks the Kubernetes and observability learning path for the AKS cluster provisioned from this repository.

## Scope

- Cluster focus: `aks-dev-eastus`
- Practice role focus: DevOps engineer
- Focus areas: Kubernetes operations and observability

## Project Structure

```
projects/azure-terraform-aks/
  app/              # api (Flask), frontend (nginx), worker (Python)
  k8s/
    namespaces/     # namespace manifests (namespace-as-code)
    helm/           # Helm charts for api, frontend, worker, ingress-nginx
    pipelines/      # platform bootstrap + app deploy pipelines
  terraform/        # AKS, ACR, VNet, Log Analytics, AppInsights, Grafana
  azure-pipelines.yml  # infra pipeline
```

## Pipelines Overview

| Pipeline | File | Purpose |
|---|---|---|
| Infra | `azure-pipelines.yml` | Terraform plan/approve/apply |
| App Build | `app/pipelines/azure-pipelines.yml` | Build and push images to ACR |
| Platform Bootstrap | `k8s/pipelines/azure-pipelines-platform.yml` | Install ingress-nginx |
| App Deploy | `k8s/pipelines/azure-pipelines.yml` | Deploy Helm releases to dev |

## Cluster Architecture

### Current setup (practice lab)

```
1 node pool — system — 3 x Standard_DS2_v2 — no autoscale
```

Fine for Week 1–2 practice. All workloads land on the same 3 nodes.

### Target setup (production-like, introduced in Week 2)

```
cluster
├── system pool    2 nodes (fixed)    Kubernetes system pods only — kube-dns, metrics-server, CSI drivers
├── app pool       2–10 nodes (auto)  frontend, api — anything a user waits on
└── worker pool    1–5 nodes (auto)   background jobs — order processing, emails, reports
```

### Why separate pools?

| Pool | Reason for separation |
|---|---|
| system | A noisy app pod must never evict kube-dns and break the whole cluster |
| app | Scales with user traffic; response time is critical |
| worker | Scales with job queue depth; latency is not critical; can use cheaper VMs |

### How this maps to your 3-service app

| Service | Real-world role | Pool |
|---|---|
| `frontend` | Serves the website | app pool |
| `api` | Handles requests from frontend | app pool |
| `worker` | Background job processing | worker pool |

### Node pool taints (Week 2 concept)

The system pool gets a taint so app pods cannot land on it:

```
CriticalAddonsOnly=true:NoSchedule
```

App pods must tolerate this taint or they schedule on the app pool only.
This is what `only_critical_addons_enabled = true` does in Terraform.


- [Week 1 Kubernetes Foundations](week-1/README.md)
- [Week 2 Reliability and Platform Patterns](week-2/README.md)
- [Week 3 Observability and Alerting](week-3/README.md)
- [Week 4 Incident Response and Day-2 Ops](week-4/README.md)

## Progress Tracking

| Week | Status | Notes |
|------|--------|-------|
| Week 1 | In Progress | Day 1 complete; real app deployed via Helm from Day 2 |
| Week 2 | Not Started | HPA, ResourceQuota, PDB, NetworkPolicy |
| Week 3 | Not Started | Grafana dashboards + alert rules (infra already provisioned) |
| Week 4 | Not Started | Incident drills against real app |

## Known Gaps to Close During Practice

| Gap | Addressed in |
|---|---|
| ResourceQuota + LimitRange per namespace | Week 2 |
| NetworkPolicy between namespaces | Week 2 |
| PodDisruptionBudget | Week 2 |
| Secrets via Key Vault CSI driver | Week 2 |
| Staging Helm values and pipeline stage | Week 2 |
| Grafana dashboards and alert rules as code | Week 3 |
