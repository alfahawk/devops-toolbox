#!/usr/bin/env bash
# GKE node pool'u belirtilen boyuta ölçekler.
# Kullanım: ./node-pool-scale.sh <cluster> <pool> <size> <zone>
set -euo pipefail

CLUSTER="${1:?cluster adı gerekli}"
POOL="${2:?pool adı gerekli}"
SIZE="${3:?boyut gerekli}"
ZONE="${4:?zone gerekli}"

gcloud container clusters resize "$CLUSTER" \
  --node-pool "$POOL" \
  --num-nodes "$SIZE" \
  --zone "$ZONE" \
  --quiet
