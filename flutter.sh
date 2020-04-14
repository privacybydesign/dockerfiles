#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION=1.17.0-dev.3.1
FLUTTER_CHANNEL=beta
FLUTTER_CHECKSUM=16d996182bd4d182cf8d7e3f433a0ae9d0cd615e4fef6a11efa9281800538b13

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
