# Week 1 Kubernetes Foundations

Goal: become fluent with core workload operations in AKS using the real 3-service app (api, frontend, worker).

## Why use the real app?

Practicing with a real Flask API, nginx frontend, and Python worker teaches you:
- How pods communicate inside the cluster
- How readiness/liveness probes protect live traffic
- How rolling updates behave on a real app (not a toy nginx)
- How logs and health checks look under real conditions

## Daily Plan

1. [Day 1 Namespaces and Deployments](day-1.md) ✅ — namespace setup, hello-web deployment, rollout basics
2. [Day 2 Helm and the Real App](day-2.md) — deploy api/frontend/worker via Helm to dev namespace
3. [Day 3 Health Probes](day-3.md) — readiness/liveness probes already in Helm charts; break and observe
4. [Day 4 Rollouts and Rollbacks](day-4.md) — Helm upgrade/rollback, kubectl rollout commands
5. [Day 5 Resource Requests and Limits](day-5.md) — tune requests/limits, observe scheduling and throttling

## Exit Criteria

By end of Week 1 you can:

- Deploy and upgrade all 3 services via Helm without looking up syntax
- Explain what readiness vs liveness probe failure causes
- Perform a Helm rollback and explain what changed
- Read `kubectl describe pod` and identify resource pressure vs probe failure

## Key Concepts Introduced This Week

| Concept | Where you see it |
|---|---|
| Namespace isolation | `k8s/namespaces/` manifests |
| Helm chart structure | `k8s/helm/api/`, `frontend/`, `worker/` |
| Rolling update | `strategy.rollingUpdate` in each Deployment template |
| Readiness probe | `probes.readiness` in Helm values |
| Liveness probe | `probes.liveness` in Helm values |
| Resource requests/limits | `resources` block in Helm values |
| HPA skeleton | `hpa.yaml` template — disabled, enabled in Week 2 |
