#!/usr/bin/env bash
set -euxo pipefail

wget -q -O dep "https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64"
echo "287b08291e14f1fae8ba44374b26a2b12eb941af3497ed0ca649253e21ba2f83 dep" | sha256sum -c

mv dep /usr/local/bin/dep
chmod +x /usr/local/bin/dep
