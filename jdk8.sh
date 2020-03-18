#!/usr/bin/env bash
set -euxo pipefail

wget -q -O /dockerfiles/adoptopenjdk.key https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public
echo "428ce45ffbc74e350d707d95c661de959a2e43129a869bd82d78d1556a936440 /dockerfiles/adoptopenjdk.key" | sha256sum -c

apt-key add /dockerfiles/adoptopenjdk.key
add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  adoptopenjdk-8-hotspot \
  gradle
rm -rf /var/lib/apt/lists/*
