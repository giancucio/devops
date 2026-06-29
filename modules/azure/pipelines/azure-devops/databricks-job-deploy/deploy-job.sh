#!/usr/bin/env bash
set -euo pipefail

JOB_FILE="${1:-job.json}"

databricks jobs create --json @"$JOB_FILE"
