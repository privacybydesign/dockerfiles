#!/usr/bin/env bash
set -euxo pipefail

# Adapted from: https://github.com/docker-library/golang/blob/8f2f8502c173fbbcf33fcde5566ca53ad1070ae8/1.12/stretch/Dockerfile
apt-get update
apt-get install -y --no-install-recommends \
  ruby \
  ruby-dev \
  build-essential
rm -rf /var/lib/apt/lists/*

gem install --no-document \
  bundler