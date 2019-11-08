#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  python3 \
  python3-jinja2
rm -rf /var/lib/apt/lists/*
