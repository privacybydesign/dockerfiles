#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
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

# Clone buildah (1.7.1) without dependencies (as they are vendored)
repo_name=github.com/containers/buildah
repo_commit=93747b1fd5124fdc64344e569b79a8ec49d5f8ae

git clone "https://${repo_name}" "$GOPATH/src/${repo_name}"
cd "$GOPATH/src/${repo_name}"
git checkout "$repo_commit"

# Compile with default security options
make runc all
cp ./buildah /go/bin/
