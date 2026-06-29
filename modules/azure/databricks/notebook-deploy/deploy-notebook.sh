#!/usr/bin/env bash
set -euo pipefail

SOURCE_PATH="${1:-./notebooks/sample.py}"
TARGET_PATH="${2:-/Workspace/Shared/sample.py}"

databricks workspace import "$SOURCE_PATH" "$TARGET_PATH" --overwrite
