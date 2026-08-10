# Week 1 Day 1 Runbook - Namespaces and Deployments

## Objective

Set up baseline namespaces and deploy a sample app in the `dev` namespace.

## Completed Lab State

This was completed in cluster context `aks-dev-eastus` with these outcomes:

- Namespaces created: `dev`, `staging`, `ops`
- Deployment created in `dev`: `hello-web`
- Image used: `nginx:1.27`
- Replicas set to 2
- Rollout status: successful

## Commands Used

```bash
kubectl create namespace dev --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace staging --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace ops --dry-run=client -o yaml | kubectl apply -f -

kubectl -n dev create deployment hello-web --image=nginx:1.27 --dry-run=client -o yaml | kubectl apply -f -
kubectl -n dev scale deployment hello-web --replicas=2
kubectl -n dev rollout status deployment/hello-web --timeout=120s
```

## Verification Commands

```bash
kubectl config current-context
kubectl get namespaces
kubectl -n dev get deploy,rs,pods -o wide
kubectl -n dev describe deployment hello-web
kubectl -n dev logs -l app=hello-web --tail=50
```

## Practice Drills

1. Scale up and down

```bash
kubectl -n dev scale deployment hello-web --replicas=4
kubectl -n dev scale deployment hello-web --replicas=2
```

2. Trigger a rollout and inspect revision history

```bash
kubectl -n dev set image deployment/hello-web nginx=nginx:1.27.1
kubectl -n dev rollout status deployment/hello-web
kubectl -n dev rollout history deployment/hello-web
```

3. Roll back

```bash
kubectl -n dev rollout undo deployment/hello-web
kubectl -n dev rollout status deployment/hello-web
```

## Notes and Lessons Learned

- Initial kube context was stale and pointed to an endpoint that no longer resolved.
- Context refresh with `az aks get-credentials --overwrite-existing` fixed connectivity.
- Always verify context before making cluster changes.
