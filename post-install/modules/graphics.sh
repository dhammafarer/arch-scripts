#!/usr/bin/env bash

echo
echo "MODULE: GRAPHICS"
echo

# ------------------------------------------------------------------------
PKGS=(
    'blender'
    'gpick'
    'imagemagick'
    'krita'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done
# ------------------------------------------------------------------------

echo
echo "LINKING CONFIG"
ln -fs /home/pawel/Nextcloud/AppData/.config/krita ~/.config/

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
