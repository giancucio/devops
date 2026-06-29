#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:?Usage: ./list-workflows.sh <owner> <repo>}"
REPO="${2:?Usage: ./list-workflows.sh <owner> <repo>}"

gh workflow list --repo "$OWNER/$REPO"
