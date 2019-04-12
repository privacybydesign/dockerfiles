#!/usr/bin/env bash
set -euxo pipefail

# Adapted from: https://github.com/docker-library/golang/blob/8f2f8502c173fbbcf33fcde5566ca53ad1070ae8/1.12/stretch/Dockerfile
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
  amd64) goRelArch='linux-amd64'; goRelSha256='d7d1f1f88ddfe55840712dc1747f37a790cbcaa448f6c9cf51bbe10aa65442f5' ;;
  armhf) goRelArch='linux-armv6l'; goRelSha256='c43457b6d89016e9b79b92823003fd7858fb02aea22b335cfd204e0b5be71d92' ;;
  arm64) goRelArch='linux-arm64'; goRelSha256='b7d7b4319b2d86a2ed20cef3b47aa23f0c97612b469178deecd021610f6917df' ;;
  i386) goRelArch='linux-386'; goRelSha256='eba5c51f657c1b05d5930475d1723758cd86db74499125ab48f0f9d1863845f7' ;;
  ppc64el) goRelArch='linux-ppc64le'; goRelSha256='51642f3cd6ef9af6c4a092c2929e4fb478f102fe949921bd77ecd6905952c216' ;;
  s390x) goRelArch='linux-s390x'; goRelSha256='0aab0f368c090da71f52531ebac977cc7396b692145acee557b3f9500b42467a' ;;
  *) exit 1 ;;
esac;

wget -q -O go.tgz "https://dl.google.com/go/go1.12.4.${goRelArch}.tar.gz"
echo "${goRelSha256} go.tgz" | sha256sum -c

tar -C /usr/local -xzf go.tgz
rm go.tgz

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 /go



