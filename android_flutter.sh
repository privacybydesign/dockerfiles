#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION=1.7.8+hotfix.4-stable
FLUTTER_CHECKSUM=c7d010c8037e64d2d3e2957f83bd8bee604ff6014230b09b8c043ef039538bd7

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  lib32stdc++6
rm -rf /var/lib/apt/lists/*

wget -q -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v${FLUTTER_VERSION}.tar.xz
echo "${FLUTTER_CHECKSUM} *flutter.tar.xz" | sha256sum -c

tar xf flutter.tar.xz
rm flutter.tar.xz
mv flutter ${FLUTTER_HOME}

flutter config --no-analytics
flutter doctor
flutter precache
