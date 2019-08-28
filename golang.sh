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
  amd64) goRelArch='linux-amd64'; goRelSha256='ac2a6efcc1f5ec8bdc0db0a988bb1d301d64b6d61b7e8d9e42f662fbb75a2b9b' ;; \
  armhf) goRelArch='linux-armv6l'; goRelSha256='0d9be0efa9cd296d6f8ab47de45356ba45cb82102bc5df2614f7af52e3fb5842' ;; \
  arm64) goRelArch='linux-arm64'; goRelSha256='3606dc6ce8b4a5faad81d7365714a86b3162df041a32f44568418c9efbd7f646' ;; \
  i386) goRelArch='linux-386'; goRelSha256='c40824a3e6c948b8ecad8fe9095b620c488b3d8d6694bdd48084a4798db4799a' ;; \
  ppc64el) goRelArch='linux-ppc64le'; goRelSha256='2e74c071c6a68446c9b00c1717ceeb59a826025b9202b3b0efed4f128e868b30' ;; \
  s390x) goRelArch='linux-s390x'; goRelSha256='2aac6de8e83b253b8413781a2f9a0733384d859cff1b89a2ad0d13814541c336' ;; \
  *) exit 1 ;;
esac;

wget -q -O go.tgz "https://dl.google.com/go/go1.12.9.${goRelArch}.tar.gz"
echo "${goRelSha256} go.tgz" | sha256sum -c

tar -C /usr/local -xzf go.tgz
rm go.tgz

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 /go



