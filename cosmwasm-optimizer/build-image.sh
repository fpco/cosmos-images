#!/usr/bin/env bash

set -euo pipefail

GIT_SHA=$(git rev-parse HEAD)
IMAGE_NAME=ghcr.io/fpco/cosmos-images/cosmwasm-optimizer:"$GIT_SHA"

WORK_DIR=$(mktemp -d -p /tmp)

git clone https://github.com/CosmWasm/optimizer "$WORK_DIR"
cd "$WORK_DIR"
git checkout 4dedb39736d34f27cd799f222a30a4f1b230fb12 # v0.16.1

sed -i 's/1\.81/1.84/g' Dockerfile
docker build -t "$IMAGE_NAME" .
