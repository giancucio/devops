# Week 1 Day 2 Runbook - Deploy the Real App with Raw Manifests

## Objective

Apply the 3-service app (api, frontend, worker) to the `dev` namespace using raw YAML manifests.
No Helm yet — you read, apply, and observe every resource yourself.

## Manifests Location

```
k8s/manifests/dev/
  api-deployment.yaml
  api-service.yaml
  frontend-deployment.yaml
  frontend-service.yaml
  worker-deployment.yaml
```

## Step 1: Read before you apply

Open each manifest and answer these questions before running anything:

- How many replicas does api have?
- What port does the api container listen on?
- What does `ClusterIP` mean for the Service type?
- What is `terminationGracePeriodSeconds` doing?
- What is `revisionHistoryLimit: 3` doing?

## Step 2: Apply

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/
```

This applies all files in the folder at once.

## Step 3: Verify

```bash
kubectl get deployments -n dev
kubectl get pods -n dev -o wide
kubectl get services -n dev
kubectl get replicasets -n dev
```

## Step 4: Understand what each command shows

```bash
# Shows one row per Deployment — READY column = running/desired replicas
kubectl get deployments -n dev

# Shows individual pods — NODE column shows which node each pod landed on
kubectl get pods -n dev -o wide

# Shows Services — CLUSTER-IP is the internal IP other pods use to reach this service
kubectl get services -n dev

# ReplicaSets are what the Deployment controls — each rollout creates a new RS
kubectl get replicasets -n dev
```

## Step 5: Inspect a running pod

```bash
# Replace <pod-name> with an actual pod name from get pods
kubectl describe pod <pod-name> -n dev
kubectl logs <pod-name> -n dev
```

In `describe`, look at:
- `Conditions` — is Ready True?
- `Events` — what happened when the pod started?
- `Containers` — what image, ports, probes, and limits are configured?

## Practice Drill

Delete one api pod manually and watch Kubernetes recreate it:

```bash
kubectl delete pod <api-pod-name> -n dev
kubectl get pods -n dev -w        # -w watches for changes in real time
```

Why does a new pod appear? Because the Deployment tells the ReplicaSet to maintain 2 replicas at all times.
