#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION="1.22.4"
FLUTTER_CHANNEL="stable"
FLUTTER_CHECKSUM="fc23a4747a54d343147c75ee3b4ab2458ce15a4b743b8a246b0de796b67a5461"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  lib32stdc++6
rm -rf /var/lib/apt/lists/*

wget -q -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
echo "${FLUTTER_CHECKSUM}  flutter.tar.xz" | sha256sum -c

tar xf flutter.tar.xz
rm flutter.tar.xz
mv flutter ${FLUTTER_HOME}

flutter config --no-analytics
flutter doctor
flutter precache
