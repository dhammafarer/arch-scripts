#!/usr/bin/env bash

echo
echo "MODULE: ARBITES"
echo

# ------------------------------------------------------------------------

PKGS=(
    'java-rxtx'
    'mono'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "ADDING USER TO GROUPS"

sudo usermod -a -G uucp lock pawel

# ------------------------------------------------------------------------

echo
echo "Done!"

echo
