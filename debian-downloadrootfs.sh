#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/d6eeda93542f8e2a7d5f6e500b58fc4f12d055ce/buster/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/d6eeda93542f8e2a7d5f6e500b58fc4f12d055ce/buster/rootfs.tar.xz"
rootfs_sha256="ede91c08bebcd7473af33fce173fba4218e460429909e791ab10be459e5079e4"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c
