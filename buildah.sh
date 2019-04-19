#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  libostree-1-1 \
  libseccomp2 \
  libdevmapper1.02.1 \
  uidmap \
  xz-utils

mkdir /etc/containers
echo '{"default":[{"type":"insecureAcceptAnything"}],"transports":{"docker-daemon":{"":[{"type":"insecureAcceptAnything"}]}}}' > /etc/containers/policy.json

