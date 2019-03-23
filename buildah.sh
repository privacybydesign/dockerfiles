#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  libostree-1-1 \
  libseccomp2 \
  libdevmapper1.02.1 \
  uidmap

wget -q -O /usr/local/bin/runc https://github.com/opencontainers/runc/releases/download/v1.0.0-rc6/runc.amd64
echo "860dbff86558313caf23030f9638d1bcd7a43533f12227628f4abd678eef35c1  /usr/local/bin/runc" | sha256sum -c
chmod +x /usr/local/bin/runc

mkdir /etc/containers
echo '{"default":[{"type":"insecureAcceptAnything"}],"transports":{"docker-daemon":{"":[{"type":"insecureAcceptAnything"}]}}}' > /etc/containers/policy.json

