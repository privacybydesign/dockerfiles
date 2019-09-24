#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION=1.9.1+hotfix.2
FLUTTER_CHECKSUM=f82875a865c8dbebd10b7a69ffc4cb19d9c916054f3bbcda5a66395f30477d91

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
