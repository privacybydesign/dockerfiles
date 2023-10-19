#!/usr/bin/env bash
set -euxo pipefail

./debian-downloadrootfs.sh

image_names=(
  debian
  golang
  node node_yarn node_yarn_python3
  ruby
  python3
  jdk11 jdk17
  irma
)

for image_name in "${image_names[@]}"; do
    ./build_one.sh "$image_name"
done

# Remove all dangling images to save disk space.
docker system prune -f
