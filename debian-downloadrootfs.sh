#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/6032f248d825fd35e8b37037b26dc332e4659c64/bullseye/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/6032f248d825fd35e8b37037b26dc332e4659c64/bullseye/rootfs.tar.xz"
rootfs_sha256="2451c7a42ef558a8717ba9586c6b8f62384f9e05a6d6645140f1d7f96ce27aa5"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c
