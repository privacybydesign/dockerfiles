#!/usr/bin/env bash
set -euxo pipefail

# Workaround for https://github.com/golang/go/issues/33859
GO111MODULE=off go get golang.org/x/tools/go/packages

GO111MODULE=off go get golang.org/x/mobile/cmd/gomobile
GO111MODULE=off gomobile init
