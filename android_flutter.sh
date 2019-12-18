#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION=1.12.13+hotfix.5
FLUTTER_CHECKSUM=d792c92895623da35e1a9ccd8bc2fe84c81dd72c2c54073f56fe70625866d800

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  lib32stdc++6
rm -rf /var/lib/apt/lists/*

wget -q -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v${FLUTTER_VERSION}-stable.tar.xz
echo "${FLUTTER_CHECKSUM} *flutter.tar.xz" | sha256sum -c

tar xf flutter.tar.xz
rm flutter.tar.xz
mv flutter ${FLUTTER_HOME}

flutter config --no-analytics
flutter doctor
flutter precache
