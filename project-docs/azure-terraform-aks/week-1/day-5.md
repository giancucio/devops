# Week 1 Day 5 Runbook - Resource Requests and Limits

## Objective

Understand and tune CPU/memory requests and limits; observe scheduling and throttling behavior.

## Concept: Requests vs Limits

| Setting | What it means | Effect |
|---|---|---|
| `requests.cpu` | Minimum CPU the pod needs | Scheduler uses this to find a node with enough capacity |
| `requests.memory` | Minimum memory the pod needs | Scheduler uses this to find a node with enough capacity |
| `limits.cpu` | Maximum CPU the pod can use | Pod is **throttled** (slowed) if it exceeds this — never killed |
| `limits.memory` | Maximum memory the pod can use | Pod is **OOMKilled** (killed) if it exceeds this |

The api chart default:
- requests: 100m CPU, 128Mi memory
- limits: 500m CPU, 256Mi memory

## View Current Resource Allocation

```bash
kubectl describe nodes | grep -A 10 "Allocated resources"
kubectl top pods -n dev        # requires metrics-server
kubectl top nodes
```

## Experiment 1: Artificially tight memory limit

```bash
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --set resources.limits.memory=16Mi \
  --wait --timeout 60s || true

kubectl get pods -n dev
kubectl describe pod -n dev -l app=api | grep -A 5 "OOMKilled\|Reason\|Last State"
```

What you see: pod enters `OOMKilled` state and Kubernetes restarts it repeatedly (CrashLoopBackOff).

## Experiment 2: Impossible request (unschedulable)

```bash
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --set resources.requests.cpu=100 \
  --wait --timeout 60s || true

kubectl get pods -n dev         # pod stuck in Pending
kubectl describe pod -n dev -l app=api | grep -A 10 "Events"
```

What you see: `0/3 nodes are available: Insufficient cpu` — scheduler cannot find a node with 100 CPU cores.

## Restore Sane Values

```bash
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --wait
```

## Key Takeaway

- **Pending pod** = scheduling failure (requests too high, no node has capacity)
- **OOMKilled** = memory limit hit at runtime (process used more than allowed)
- **CPU throttling** = limit hit at runtime (process slowed, not killed — harder to detect)
- Setting requests without limits is risky — pod can consume all node memory
- Setting limits without requests means Kubernetes schedules the pod on any node, possibly overcommitting
