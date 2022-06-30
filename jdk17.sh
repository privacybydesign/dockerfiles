#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl openjdk-17-jdk-headless unzip
apt-get clean
rm -rf /var/lib/apt/lists/*

curl -sLo/tmp/gradle.zip https://services.gradle.org/distributions/gradle-7.4.2-bin.zip
unzip -d /opt/ /tmp/gradle.zip

cat > /etc/profile.d/gradle.sh <<EOD
if ! echo ${PATH} | grep -q gradle
then
   PATH=${PATH}:/opt/gradle-7.4.2/bin
fi
EOD
chmod 755 /etc/profile.d/gradle.sh
