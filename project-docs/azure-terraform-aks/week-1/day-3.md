# Week 1 Day 3 Runbook - Health Probes

## Objective

Understand and experiment with readiness and liveness probes by editing the raw manifest directly.

## Concept: What Are Probes?

Kubernetes cannot know if your app is healthy just because the container started. Probes solve this.

| Probe | What it does | Failure effect |
|---|---|---|
| **Readiness** | Is the app ready to receive traffic? | Pod removed from Service endpoints — no traffic sent |
| **Liveness** | Is the app alive (not deadlocked)? | Pod is restarted |
| **Startup** | Has the app finished starting? | Delays readiness/liveness checks for slow-starting apps |

Open `k8s/manifests/dev/api-deployment.yaml` and find the `readinessProbe` and `livenessProbe` blocks.
Both currently check `GET /` on port 80.

## Experiment 1: Break the readiness probe

Edit `api-deployment.yaml` — change the readiness probe path:

```yaml
readinessProbe:
  httpGet:
    path: /this-does-not-exist
    port: 80
```

Apply it:

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
```

Observe:

```bash
kubectl get pods -n dev              # READY column becomes 0/1
kubectl describe pod -n dev -l app=api | grep -A 5 "Readiness\|Conditions"
kubectl get endpoints -n dev         # api has no endpoints listed
```

What you learn: the pod is still `Running` but receives zero traffic.
Kubernetes removed it from the Service load balancer.

## Experiment 2: Restore readiness, break liveness

Revert the readiness path to `/`, then break liveness:

```yaml
livenessProbe:
  httpGet:
    path: /this-does-not-exist
    port: 80
  initialDelaySeconds: 5
```

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl get pods -n dev -w           # watch RESTARTS column increment
kubectl describe pod -n dev -l app=api | grep -A 5 "Liveness\|Restart Count"
```

What you learn: the pod keeps restarting. If it restarts too many times quickly, it enters `CrashLoopBackOff`.

## Completed Lab State

- Experiment 1: broke readiness probe (`path: /this-does-not-exist`)
  - New pod stuck at `0/1` indefinitely
  - Old pods stayed alive and kept serving traffic (`maxUnavailable: 0` protected them)
  - Service endpoints only showed healthy old pod IPs — broken pod was excluded
  - Restored probe → broken pod terminated, rollout completed cleanly

- Experiment 2: broke liveness probe (`path: /this-does-not-exist`, `initialDelaySeconds: 5`)
  - Rolling update completed (readiness passed) — new pods reached `1/1`
  - After initialDelay, liveness failed 3 times → container killed → RESTARTS incremented
  - Pod name stayed the same, only container restarted
  - Restored probe → clean rollout, RESTARTS back to 0

## Lessons Learned

- Readiness failure = traffic gate: pod stays Running but excluded from Service, no traffic interruption
- Liveness failure = self-healing: container killed and restarted inside same pod, brief traffic interruption
- `maxUnavailable: 0` is critical — it kept old healthy pods alive while new broken pods were stuck
- `kubectl get endpoints <service>` shows the live pod IPs the Service is currently routing to — broken pods are absent
- RESTARTS counter in `kubectl get pods` is the first signal of a liveness problem
- `CrashLoopBackOff` happens when RESTARTS keep climbing — Kubernetes backs off exponentially between restarts
- Real-world use: liveness probe catches memory leaks and deadlocks that the OS cannot detect

```bash
kubectl apply -f projects/azure-terraform-aks/k8s/manifests/dev/api-deployment.yaml
kubectl rollout status deployment/api -n dev
```

## Key Takeaway

- **Readiness failure** = traffic protection (pod stays up, removed from Service)
- **Liveness failure** = self-healing (pod killed and replaced by Kubernetes)
- You edited the YAML directly and applied it — this is exactly what Helm does internally when you `helm upgrade`
