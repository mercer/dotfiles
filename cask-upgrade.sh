#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

for app in "$@"
do
    brew cask reinstall $app
done
