#!/usr/bin/env bash

set -e

ROFI_FLAGS='-matching fuzzy -theme base16-dracula -i -auto-select'
LAYOUTS='us|us intl'

SELECTED_LAYOUT="$(echo ${LAYOUTS}|rofi -dmenu -sep '|' ${ROFI_FLAGS} -p 'Select keyboard layout')"

setxkbmap $(eval echo ${SELECTED_LAYOUT})
