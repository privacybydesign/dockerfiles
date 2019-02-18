#!/usr/bin/env bash
set -euxo pipefail

wget -q -O node.tar.xz https://nodejs.org/download/release/latest-v10.x/node-v10.15.1-linux-x64.tar.xz
echo "77db68544c7812e925b82ccc41cd4669fdeb191cea8e20053e3f0e86889c4fce node.tar.xz" | sha256sum -c

tar -xJf node.tar.xz --strip-components=1 --wildcards -C /usr/local '*/bin' '*/include' '*/lib' '*/share'
rm node.tar.xz