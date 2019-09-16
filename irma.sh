#!/usr/bin/env bash
set -euxo pipefail

wget -q -O /usr/local/bin/irma https://github.com/privacybydesign/irmago/releases/download/v0.3.1/irma-master-linux-amd64
echo "f74bbafef1b37b954f233adb526c67cf3005b2fa9585cd0f8246054a85a5e7ba /usr/local/bin/irma" | sha256sum -c

chmod +x /usr/local/bin/irma