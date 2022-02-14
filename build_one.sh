#!/usr/bin/env bash
set -euxo pipefail

org_name="privacybydesign"

dockerfile_path="$1.Dockerfile"
if [ ! -f "$dockerfile_path" ]; then
    echo "Dockerfile not found: $dockerfile_path"
    exit 1
fi

image_name=$(basename "$1")
tag_name="$org_name/$image_name"
docker build -t "$tag_name:latest" -f "$dockerfile_path" .

# Add version tag if Dockerfile is labelled with a version.
tag_version=$(docker inspect "$tag_name:latest" --format '{{ index .Config.Labels "version" }}')
if [ -n "$tag_version" ]; then
  docker tag "$tag_name:latest" "$tag_name:$tag_version"
fi
