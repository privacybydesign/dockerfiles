#!/usr/bin/env bash
set -euxo pipefail

org_name="privacybydesign"

dockerfile_path="$1.Dockerfile"
if [ ! -f "$dockerfile_path" ]; then
    echo "Dockerfile not found: $dockerfile_path"
    exit 1
fi

image_name=$(basename "$1")
docker build -t "$org_name/$image_name" -f "$dockerfile_path" .
