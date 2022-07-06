#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl openjdk-17-jdk-headless unzip
apt-get clean
rm -rf /var/lib/apt/lists/*

curl -sLo/tmp/gradle.zip https://services.gradle.org/distributions/gradle-7.4.2-bin.zip
echo '29e49b10984e585d8118b7d0bc452f944e386458df27371b49b4ac1dec4b7fda /tmp/gradle.zip' | sha256sum -c
unzip -d /opt/ /tmp/gradle.zip

cd /opt/gradle-7.4.2/
for dir in `ls | egrep '^bin$|^sbin$|^etc$|^include$|^lib$|^lib64$|^libexec$|^share$'`
do
    for target in `ls $dir`
    do
        test -d /usr/$dir || mkdir /usr/$dir
        ln -fs `pwd`/$dir/$target /usr/$dir
    done
done
