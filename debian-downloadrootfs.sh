#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/a5e61a4c40a4b366d614715c51f883e0b153afb5/stretch/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/a5e61a4c40a4b366d614715c51f883e0b153afb5/stretch/rootfs.tar.xz"
rootfs_sha256="a85700a420b0478d70c6aa5d0729b3cbbe692b7d068d00cc9b98324af0416114"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c