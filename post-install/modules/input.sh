#!/usr/bin/env bash

echo
echo "MODULE: INPUT"
echo

# ------------------------------------------------------------------------
PKGS=(
  'fcitx5'
  'fcitx5-configtool'
  'fcitx5-rime'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
