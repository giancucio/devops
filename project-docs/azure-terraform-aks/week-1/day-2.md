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

## Completed Lab State

- Applied all 5 manifests from `k8s/manifests/dev/` in one command
- Deployments running: `api` (2 replicas), `frontend` (2 replicas), `worker` (1 replica)
- Services created: `api` ClusterIP, `frontend` ClusterIP
- Deleted one api pod manually — replacement appeared in 12 seconds
- During pod replacement, readiness probe held new pod at `0/1` until nginx was ready — Service only routed to healthy pods

## Lessons Learned

- `kubectl apply -f <directory>` applies files alphabetically — order doesn't matter for independent resources
- Services provide stable DNS and IP for pods — frontend calls `http://api` not a pod IP
- Worker has no Service because nothing calls it — it only processes jobs
- Pod self-healing: ReplicaSet controller continuously reconciles desired vs actual state
- `0/1 Running` means container started but readiness probe not yet passed — no traffic sent to it yet
- Pod names change on recreation but the ReplicaSet hash prefix stays the same

- Current readiness probe uses `path: /` — nginx always returns 200 so this always passes
- When the real Flask api image is deployed, update probe to `path: /health` which reflects true app state
- Future practice (Week 3): add internal dependency checks inside `/health` (database connection, cache) so readiness probe reflects whether the app is truly ready, not just whether the container started
