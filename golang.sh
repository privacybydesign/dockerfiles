#!/usr/bin/env bash
set -euxo pipefail

# Adapted from: https://github.com/docker-library/golang/blob/master/1.14/stretch/Dockerfile
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  g++ \
  gcc \
  git \
  libc6-dev \
  make \
  openssh-client \
  pkg-config \
  procps \
  wget
rm -rf /var/lib/apt/lists/*

wget -q -O go.tgz "https://golang.org/dl/go1.16.6.linux-amd64.tar.gz"
echo "be333ef18b3016e9d7cb7b1ff1fdb0cac800ca0be4cf2290fe613b3d069dfe0d go.tgz" | sha256sum -c

tar -C /usr/local -xzf go.tgz
rm go.tgz

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 /go



