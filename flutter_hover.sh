#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  libgl1-mesa-dev xorg-dev
rm -rf /var/lib/apt/lists/*

go get -u github.com/go-flutter-desktop/hover

