#!/usr/bin/env bash
set -euo pipefail

# https://github.com/debuerreotype/docker-debian-artifacts/blob/a5e61a4c40a4b366d614715c51f883e0b153afb5/stretch/Dockerfile
rootfs_url="https://github.com/debuerreotype/docker-debian-artifacts/raw/3e751c2c2f60037e9231ed94bbd1f95347af2c87/stretch/rootfs.tar.xz"
rootfs_sha256="bce1c89311f017322830178228e1f7e074debca10255552a98daff924f457033"

rootfs_path="${BASH_SOURCE%/*}/debian-rootfs.tar.xz"
if [ ! -f "$rootfs_path" ]; then
  wget -O "$rootfs_path" "$rootfs_url"
fi

echo "$rootfs_sha256 ${rootfs_path}" | sha256sum -c
