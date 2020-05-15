set -eux

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude
echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive aptitude install -y ~pimportant ~pstandard
