#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

for app in "$@"
do
    brew cask uninstall --force $app
    rm -rf /usr/local/Caskroom/$app
    brew cask install $app
done
