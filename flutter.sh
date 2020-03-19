#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION=1.12.13+hotfix.8
FLUTTER_CHECKSUM=cd10bf7410337da3faaa7d104313c920a6553c370f3c827531d78d3c59273306

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
