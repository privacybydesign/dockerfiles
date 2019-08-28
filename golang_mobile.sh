#!/usr/bin/env bash
set -euxo pipefail

# Workaround for https://github.com/golang/go/issues/33859
go get golang.org/x/tools/go/packages

go get golang.org/x/mobile/cmd/gomobile
gomobile init
