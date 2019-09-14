#!/usr/bin/env bash

set -e

BOLD_BLUE='\e[0;1;34m'
BOLD_GREEN='\e[0;1;32m'
BOLD_RED='\e[0;1;31m'
BOLD_YELLOW='\e[0;1;33m'

RESET='\e[0m'
DEST="$HOME/.config/nixpkgs"

# Utilities

err() {
    echo -e "${BOLD_RED}$1${RESET}"
}

warn() {
    echo -e "${BOLD_YELLOW}$1${RESET}"
}

info() {
    echo -e "${BOLD_BLUE}$1${RESET}"
}

success() {
    echo -e "${BOLD_GREEN}$1${RESET}"
}

# Installation helpers

update_submodules() {
    info "[+] Updating submodules"
    git submodule update --init --recursive --remote
    success "-> Done updating submodules!"
}

link_config() {
    info "[+] Linking config"

    if [ -e "$DEST" ]; then
        if [ -L "$DEST" ]; then
            warn "Configuration already linked: nothing to be done."
        else
            err "Existing configuration found. Please move it away and run this script again."
        fi

        return
    fi

    ln -svr . "$DEST"
    success "-> Configuration successfully linked!"
}

update_submodules
link_config
