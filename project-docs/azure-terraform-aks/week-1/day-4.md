# Week 1 Day 4 Runbook - Rollouts and Rollbacks

## Objective

Practice rolling updates and rollbacks using kubectl and raw manifests.
Understand how Kubernetes tracks revision history via ReplicaSets.

## Concept: How Rolling Updates Work

When you apply a new pod spec:
1. Kubernetes creates a **new ReplicaSet** for the new version
2. Scales up new RS one pod at a time (controlled by `maxSurge`)
3. Waits until readiness probe passes on the new pod
4. Only then scales down the old RS (controlled by `maxUnavailable: 0`)
5. Repeats until old RS is at 0

This is why `maxUnavailable: 0` + `maxSurge: 1` means zero-downtime deploys.

## Step 1: Trigger a rollout by changing the image

Edit `api-deployment.yaml` — change the image tag:

```yaml
image: nginx:1.27.1
```

Apply and watch:

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl rollout status deployment/api -n dev

# In a second terminal, watch pods
kubectl get pods -n dev -w
```

Notice: new pods appear before old ones are terminated.

## Step 2: Inspect revision history

```bash
kubectl rollout history deployment/api -n dev
kubectl get replicasets -n dev       # you will see 2 RS: one scaled up, one at 0
```

Each rollout creates a new ReplicaSet. The old one stays at 0 replicas for rollback.
`revisionHistoryLimit: 3` means only 3 old ReplicaSets are kept.

## Step 3: Simulate a bad deploy

Set a non-existent image tag:

```yaml
image: nginx:this-tag-does-not-exist
```

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl get pods -n dev              # new pod stuck in ImagePullBackOff
kubectl describe pod -n dev -l app=api | grep -A 10 "Events"
```

Old pods are still running because `maxUnavailable: 0` prevents them from being removed
until the new pod passes readiness — which it never will.

## Step 4: Rollback

```bash
kubectl rollout undo deployment/api -n dev
kubectl rollout status deployment/api -n dev
kubectl rollout history deployment/api -n dev
```

## Key Takeaway

- Each `kubectl apply` with a changed pod spec creates a new ReplicaSet
- `kubectl rollout undo` switches back to the previous ReplicaSet — it does not re-apply your YAML
- This is why rollback is instant — the old pods are already scaled to 0, not deleted
- When you move to Helm in Week 2, `helm rollback` wraps this but also restores Helm values
