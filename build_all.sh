#!/usr/bin/env bash
set -euxo pipefail

./debian-downloadrootfs.sh

image_names=(
  debian
  golang golang_dep golang_dep_mobile
  node node_yarn
  ruby
  android android_flutter
)

for image_name in "${image_names[@]}"; do
    ./build_one.sh "$image_name"
done
