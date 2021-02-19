#!/usr/bin/env bash

echo
echo "MODULE: GRAPHICS"
echo

# ------------------------------------------------------------------------
PKGS=(
    'blender'
    'gpick'
    'imagemagick'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done
# ------------------------------------------------------------------------

echo
echo "Done!"
echo
