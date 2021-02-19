#!/usr/bin/env bash

echo
echo "MODULE: INPUT"
echo

# ------------------------------------------------------------------------
PKGS=(

    'ibus'
    'ibus-libpinyin'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
