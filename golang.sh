#!/usr/bin/env bash
set -euxo pipefail

# Adapted from: https://github.com/docker-library/golang/blob/2f6469ffe955721dd25e4cbb3013506659998aad/1.12/stretch/Dockerfile
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

dpkgArch="$(dpkg --print-architecture)"; \
case "${dpkgArch##*-}" in
  amd64) goRelArch='linux-amd64'; goRelSha256='0567734d558aef19112f2b2873caa0c600f1b4a5827930eb5a7f35235219e9d8' ;; \
  armhf) goRelArch='linux-armv6l'; goRelSha256='75f590d8e048a97cbf8b09837b15b3e6b44e1374718a96a5c3a994843ef44a4d' ;; \
  arm64) goRelArch='linux-arm64'; goRelSha256='b46c0235054d0eb69a295a2634aec8a11c7ae19b3dc53556a626b89dc1f8cdb0' ;; \
  i386) goRelArch='linux-386'; goRelSha256='2305c1c46b3eaf574c7b03cfa6b167c199a2b52da85872317438c90074fdb46e' ;; \
  ppc64el) goRelArch='linux-ppc64le'; goRelSha256='4c987b3969d33a93880a218064d2330d7f55c9b58698e78db6b56012058e91a9' ;; \
  s390x) goRelArch='linux-s390x'; goRelSha256='994f961df0d7bdbfa6f7eed604539acf9159444dabdff3ce8e938d095d85f756' ;; \
  *) exit 1 ;;
esac;

wget -q -O go.tgz "https://dl.google.com/go/go1.13.8.${goRelArch}.tar.gz"
echo "${goRelSha256} go.tgz" | sha256sum -c

tar -C /usr/local -xzf go.tgz
rm go.tgz

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 /go



