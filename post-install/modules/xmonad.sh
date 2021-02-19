#!/usr/bin/env bash

echo
echo "INSTALLING XMONAD"
echo

# ------------------------------------------------------------------------

PKGS=(
        'xmonad'
        'xmonad-contrib'
        'xmobar'
        'stalonetray'
        'lightdm'
        'lightdm-gtk-greeter'
        'kupfer'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "LINKING CONFIGURATION"
ln -fs /home/pawel/arch-scripts/dotfiles/.xmonad ~
xmonad --recompile

# ------------------------------------------------------------------------

echo
echo "Enabling LightDM"

sudo systemctl enable lightdm.service

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
