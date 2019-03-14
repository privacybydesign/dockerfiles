#!/usr/bin/env bash
set -euxo pipefail

PACKAGE_NAME=github.com/privacybydesign/irmago
ORG_NAME=$(dirname "$PACKAGE_NAME")

mkdir -p "$GOPATH/src/$ORG_NAME"
git clone https://$PACKAGE_NAME.git "$GOPATH/src/$PACKAGE_NAME"

cd "$GOPATH/src/$PACKAGE_NAME"
dep ensure -v
go install ./irma

