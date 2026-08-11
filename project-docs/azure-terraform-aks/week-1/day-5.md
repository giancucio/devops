# Week 1 Day 5 Runbook - Resource Requests and Limits

## Objective

Tune CPU and memory in the raw manifest and observe scheduling and runtime behavior.

## Concept: Requests vs Limits

| Setting | What it means | Effect |
|---|---|---|
| `requests.cpu` | Minimum CPU the pod needs | Scheduler uses this to find a node with enough capacity |
| `requests.memory` | Minimum memory the pod needs | Scheduler uses this to find a node with enough capacity |
| `limits.cpu` | Maximum CPU the pod can use | Pod is **throttled** (slowed) — never killed |
| `limits.memory` | Maximum memory the pod can use | Pod is **OOMKilled** (killed) if it exceeds this |

The api chart default:
- requests: 100m CPU, 128Mi memory
- limits: 500m CPU, 256Mi memory

Open `k8s/manifests/dev/api-deployment.yaml` and find the `resources` block.

## Experiment 1: Artificially tight memory limit (OOMKilled)

Edit `api-deployment.yaml` — set an impossibly small memory limit:

```yaml
resources:
  requests:
    cpu: "100m"
    memory: "128Mi"
  limits:
    cpu: "500m"
    memory: "4Mi"    # nginx needs far more than this
```

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl get pods -n dev -w
kubectl describe pod -n dev -l app=api | grep -A 5 "OOMKilled\|Last State\|Reason"
```

What you see: pod enters `OOMKilled` then `CrashLoopBackOff` as Kubernetes restarts it repeatedly.

## Experiment 2: Impossible CPU request (Pending)

Edit `api-deployment.yaml` — set an impossible CPU request:

```yaml
resources:
  requests:
    cpu: "100"       # 100 cores — no node has this
    memory: "128Mi"
```

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl get pods -n dev              # new pod stays Pending
kubectl describe pod -n dev -l app=api | grep -A 10 "Events"
```

What you see: `0/3 nodes are available: Insufficient cpu` — scheduler cannot place the pod.

## Restore

Revert the resources block to the original values and re-apply:

```yaml
resources:
  requests:
    cpu: "100m"
    memory: "128Mi"
  limits:
    cpu: "500m"
    memory: "256Mi"
```

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl rollout status deployment/api -n dev
```

## Key Takeaway

- **Pending pod** = scheduling failure (requests too high, no node fits)
- **OOMKilled** = memory limit exceeded at runtime (process killed by kernel)
- **CPU throttling** = limit hit at runtime (process slowed, not killed — harder to detect without metrics)
- Always set both requests AND limits in production
- In Week 2, ResourceQuota will enforce limits at the namespace level — you cannot deploy without them

## Week 2 Preview

Now that you understand every field in the raw YAML, Week 2 introduces:
1. Helm — you will understand exactly what it templates because you wrote the YAML yourself
2. ResourceQuota — namespace-level resource caps
3. HPA — automatic scaling based on CPU/memory
