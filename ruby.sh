#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ruby \
  ruby-dev \
  build-essential
rm -rf /var/lib/apt/lists/*

gem install --no-document \
  bundler
