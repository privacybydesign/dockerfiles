#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl \
  python \
  make \
  g++ \
  bzip2 \
  ca-certificates
rm -rf /var/lib/apt/lists/*

wget -q -O meteor.tar.gz https://static-meteor.netdna-ssl.com/packages-bootstrap/1.10.2/meteor-bootstrap-os.osx.x86_64.tar.gz
echo "0dcdfa4028cb78c900c25eed3e278a507e883315b054a1514dd5cb873392da9e  meteor.tar.gz" | sha256sum -c

mkdir meteor-tmp
tar -xzf meteor.tar.gz -C meteor-tmp -o
mv meteor-tmp/.meteor /var/lib/meteor
rm -rf meteor-tmp

ls -al /var/lib
ls -al /var/lib/meteor

METEOR_SYMLINK_TARGET="$(readlink "/var/lib/meteor/meteor")"
METEOR_TOOL_DIRECTORY="$(dirname "$METEOR_SYMLINK_TARGET")"
LAUNCHER="/var/lib/meteor/$METEOR_TOOL_DIRECTORY/scripts/admin/launch-meteor"

# TODO: The wrapper we copy here gets run in the Dockerfile, but it should be exectued here
# TODO: Running this launcher still makes meteor pull a lot of untrusted shit
cp "$LAUNCHER" /usr/local/bin/meteor
