# Week 1 Day 1 Runbook - Namespaces and Deployments

## Objective

Log in to Azure, connect kubectl to your AKS cluster, create namespaces, and deploy a first workload.

## Step 1: Login to Azure

```bash
az login
```

A browser window opens. Sign in with your Azure account.

## Step 2: Set the right subscription

```bash
az account set --subscription "ASD Lab"
az account show --query "{subscription:name}" -o table
```

Confirm the output shows `ASD Lab` before continuing.

## Step 3: Pull AKS credentials into kubectl

```bash
az aks get-credentials \
  --resource-group giancucio-aks-dev-eastus2-rg \
  --name giancucio-aks-dev-eastus2 \
  --overwrite-existing
```

This writes a kubeconfig entry so kubectl knows which cluster to talk to.

## Step 4: Verify cluster access

```bash
kubectl config current-context
kubectl get nodes
```

Expected: 3 nodes in `Ready` state. The context should show `giancucio-aks-dev-eastus2`.

## Step 5: Create namespaces

```bash
kubectl create namespace dev
kubectl create namespace staging
kubectl create namespace prod
kubectl create namespace ops
```

Verify:

```bash
kubectl get namespaces
```

You should see `dev`, `staging`, `prod`, and `ops` alongside the default Kubernetes namespaces.
Inspect one to understand the structure:

```bash
kubectl describe namespace dev
```

## Step 6: Deploy a first workload in dev

```bash
kubectl create deployment hello-web --image=nginx:1.27 --namespace=dev
kubectl scale deployment hello-web --replicas=2 --namespace=dev
kubectl rollout status deployment/hello-web --namespace=dev
```

## Step 7: Verify the deployment

```bash
kubectl get deployments -n dev
kubectl get pods -n dev -o wide
kubectl describe deployment hello-web -n dev
```

In `get pods -o wide` note the `NODE` column — confirm the 2 pods landed on different nodes.
This is why replicas matter: one node dying only kills one pod, not both.

## Completed Lab State

- Cluster: `giancucio-aks-dev-eastus2`
- Namespaces created: `dev`, `staging`, `prod`, `ops`
- Deployment created in `dev`: `hello-web` (nginx:1.27, 4 replicas after drills)
- All 3 drills completed successfully

## Lessons Learned

- `kubectl create deployment` defaults to 1 replica — always check defaults when using imperative commands
- The scheduler automatically spreads pods across nodes — 4 pods across 3 nodes results in 2/1/1 distribution
- `kubectl rollout undo` reuses the previous ReplicaSet spec — if revision 3 is identical to revision 1, revision 1 is dropped from history
- Rollout history is stored in the cluster (via ReplicaSets), not on your local machine — any teammate with credentials sees the same history
- Events in `kubectl describe deployment` are the complete audit trail of every scale up/down action Kubernetes took

## Practice Drills

1. Scale up and down

```bash
kubectl scale deployment hello-web --replicas=4 -n dev
kubectl get pods -n dev -o wide       # watch pods spread across nodes
kubectl scale deployment hello-web --replicas=2 -n dev
```

2. Trigger a rollout and inspect revision history

```bash
kubectl set image deployment/hello-web nginx=nginx:1.27.1 -n dev
kubectl rollout status deployment/hello-web -n dev
kubectl rollout history deployment/hello-web -n dev
```

3. Roll back

```bash
kubectl rollout undo deployment/hello-web -n dev
kubectl rollout status deployment/hello-web -n dev
```

## Notes and Lessons Learned

- Always verify `az account show` before running any cluster commands — wrong subscription = wrong cluster
- `az aks get-credentials --overwrite-existing` is safe to re-run; it refreshes a stale context
- Namespaces are logical isolation — node failures affect all namespaces on that node
- `kubectl get pods -o wide` shows which node each pod is on — important for understanding failure blast radius

```

## Notes and Lessons Learned

- Initial kube context was stale and pointed to an endpoint that no longer resolved.
- Context refresh with `az aks get-credentials --overwrite-existing` fixed connectivity.
- Always verify context before making cluster changes.
