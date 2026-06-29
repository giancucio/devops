#!/usr/bin/env bash
set -euo pipefail

REGION="${1:-ap-northeast-1}"

aws ec2 describe-instances \
  --region "$REGION" \
  --query "Reservations[].Instances[].{InstanceId:InstanceId,State:State.Name,Type:InstanceType,PrivateIp:PrivateIpAddress,PublicIp:PublicIpAddress}" \
  --output table
