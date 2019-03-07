#!/usr/bin/env bash
set -euxo pipefail

wget -q -O node.tar.xz https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.xz
echo "faddbe418064baf2226c2fcbd038c3ef4ae6f936eb952a1138c7ff8cfe862438 node.tar.xz" | sha256sum -c

tar -xJf node.tar.xz --strip-components=1 --wildcards -C /usr/local '*/bin' '*/include' '*/lib' '*/share'
rm node.tar.xz