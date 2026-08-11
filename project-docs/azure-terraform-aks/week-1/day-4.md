# Week 1 Day 4 Runbook - Rollouts and Rollbacks

## Objective

Practice Helm upgrades, rollbacks, and understand how Kubernetes rolling updates protect availability.

## Concept: How Rolling Updates Work

When you deploy a new version:
1. Kubernetes creates a new pod with the new image
2. Waits until readiness probe passes
3. Only then removes an old pod
4. Repeats until all pods are updated

The api chart has: `maxUnavailable: 0` and `maxSurge: 1`
This means: always keep current replicas alive, only add 1 new pod at a time.

## Helm Upgrade (simulating a new release)

```bash
# Tag bump simulates a new image being deployed
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --set env.VERSION="2.0.0" \
  --wait

# Watch the rollout in real time (run in a second terminal)
kubectl rollout status deployment/api -n dev
kubectl get pods -n dev -w
```

## Inspect Rollout History

```bash
helm history api -n dev
kubectl rollout history deployment/api -n dev
```

Note: Helm tracks revision history (chart + values). kubectl tracks deployment revision history (pod spec only).

## Simulate a Bad Deploy

```bash
# Push a non-existent image tag — this will fail to pull
helm upgrade api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --set image.tag="does-not-exist" \
  --timeout 90s || true

kubectl get pods -n dev         # new pod stuck in ImagePullBackOff
kubectl describe pod -n dev -l app=api | grep -A 10 "Events"
```

## Rollback

```bash
# Helm rollback to previous revision
helm rollback api -n dev --wait

# Confirm
helm history api -n dev
kubectl get pods -n dev
kubectl rollout status deployment/api -n dev
```

## Key Takeaway

- Helm rollback reverts both the chart template AND the values — `kubectl rollout undo` reverts only the pod spec
- `maxUnavailable: 0` means zero downtime rolling update — old pods only die after new ones pass readiness
- `revisionHistoryLimit: 3` in the deployment keeps only 3 ReplicaSets — prevents old RS accumulation
