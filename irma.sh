#!/usr/bin/env bash
set -euxo pipefail

wget -q -O /usr/local/bin/irma https://github.com/privacybydesign/irmago/releases/download/internal-requestors/irma-master-linux-amd64
echo "b5648edadc26bd5cc4ab75a86fa5db9289c59dae263336fd8304a354deb620d0 /usr/local/bin/irma" | sha256sum -c

chmod +x /usr/local/bin/irma
