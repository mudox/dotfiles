#!/usr/bin/env zsh

whence -vm '*' | grep 'reserved word' | cut -d' ' -f1
