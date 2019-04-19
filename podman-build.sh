#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  btrfs-tools \
  go-md2man \
  iptables \
  libassuan-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libc6-dev \
  libgpgme11-dev \
  libgpg-error-dev \
  libostree-dev \
  libprotobuf-dev \
  libprotobuf-c0-dev \
  libseccomp-dev \
  libselinux1-dev \
  pkg-config

# TODO: What about libarmor (optional (runtime?) dependency)

# Clone podman (v1.1.2) without dependencies (as they are vendored)
podman_repo_name=github.com/containers/libpod
podman_commit=0ad9b6bf2aea4ba37e8c9738feabec61343ba175

git clone "https://${podman_repo_name}" "$GOPATH/src/${podman_repo_name}"
cd "$GOPATH/src/${podman_repo_name}"
git checkout "$podman_commit"

make
cp ./bin/podman /usr/bin/podman

# Use a binary release of runc (v1.0.0-rc6)
runc_hash=860dbff86558313caf23030f9638d1bcd7a43533f12227628f4abd678eef35c1

wget -q -O /usr/bin/runc https://github.com/opencontainers/runc/releases/download/v1.0.0-rc6/runc.amd64
echo "${runc_hash}  /usr/bin/runc" | sha256sum -c
chmod +x /usr/bin/runc

# Build CNI plugins
cniplugins_repo_name=github.com/containernetworking/plugins
cniplugins_commit=a62711a5da7a2dc2eb93eac47e103738ad923fd6

git clone "https://${cniplugins_repo_name}.git" "$GOPATH/src/${cniplugins_repo_name}"
cd "$GOPATH/src/${cniplugins_repo_name}"
git checkout "$cniplugins_commit"

./build_linux.sh
mkdir -p /usr/libexec/cni
sudo cp bin/* /usr/libexec/cni

# Build conmon from the containers org (normally part of cri-o)
conmon_commit=84c860029893e2e2dd71d62231f009c9dcd3c0b4

git clone https://github.com/containers/conmon /conmon
cd /conmon
git checkout "$conmon_commit"

make
mkdir -p /usr/libexec/podman
cp ./bin/conmon /usr/libexec/podman/conmon

# TODO: slirp4netns (needs autoconf)
