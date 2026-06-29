# Pipeline Troubleshooting

## Auth Failure

Check service connection, OIDC trust, credentials, RBAC/IAM permissions, and target subscription/account.

## Terraform Lock

Check active runs before manually unlocking state.

## Kubernetes Rollout

```bash
kubectl describe pod <pod> -n <namespace>
kubectl logs <pod> -n <namespace>
kubectl rollout status deployment/<deployment> -n <namespace>
```
