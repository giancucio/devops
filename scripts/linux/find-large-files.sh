#!/usr/bin/env bash
set -euo pipefail

SEARCH_PATH="${1:-.}"
MIN_SIZE="${2:-100M}"

find "$SEARCH_PATH" -type f -size +"$MIN_SIZE" -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
