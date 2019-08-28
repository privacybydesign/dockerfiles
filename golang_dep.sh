#!/usr/bin/env bash
set -euxo pipefail

wget -q -O dep "https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64"
echo "40a78c13753f482208d3f4bea51244ca60a914341050c588dad1f00b1acc116c dep" | sha256sum -c

mv dep /usr/local/bin/dep
chmod +x /usr/local/bin/dep
