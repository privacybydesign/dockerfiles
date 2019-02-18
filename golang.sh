#!/usr/bin/env bash
set -euxo pipefail

# Adapted from: https://github.com/docker-library/golang/blob/2e795f515357c575359f0720acaf7f5490f8bcf5/1.11/stretch/Dockerfile
apt-get update
apt-get install -y --no-install-recommends \
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

dpkgArch="$(dpkg --print-architecture)"; \
case "${dpkgArch##*-}" in
  amd64) goRelArch='linux-amd64'; goRelSha256='ff54aafedff961eb94792487e827515da683d61a5f9482f668008832631e5d25' ;;
  armhf) goRelArch='linux-armv6l'; goRelSha256='b26b53c94923f78955236386fee0725ef4e76b6cb47e0df0ed0c0c4724e7b198' ;;
  arm64) goRelArch='linux-arm64'; goRelSha256='6ee9a5714444182a236d3cc4636e74cfc5e24a1bacf0463ac71dcf0e7d4288ed' ;;
  i386) goRelArch='linux-386'; goRelSha256='acd8e05f8d3eed406e09bb58eab89de3f0a139d4aef15f74adeed2d2c24cb440' ;;
  ppc64el) goRelArch='linux-ppc64le'; goRelSha256='66e83152c68cb35d41f21453377d6a811585c9e01a6ac54b19f7a6e2cbb3d1f5' ;;
  s390x) goRelArch='linux-s390x'; goRelSha256='56209e5498c64a8338cd6f0fe0c2e2cbf6857c0acdb10c774894f0cc0d19f413' ;;
  *) exit 1 ;;
esac;

wget -q -O go.tgz "https://dl.google.com/go/go1.11.5.${goRelArch}.tar.gz"
echo "${goRelSha256} go.tgz" | sha256sum -c

tar -C /usr/local -xzf go.tgz
rm go.tgz

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 /go



