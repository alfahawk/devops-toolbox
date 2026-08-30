#!/usr/bin/env bash
# Aktif gcloud proje ve GKE cluster context'ini tek komutla ayarlar.
# Kullanım: ./set-context.sh <project-id> <cluster> <zone>
set -euo pipefail

PROJECT="${1:?project-id gerekli}"
CLUSTER="${2:?cluster adı gerekli}"
ZONE="${3:?zone gerekli}"

gcloud config set project "$PROJECT"
gcloud container clusters get-credentials "$CLUSTER" --zone "$ZONE"
