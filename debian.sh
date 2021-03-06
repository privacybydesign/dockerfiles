#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  wget \
  xz-utils \
  unzip \
  git \
  software-properties-common \
  gnupg
rm -rf /var/lib/apt/lists/*
