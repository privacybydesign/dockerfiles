#!/usr/bin/env bash
set -euxo pipefail

wget -q -O yarn.deb https://github.com/yarnpkg/yarn/releases/download/v1.13.0/yarn_1.13.0_all.deb
echo "385cb3723583c49e7e8c5eb99196bcaebe57c2b069f793d6f547fbc37c1879ca yarn.deb" | sha256sum -c

dpkg -i yarn.deb
rm yarn.deb