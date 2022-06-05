#!/usr/bin/env zsh
set -euo pipefail

# https://nexte.st/book/pre-built-binaries.html
curl -LsSf https://get.nexte.st/latest/mac | tar zxf - -C ${CARGO_HOME:-~/.cargo}/bin
