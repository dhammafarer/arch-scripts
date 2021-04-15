#!/usr/bin/env bash

echo
echo "MODULE: VIRTUAL BOX"
echo

PKGS=(
    'virtualbox-host-modules-arch'
    'virtualbox-guest-iso'
    'vagrant'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
