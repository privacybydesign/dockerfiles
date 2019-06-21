#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/5cf98e568d562c62b507ba2b3fbfa1971b0c41e2/stable/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/5cf98e568d562c62b507ba2b3fbfa1971b0c41e2/stable/rootfs.tar.xz"
rootfs_sha256="fe997e7cbdd9080809b2883b2c763ae6df384422148e1cbfd47067f043341c91"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c
