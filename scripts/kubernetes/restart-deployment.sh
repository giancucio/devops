#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${1:?Usage: ./restart-deployment.sh <namespace> <deployment>}"
DEPLOYMENT="${2:?Usage: ./restart-deployment.sh <namespace> <deployment>}"

kubectl rollout restart deployment "$DEPLOYMENT" -n "$NAMESPACE"
kubectl rollout status deployment "$DEPLOYMENT" -n "$NAMESPACE"
