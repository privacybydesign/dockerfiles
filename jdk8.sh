#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  openjdk-8-jdk-headless \
  gradle
rm -rf /var/lib/apt/lists/*