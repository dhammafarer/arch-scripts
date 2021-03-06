#!/usr/bin/env bash

echo
echo "MODULE: MEDIA"
echo

# ------------------------------------------------------------------------

PKGS=(
    'cmus'
    'mpv'
    'vlc'
)

# ------------------------------------------------------------------------

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
