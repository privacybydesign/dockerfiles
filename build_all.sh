#!/usr/bin/env bash
set -euxo pipefail

./debian-downloadrootfs.sh

image_names=(
  debian
  golang golang_dep golang_dep_mobile
  node node_yarn
  ruby
  python3
  jdk8
  irma
  android android_golang_dep_mobile android_golang_dep_mobile_node_yarn android_golang_dep_mobile_flutter
)

for image_name in "${image_names[@]}"; do
    ./build_one.sh "$image_name"
done
