#!/usr/bin/env bash

echo
echo "MODULE: AUR"
echo

# ------------------------------------------------------------------------

cd "${HOME}"

echo "CLONING: YAY"
git clone https://aur.archlinux.org/yay.git

cd ${HOME}/yay
makepkg -si
cd "${HOME}" && rm -rf ${HOME}/yay

PKGS=(

    'jmtpfs'
    'pyradio'
    'volnoti'
)

for PKG in "${PKGS[@]}"; do
    yay -S $PKG
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
