#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/18cb4d0418be1c80fb19141b69ac2e0600b2d601/buster/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/18cb4d0418be1c80fb19141b69ac2e0600b2d601/buster/rootfs.tar.xz"
rootfs_sha256="e7d3a00b8dbf97e6dcb22b00ca9248cc2bf59d1a2107001a3ebf7cfb99542a1a"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c
