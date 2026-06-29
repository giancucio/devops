#!/usr/bin/env bash
set -euo pipefail

SCOPE_NAME="${1:?Usage: ./create-secret-scope.sh <scope-name>}"

databricks secrets create-scope "$SCOPE_NAME"
