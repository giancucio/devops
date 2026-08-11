# Week 1 Kubernetes Foundations

Goal: become fluent with raw Kubernetes operations before introducing any tooling abstractions.

## Why raw manifests first?

Helm, Kustomize, and ArgoCD all generate Kubernetes YAML under the hood.
If you don't understand the YAML, you can't debug what the tooling produces.
Week 1 is YAML and kubectl only. Helm comes in Week 2.

## Daily Plan

1. [Day 1 Namespaces and Deployments](day-1.md) ✅ — namespace setup, hello-web, scaling, rollout, rollback
2. [Day 2 Deploy the Real App](day-2.md) ✅ — applied api/frontend/worker manifests, pod self-healing drill
3. [Day 3 Health Probes](day-3.md) ✅ — broke readiness and liveness, observed traffic and restart behavior
4. [Day 4 Rollouts and Rollbacks](day-4.md) — rolling update, rollback, revision history
5. [Day 5 Resource Requests and Limits](day-5.md) — scheduling, OOMKilled, throttling

## Manifests Used This Week

All raw YAML lives in `k8s/manifests/dev/`:

| File | What it creates |
|---|---|
| `api-deployment.yaml` | API Deployment, 2 replicas, probes, resources |
| `api-service.yaml` | ClusterIP Service for api |
| `frontend-deployment.yaml` | Frontend Deployment, 2 replicas, probes, resources |
| `frontend-service.yaml` | ClusterIP Service for frontend |
| `worker-deployment.yaml` | Worker Deployment, 1 replica, resources |

## Exit Criteria

By end of Week 1 you can:

- Read any Kubernetes Deployment YAML and explain every field
- Apply, update, and delete resources with kubectl
- Explain readiness vs liveness probe failure behavior from observed output
- Perform a rollback and explain what `revisionHistoryLimit` means
- Diagnose a Pending pod vs OOMKilled pod from `kubectl describe`

## Week 2 Preview

Once you can do all of the above with raw manifests, Week 2 introduces Helm.
At that point you will understand exactly what Helm is wrapping — and why it exists.
