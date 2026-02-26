#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(git -C "${SCRIPT_DIR}" rev-parse --show-toplevel 2>/dev/null || printf '%s' "${SCRIPT_DIR}")"
PUBLIC_IP="$(curl -s ifconfig.me)"

export BASE_DIR="${BASE_DIR:-${REPO_DIR}}"
export OMNI_KIT_WEBRTC_ENABLE=True
export OMNI_KIT_STREAMING_ENABLE=True
export PUBLIC_IP="${PUBLIC_IP}"

mkdir -p "${BASE_DIR}"
mkdir -p "${BASE_DIR}/cache/main/ov"
mkdir -p "${BASE_DIR}/cache/main/warp"
mkdir -p "${BASE_DIR}/cache/computecache"
mkdir -p "${BASE_DIR}/config"
mkdir -p "${BASE_DIR}/data/documents"
mkdir -p "${BASE_DIR}/data/Kit"
mkdir -p "${BASE_DIR}/logs"
mkdir -p "${BASE_DIR}/pkg"

sudo chown -R 1234:1234 "${BASE_DIR}"

docker compose up -d --build isaac-sim
