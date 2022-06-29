#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  openjdk-17-jdk-headless \
  gradle
apt-get clean
rm -rf /var/lib/apt/lists/*
