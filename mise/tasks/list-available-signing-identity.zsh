#!/usr/bin/env zsh
#MISE description='macos: list available signing idenities'

security find-identity -v -p codesigning
