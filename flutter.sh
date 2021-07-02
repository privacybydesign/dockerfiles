#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION="2.2.3"
FLUTTER_CHANNEL="stable"
FLUTTER_CHECKSUM="66a271aa9f4286596841f5c89fd5d22e4ae0042127459e88d5650ca989ba948d"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  lib32stdc++6
rm -rf /var/lib/apt/lists/*

wget -q -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
echo "${FLUTTER_CHECKSUM}  flutter.tar.xz" | sha256sum -c

tar xf flutter.tar.xz
rm flutter.tar.xz
mv flutter ${FLUTTER_HOME}

flutter config --no-analytics
flutter doctor
flutter precache
