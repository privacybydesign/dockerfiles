#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/7a4fe39587941f207bf42ae4514f8d28d2352f69/stretch/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/7a4fe39587941f207bf42ae4514f8d28d2352f69/stretch/rootfs.tar.xz"
rootfs_sha256="6f540d2582264157b3c63f04099b34f10f218a60da63feaec42202107d896127"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c
