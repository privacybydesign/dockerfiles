#!/usr/bin/env bash
set -euxo pipefail

apt-get update
# apt-get install -y --no-install-recommends \
#   libostree-1-1 \
#   libseccomp2 \
#   libdevmapper1.02.1 \
#   uidmap

# Add /etc/containers/registries.conf
# For example from: https://raw.githubusercontent.com/projectatomic/registries/master/registries.fedora

mkdir /etc/containers
echo '{"default":[{"type":"insecureAcceptAnything"}],"transports":{"docker-daemon":{"":[{"type":"insecureAcceptAnything"}]}}}' > /etc/containers/policy.json

