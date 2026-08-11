# Week 1 Day 2 Runbook - Helm and the Real App

## Objective

Deploy the 3-service app (api, frontend, worker) via Helm into the `dev` namespace.

## Concept: What is Helm?

Helm is a package manager for Kubernetes. Instead of running `kubectl apply` on individual YAML files, Helm:
- Groups all Kubernetes resources for one app into a **chart**
- Lets you pass different **values** per environment (dev, staging, prod)
- Tracks **releases** so you can upgrade and rollback cleanly

Think of it as: Helm is to Kubernetes what apt/yum is to Linux.

## Prerequisite

ingress-nginx must be installed first. Run the platform pipeline or:

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  -f projects/azure-terraform-aks/k8s/helm/ingress/ingress-nginx-values.yaml \
  --wait
```

## Deploy the App

```bash
# Lint first — catches YAML/template errors before hitting the cluster
helm lint projects/azure-terraform-aks/k8s/helm/api
helm lint projects/azure-terraform-aks/k8s/helm/frontend
helm lint projects/azure-terraform-aks/k8s/helm/worker

# Deploy each chart (using placeholder image until ACR is populated)
helm upgrade --install api projects/azure-terraform-aks/k8s/helm/api \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/api/values/values-dev.yaml \
  --wait

helm upgrade --install worker projects/azure-terraform-aks/k8s/helm/worker \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/worker/values/values-dev.yaml \
  --wait

helm upgrade --install frontend projects/azure-terraform-aks/k8s/helm/frontend \
  --namespace dev \
  -f projects/azure-terraform-aks/k8s/helm/frontend/values/values-dev.yaml \
  --wait
```

## Verify

```bash
helm list -n dev
kubectl get pods -n dev -o wide
kubectl get svc -n dev
kubectl get ingress -n dev
```

## Concepts to Understand from the Output

- `helm list` shows release name, chart version, app version, and status
- Each Helm release maps to one or more Kubernetes resources
- `kubectl get svc` — api and frontend have ClusterIP (internal only); ingress-nginx has LoadBalancer (external)
- `kubectl get ingress` — frontend-ingress routes external traffic to the frontend Service

## Practice Drill

Inspect the Helm release manifest to see every Kubernetes resource it manages:

```bash
helm get manifest api -n dev
helm get values api -n dev
```

Compare what you see in the chart files vs what Helm actually rendered in the cluster.
