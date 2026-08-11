# Week 1 Day 3 Runbook - Health Probes

## Objective

Understand and experiment with readiness and liveness probes using the real api service.

## Concept: What Are Probes?

Kubernetes cannot know if your app is healthy just because the container started. Probes solve this.

| Probe | What it does | Failure effect |
|---|---|---|
| **Readiness** | Is the app ready to receive traffic? | Pod removed from Service endpoints — no traffic sent |
| **Liveness** | Is the app alive (not deadlocked)? | Pod is restarted |
| **Startup** | Has the app finished starting? | Delays readiness/liveness checks for slow apps |

The api service uses `/health` for both. See `k8s/helm/api/values.yaml`.

## View Current Probe Config

```bash
kubectl describe deployment api -n dev | grep -A 20 "Liveness\|Readiness"
```

## Experiment 1: Break the readiness probe

Change the readiness path to something that doesn't exist so the pod fails readiness but stays alive:

```bash
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --set probes.readiness.path=/nonexistent \
  --wait --timeout 60s || true
```

Then observe:

```bash
kubectl get pods -n dev           # pod shows 0/1 READY
kubectl describe pod -n dev -l app=api | grep -A 10 "Conditions\|Events"
kubectl get endpoints -n dev      # api endpoint should be removed
```

What you learn: traffic stops going to the pod even though it is still Running.

## Experiment 2: Restore and break liveness

```bash
# Restore readiness
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --wait

# Now set a very short liveness timeout to simulate deadlock detection
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --set probes.liveness.path=/nonexistent \
  --set probes.liveness.initialDelaySeconds=5
```

Watch the pod restart counter increase:

```bash
kubectl get pods -n dev -w
kubectl describe pod -n dev -l app=api | grep -A 5 "Restart Count\|Liveness"
```

## Restore

```bash
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --wait
```

## Key Takeaway

- **Readiness failure** = traffic protection (pod stays up, just not reachable)
- **Liveness failure** = self-healing (pod is killed and replaced)
- Both use the same `/health` endpoint in this app — in production you may split them
