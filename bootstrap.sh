#!/usr/bin/env bash

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell -p _1password --command "./install.sh"
