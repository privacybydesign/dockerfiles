#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  bats \
  btrfs-tools \
  libostree-dev \
  libapparmor-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libgpgme11-dev \
  libseccomp-dev \
  libselinux1-dev \
  go-md2man
rm -rf /var/lib/apt/lists/*

# Clone buildah (v1.7.1) without dependencies (as they are vendored)
# and compile with default security options
buildah_repo=github.com/containers/buildah
buildah_commit=93747b1fd5124fdc64344e569b79a8ec49d5f8ae

git clone "https://${buildah_repo}" "$GOPATH/src/${buildah_repo}"
cd "$GOPATH/src/${buildah_repo}"
git checkout "$buildah_commit"

make
cp ./buildah /usr/bin/buildah

# Use a binary release of runc (v1.0.0-rc6)
runc_hash=860dbff86558313caf23030f9638d1bcd7a43533f12227628f4abd678eef35c1

wget -q -O /usr/bin/runc https://github.com/opencontainers/runc/releases/download/v1.0.0-rc6/runc.amd64
echo "860dbff86558313caf23030f9638d1bcd7a43533f12227628f4abd678eef35c1  /usr/bin/runc" | sha256sum -c
chmod +x /usr/bin/runc
