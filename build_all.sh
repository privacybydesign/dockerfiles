#!/usr/bin/env bash
set -euxo pipefail

org_name="privacybydesign"

./debian-downloadrootfs.sh

image_names=(
  debian
  golang golang_dep golang_dep_mobile
  node node_yarn
  java
  android
)

for image_name in "${image_names[@]}"; do
  docker build -t "$org_name/$image_name" -f "$image_name.Dockerfile" .
done
