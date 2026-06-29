#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID="${1:?Usage: ./trigger-pipeline.sh <project-id> <branch>}"
BRANCH="${2:-main}"
TOKEN="${GITLAB_TRIGGER_TOKEN:?Set GITLAB_TRIGGER_TOKEN first}"

curl --request POST \
  --form token="$TOKEN" \
  --form ref="$BRANCH" \
  "https://gitlab.com/api/v4/projects/$PROJECT_ID/trigger/pipeline"
