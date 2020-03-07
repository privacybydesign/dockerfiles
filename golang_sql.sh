#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  mariadb-server
rm -rf /var/lib/apt/lists/*

cat <<EOT >> /etc/mysql/mariadb.conf.d/size.cnf
[mysqld]
innodb_large_prefix = ON
innodb_default_row_format = dynamic
innodb_file_format = Barracuda
EOT
