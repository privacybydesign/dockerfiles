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

wget -q -O go.tgz "https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz"
echo "$GO_CHECKSUM go.tgz" | sha256sum -c

tar -C /usr/local -xzf go.tgz
rm go.tgz

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 /go



