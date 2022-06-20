#!/usr/bin/env bash
set -euxo pipefail

go install golang.org/x/mobile/cmd/gomobile@latest
gomobile init
