#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

for app in "$@"
do
    rm -rf /opt/homebrew-cask/Caskroom/$app
    brew cask install $app
done
