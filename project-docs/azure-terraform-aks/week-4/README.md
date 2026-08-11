# Week 4 Incident Response and Day-2 Operations

Goal: run repeatable incident handling and operations workflows against the real 3-service app.

## Daily Plan

1. Day 1: Kill a pod mid-request — observe readiness probe, rolling update recovery
2. Day 2: Bad deploy simulation — push a broken image tag, watch Helm rollback
3. Day 3: Resource exhaustion — set artificially low limits on api, observe OOMKilled and throttling
4. Day 4: DNS/service disruption — break the api Service, observe frontend degradation
5. Day 5: Full incident drill — alert fires, you triage from Grafana to logs to root cause to fix

## Incident Triage Checklist

```
1. kubectl get pods -n dev                          # any CrashLoopBackOff or Pending?
2. kubectl describe pod <pod> -n dev               # events section — what happened?
3. kubectl logs <pod> -n dev --previous            # last crash logs
4. kubectl top pods -n dev                         # resource pressure?
5. kubectl get events -n dev --sort-by=.lastTimestamp
6. helm history api -n dev                         # recent Helm change?
7. Check Grafana / AppInsights for correlated spike
```

## Rollback Protocol

```bash
# Helm rollback (preferred — reverts chart + values)
helm rollback api <revision> -n dev --wait

# kubectl rollback (deployment only, not values)
kubectl rollout undo deployment/api -n dev
```

## Exit Criteria

- You can diagnose any of the 5 failure scenarios above in under 10 minutes
- Rollback is executed confidently without looking up syntax
- You write a 5-line post-incident note: what happened, why, how fixed, how to prevent
