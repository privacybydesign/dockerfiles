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
curr_tag_version=$(docker inspect "$tag_name:latest" --format '{{ index .Config.Labels "version" }}' || echo "")

docker build -t "$tag_name:latest" -f "$dockerfile_path" .

# Add version tag if Dockerfile is labelled with a version.
new_tag_version=$(docker inspect "$tag_name:latest" --format '{{ index .Config.Labels "version" }}')
if [ -n "$new_tag_version" ]; then
  docker tag "$tag_name:latest" "$tag_name:$new_tag_version"

  # Only preserve the latest and the previous image.
  if [ -n "$curr_tag_version" ] && [ "$new_tag_version" != "$curr_tag_version" ]; then
    # Remove image using hash to make sure it not untagged only.
    docker rmi -f $(docker images -q "$tag_name:previous") || echo "No previous image present"
    docker tag "$tag_name:$curr_tag_version" "$tag_name:previous"
  fi
fi
