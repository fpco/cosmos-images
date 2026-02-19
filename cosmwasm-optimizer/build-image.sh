#!/usr/bin/env bash

set -euo pipefail

GIT_SHA=$(git rev-parse HEAD)
IMAGE_NAME=ghcr.io/fpco/cosmos-images/cosmwasm-optimizer:"$GIT_SHA"

WORK_DIR=$(mktemp -d -p /tmp)

git clone https://github.com/CosmWasm/optimizer "$WORK_DIR"

patch_path="$(realpath 1539cd8-1.93.1.patch)"
cd "$WORK_DIR"
git checkout 1539cd865630d618df5246c35064078552194560 # v0.17.0

git apply "${patch_path}"

docker build -t "$IMAGE_NAME" .
