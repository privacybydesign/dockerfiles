#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  wget \
  xz-utils \
  unzip

rm -rf /var/lib/apt/lists/*