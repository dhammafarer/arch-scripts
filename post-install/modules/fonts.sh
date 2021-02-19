#!/usr/bin/env bash

echo
echo "MODULE: FONTS"
echo

PKGS=(
        'ttf-ubuntu-font-family'
        'ttf-dejavu'
        'ttf-fira-code'
        'ttf-fira-mono'
        'ttf-fira-sans'
        'noto-fonts-cjk'
        'ttf-font-awesome'
        'powerline-fonts'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo "SETTING UP FONTS"
sudo ln -fs /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -fs /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -fs /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sudo cp ~/arch-scripts/post-install/modules/files/etc-fonts-local.conf /etc/fonts/local.conf
sudo vim /etc/profile.d/freetype2.sh

echo
echo "Done!"
echo
