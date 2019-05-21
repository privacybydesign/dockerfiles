#!/usr/bin/env bash
set -euxo pipefail

wget -q -O /usr/local/bin/irma https://github.com/privacybydesign/irmago/releases/download/v0.2.0/irma-master-linux-amd64
echo "bbe5f9d1fdd1e2eeac04b86417c65abfbd4e84237fb76176b921835d4d03f9d5 /usr/local/bin/irma" | sha256sum -c

chmod +x /usr/local/bin/irma