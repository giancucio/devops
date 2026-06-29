#!/usr/bin/env bash
set -euo pipefail

BUCKET="${1:?Usage: ./check-s3-public-access.sh <bucket>}"

aws s3api get-public-access-block --bucket "$BUCKET" --output table
