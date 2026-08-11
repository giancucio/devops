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

## Learning Roadmap

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
