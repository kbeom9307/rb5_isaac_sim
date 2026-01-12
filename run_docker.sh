#!/usr/bin/env bash
set -euo pipefail

export BASE_DIR="${BASE_DIR:-${HOME}/docker/isaac-sim}"
export OMNI_KIT_WEBRTC_ENABLE=True
export OMNI_KIT_STREAMING_ENABLE=True   

mkdir -p "${BASE_DIR}/cache/main/ov"
mkdir -p "${BASE_DIR}/cache/main/warp"
mkdir -p "${BASE_DIR}/cache/computecache"
mkdir -p "${BASE_DIR}/config"
mkdir -p "${BASE_DIR}/data/documents"
mkdir -p "${BASE_DIR}/data/Kit"
mkdir -p "${BASE_DIR}/logs"
mkdir -p "${BASE_DIR}/pkg"

sudo chown -R 1234:1234 ${BASE_DIR}

docker compose up -d --build isaac-sim