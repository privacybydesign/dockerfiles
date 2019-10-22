#!/usr/bin/env bash
set -euxo pipefail

wget -q -O /usr/local/bin/irma https://github.com/privacybydesign/irmago/releases/download/v0.4.1/irma-master-linux-amd64
echo "34c735c289e4f37d7e5fe1893578f7cdef606ed4f292245672f96516d4f513fb /usr/local/bin/irma" | sha256sum -c

chmod +x /usr/local/bin/irma